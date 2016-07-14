//
//  SQLite.h
//  SqliteFrameworkProject
//
//  Created by Sagar Shirbhate on 7/13/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SQLite : NSObject


/**
 *  Singletone Class - It Will be initializa once and Use Any where.
 *
 *  @return Sqlite classs instance
 */
+ (id) sharedInstance;


/**
 *  This method Create the Database file into document folder of app. If Database file Alredy Present In App with same name then it will not create new file.
 *
 *  @param fileName database File Name which you want to Use
 *
 *  @return Returns True/false
 */
-(BOOL)createDatabaseWithFileNameWithNoExtension:(NSString*)fileName;


/**
 *  Pass an Query Where the multiple rows/Single row is comming through result Like Select Statement or using Where Clause etc..
 *
 *  @param query Query you want to be used.
 *
 *  @return Returns array Of All data which comes under that Query And Array Comes With Dictionaries having key Value Pair
 */
-(NSArray *)getDataFromQuery:(NSString*)query;



/**
 *  This will execute only query like INSERT/UPDATE/DELETE
 *
 *  @param query Query you want to be used.
 *
 *  @return Returns True/false
 */
-(BOOL)executeQuery:(NSString*)query;



@end
