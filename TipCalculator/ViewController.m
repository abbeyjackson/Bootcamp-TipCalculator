//
//  ViewController.m
//  TipCalculator
//
//  Created by Abegael Jackson on 2015-05-15.
//  Copyright (c) 2015 Abegael Jackson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipPercentageLabel;
@property (assign, nonatomic) int sliderValue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _sliderValue = 15;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)adjustTipPercentage:(UISlider *)sender {
    _sliderValue = [sender value];
    NSString *tipPercentage = [NSString stringWithFormat:@"Tip:    %d %%", _sliderValue];
    self.tipPercentageLabel.text = tipPercentage;
}

- (IBAction)calculateTip:(id)sender {
    float tip = [[_billAmountTextField text] floatValue];
    _sliderValue = (float) _sliderValue;
    tip = tip * _sliderValue/100;
    NSString *tipString = [NSString stringWithFormat:@"$ %.2f", tip];
    self.tipAmountLabel.text = tipString;
}

- (IBAction)closeKeyboard:(id)sender {
    [self.billAmountTextField resignFirstResponder];
    // not [sender resignFirstResponder] because the resignFirstResponder method is
    // not part of tap gesture, you have to put what it is part of
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [self calculateTip:nil];
    // for syntax we are forced to send an argument with the method however we are
    // not passing anything so we use nil
    [textField resignFirstResponder];
    return YES;
}

@end
