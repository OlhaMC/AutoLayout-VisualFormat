//
//  ViewController.m
//  AutoLayout-VisualFormat
//
//  Created by Admin on 22.10.15.
//  Copyright (c) 2015 OlhaF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel * lable;
@property (weak, nonatomic) IBOutlet UIButton * clearButton;
@property (weak, nonatomic) IBOutlet UIButton * loadButton;

@property (strong, nonatomic) NSString * textInfoForLable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSString * fileAddress = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@".txt"];
    self.textInfoForLable = [NSString stringWithContentsOfFile:fileAddress encoding:NSASCIIStringEncoding error:nil];
    
    [self setConstraintsToLoadButton];
    [self setConstraintsToClearButton];
    [self setConstraintsToLable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Set buttons and label;
- (void) setConstraintsToLoadButton
{
    self.loadButton.layer.borderWidth = 1.0f;
    self.loadButton.layer.borderColor = [[UIColor blackColor] CGColor];
    self.loadButton.layer.cornerRadius = 8.0f;
    
    self.loadButton.translatesAutoresizingMaskIntoConstraints = NO;
    UIButton * loadButton = self.loadButton;
    NSDictionary * itemsDictionary = NSDictionaryOfVariableBindings(loadButton);
    
    NSArray * constrLoadRight =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:[loadButton(100)]-10-|" options:0 metrics:nil views:itemsDictionary];
    
    NSArray * constrLoadBottom =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[loadButton(30)]-10-|" options:0 metrics:nil views:itemsDictionary];
    
    [self.view addConstraints:constrLoadRight];
    [self.view addConstraints:constrLoadBottom];
}

- (void) setConstraintsToClearButton
{
    self.clearButton.layer.borderWidth = 1.0f;
    self.clearButton.layer.borderColor = [[UIColor blackColor] CGColor];
    self.clearButton.layer.cornerRadius = 8.0f;
    
    self.clearButton.translatesAutoresizingMaskIntoConstraints = NO;
    UIButton * clearButton = self.clearButton;
    NSDictionary * itemsDictionary = NSDictionaryOfVariableBindings(clearButton);
    
    NSArray * constrClearRight =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[clearButton(100)]" options:0 metrics:nil views:itemsDictionary];
    
    NSArray * constrClearBottom =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[clearButton(30)]-10-|" options:0 metrics:nil views:itemsDictionary];
    
    [self.view addConstraints:constrClearRight];
    [self.view addConstraints:constrClearBottom];
}

- (void) setConstraintsToLable
{
    self.lable.text=@"You can load information";
    self.lable.backgroundColor = [UIColor blueColor];
    self.lable.textColor = [UIColor whiteColor];
    self.lable.font = [UIFont fontWithName:@"Baskerville" size:14];
    self.lable.textAlignment = NSTextAlignmentCenter;
    
    self.lable.translatesAutoresizingMaskIntoConstraints = NO;
    UILabel * infoLable = self.lable;
    NSDictionary * itemsDictionary = NSDictionaryOfVariableBindings(infoLable);
    
    NSArray * constrLableHorizontal =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-25-[infoLable]-25-|" options:0 metrics:nil views:itemsDictionary];
    
    NSArray * constrLableVertical =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[infoLable(>=30)]->=100-|" options:0 metrics:nil views:itemsDictionary];

    [self.view addConstraints:constrLableHorizontal];
    [self.view addConstraints:constrLableVertical];
}


#pragma mark - Button Actions

- (IBAction)loadAction:(UIButton*)sender
{
    self.lable.text = self.textInfoForLable;
}

- (IBAction)clearAction:(UIButton*)sender
{
    self.lable.text  = @"";
}


@end
