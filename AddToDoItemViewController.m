//
//  AddToDoItemViewController.m
//  myApp
//
//  Created by My_Mac on 16/3/18.
//  Copyright © 2016年 My_Mac. All rights reserved.
//

#import "AddToDoItemViewController.h"

@interface AddToDoItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation AddToDoItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.doneButton.isAccessibilityElement = true;
//    self.doneButton.accessibilityTraits = UIAccessibilityTraitButton;
//    self.doneButton.accessibilityLabel = @"doneButtonLabel";
//    self.doneButton.accessibilityIdentifier = @"doneButtonID";
//    
//    
//    self.cancelButton.isAccessibilityElement = true;
//    self.cancelButton.accessibilityTraits = UIAccessibilityTraitButton;
//    self.cancelButton.accessibilityLabel = @"cancelButtonLabel" ;
//    self.cancelButton.accessibilityIdentifier = @"cancelButtonID";
    // Do any additional setup after loading the view.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    if (self.textField.text.length > 0) {
        self.toDoItem = [[TodoItem alloc] init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
