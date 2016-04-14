//
//  myAppUITests.m
//  myAppUITests
//
//  Created by My_Mac on 16/3/16.
//  Copyright © 2016年 My_Mac. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface myAppUITests : XCTestCase {
  XCUIApplication *app;
  NSTimeInterval waitForElementAppearTimeInterval;
}

@end

@implementation myAppUITests

- (void)setUp {
  [super setUp];

  // Put setup code here. This method is called before the invocation of each
  // test method in the class.

  // In UI tests it is usually best to stop immediately when a failure occurs.
  self.continueAfterFailure = NO;
  // UI tests must launch the application that they test. Doing this in setup
  // will make sure it happens for each test method.
  waitForElementAppearTimeInterval = 5;
  app = [[XCUIApplication alloc] init];
  [app launch];
  // In UI tests it’s important to set the initial state - such as interface
  // orientation - required for your tests before they run. The setUp method is
  // a good place to do this.
}

- (void)tearDown {
  // Put teardown code here. This method is called after the invocation of each
  // test method in the class.
  [super tearDown];
}

- (void)testExample {
}

- (void)testSelected {

  XCUIElementQuery *tablesQuery = app.tables;

  int count = (int)app.tables.cells.count;
  for (int i = 0; i < count; i++) {

    XCUIElement *cell =
        tablesQuery.cells.allElementsBoundByAccessibilityElement[i];
    BOOL isSelected = cell.isSelected;
    [cell tap];
    XCTAssertEqual(cell.isSelected, !isSelected);
  }
}

- (void)testAdd {

  int count = (int)app.tables.cells.count;

  NSPredicate *existPredicate =
      [NSPredicate predicateWithFormat:@"exists == true"];
  XCUIElement *addButton = app.buttons[@"Add"];

  [self expectationForPredicate:existPredicate
            evaluatedWithObject:addButton
                        handler:nil];

  [self waitForExpectationsWithTimeout:waitForElementAppearTimeInterval
                               handler:nil];
  [addButton tap];

  XCUIElement *textField = app.textFields[@"new todo -item"];

  [self expectationForPredicate:existPredicate
            evaluatedWithObject:textField
                        handler:nil];

  [self waitForExpectationsWithTimeout:waitForElementAppearTimeInterval
                               handler:nil];
  [textField tap];

  [textField typeText:@"Workout"];
  [app.buttons[@"done"] tap];

  XCTAssertEqual(count + 1, app.tables.cells.count);
}

- (void)testDelete {

  XCUIElementQuery *tablesQuery = app.tables;
  int count = (int)tablesQuery.cells.count;
  XCUIElement *cell =
      tablesQuery.cells.allElementsBoundByAccessibilityElement[0];

  XCTAssertNotNil(cell);

  [cell swipeLeft];

  NSPredicate *existPredicate =
      [NSPredicate predicateWithFormat:@"exists == true"];
  XCUIElement *deleteButton = tablesQuery.buttons[@"Delete"];

  [self expectationForPredicate:existPredicate
            evaluatedWithObject:deleteButton
                        handler:nil];

  [self waitForExpectationsWithTimeout:waitForElementAppearTimeInterval
                               handler:nil];
  [deleteButton tap];

  XCTAssertEqual(count - 1, tablesQuery.cells.count);
}

- (void)testCancel {
  NSPredicate *existPredicate =
      [NSPredicate predicateWithFormat:@"exists == true"];
  XCUIElement *addButton = app.buttons[@"Add"];
  [self expectationForPredicate:existPredicate
            evaluatedWithObject:addButton
                        handler:nil];
  [self waitForExpectationsWithTimeout:waitForElementAppearTimeInterval
                               handler:nil];
  [addButton tap];

  XCUIElement *textField = app.textFields[@"new todo -item"];

  [self expectationForPredicate:existPredicate
            evaluatedWithObject:textField
                        handler:nil];
  [self waitForExpectationsWithTimeout:waitForElementAppearTimeInterval
                               handler:nil];
  [textField tap];

  [textField typeText:@"中文test123"];
  [app.buttons[@"cancel"] tap];
}

@end
