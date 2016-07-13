//
//  ViewController.m
//  SqliteFrameworkProject
//
//  Created by Sagar Shirbhate on 7/13/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize Database With Faile Name
    [[SQLite sharedInstance] createDatabaseWithFileNameWithNoExtension:@"DB"];
    
    // Create Database
    [[SQLite sharedInstance] executeQuery:@"CREATE TABLE PROPERTIES ( PROPERTY_ID INTEGER PRIMARY KEY,PROPERTY_NAME TEXT NOT NULL);"];
    
    //Insert Query
    [[SQLite sharedInstance] executeQuery:@"INSERT INTO PROPERTIES ( PROPERTY_ID,PROPERTY_NAME) VALUES( '1','Sagar')"];
    [[SQLite sharedInstance] executeQuery:@"INSERT INTO PROPERTIES ( PROPERTY_ID,PROPERTY_NAME) VALUES( '2','Chandan')"];
    [[SQLite sharedInstance] executeQuery:@"INSERT INTO PROPERTIES ( PROPERTY_ID,PROPERTY_NAME) VALUES( '3','Vishal')"];
    [[SQLite sharedInstance] executeQuery:@"INSERT INTO PROPERTIES ( PROPERTY_ID,PROPERTY_NAME) VALUES( '4','Akash')"];
    [[SQLite sharedInstance] executeQuery:@"INSERT INTO PROPERTIES ( PROPERTY_ID,PROPERTY_NAME) VALUES( '5','Rushi')"];
    
    // Update Query
    [[SQLite sharedInstance] executeQuery:@"INSERT OR REPLACE INTO PROPERTIES ( PROPERTY_ID,PROPERTY_NAME) VALUES( 'Paa','Rushi')"];
    
    //Delete Query
    [[SQLite sharedInstance] executeQuery:@"DELETE FROM PROPERTIES WHERE PROPERTY_NAME = 'Vishal'"];
    
    
    // Get The data from Database
    NSArray * arr = [[SQLite sharedInstance] getDataFromQuery:@"SELECT * FROM PROPERTIES"];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
