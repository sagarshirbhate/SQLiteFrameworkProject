//
//  SQLite.m
//  SqliteFrameworkProject
//
//  Created by Sagar Shirbhate on 7/13/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import "SQLite.h"
#import "FMDatabase.h"
@implementation SQLite

{
    FMDatabase * database;
}

static SQLite *singletonObject = nil;

/**
 *  Singletone Class - It Will be initializa once and Use Any where.
 *
 *  @return Sqlite classs instance
 */

+ (id) sharedInstance{
    if (! singletonObject) {
        
        singletonObject = [[SQLite alloc] init];
    }
    return singletonObject;
}
/**
 *  Initialization Method Where the classes inside the Framework Got Memory
 *
 *  @return Self
 */
- (instancetype)init{
    if (! singletonObject) {
        singletonObject = [super init];
    }
    return singletonObject;
}

/**
 *  This method Create the Database file into document folder of app. If Database file Alredy Present In App with same name then it will not create new file.
 *
 *  @param fileName database File Name which you want to Use
 *
 *  @return Returns True/false
 */
-(BOOL)createDatabaseWithFileNameWithNoExtension:(NSString*)fileName{
    BOOL created = NO;
    //FOR CREATING OR LOADING FILE
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * docsPath = [paths objectAtIndex:0];
    NSString * name =[NSString stringWithFormat:@"%@.sqlite",fileName];
    NSString * path = [docsPath stringByAppendingPathComponent:name];
    database = [FMDatabase databaseWithPath:path];
    [database open];
    if (database!=nil) {
        created=YES;
    }else{
         created=NO;
    }
    [database close];
    return created;
}


/**
 *  Pass an Query Where the multiple rows/Single row is comming through result Like Select Statement or using Where Clause etc..
 *
 *  @param query Query you want to be used.
 *
 *  @return Returns array Of All data which comes under that Query And Array Comes With Dictionaries having key Value Pair
 */
-(NSArray *)getDataFromQuery:(NSString*)query{
    //FOR RETRIVING DATA
    [database open];
    FMResultSet * results = [database executeQuery:query];
    NSMutableArray *dataArray = [[NSMutableArray alloc]init];//IN THAT ARRAY RESULT IS STORED
    int f =0;
    while ([results next]){
        [dataArray insertObject:[results resultDictionary] atIndex:f];
        f++;
    }
    NSLog(@"a  : %@",dataArray);
   
    if ([database hadError]) {
        NSLog(@"DB Error %d: %@", [database lastErrorCode], [database lastErrorMessage]);
    }
    [database close];
    return dataArray;
}



/**
 *  This will execute only query like INSERT/UPDATE/DELETE
 *
 *  @param query Query you want to be used.
 *
 *  @return Returns True/false
 */
-(BOOL)executeQuery:(NSString*)query{
    [database open];
    BOOL Y = [database executeUpdate:query];
    [database close];
    return Y;
}


@end
