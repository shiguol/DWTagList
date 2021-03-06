//
//  ViewController.m
//  DWTagList
//
//  Created by Dominic Wroblewski on 07/07/2012.
//  Copyright (c) 2012 Terracoding LTD. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)selectedTag:(NSString *)tagName tagIndex:(NSInteger)tagIndex
{
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                  message:[NSString stringWithFormat:@"You tapped tag %@ at index %ld", tagName,(long)tagIndex]
                                                 delegate:nil
                                        cancelButtonTitle:@"Ok"
                                        otherButtonTitles:nil];
  [alert show];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  _tagList = [[DWTagList alloc] initWithFrame:CGRectMake(0.0f,
                                                         70.0f,
                                                         self.view.bounds.size.width, 250.0f)];
  _tagList.centerAlign = YES;
  [_tagList setLabelMargin:20];
  [_tagList setHorizontalPadding:20];
  [_tagList setUseCustomHeight:YES];
  [_tagList setCustomHeight:34];
  [_tagList setAutomaticResize:YES];
  _array = [[NSMutableArray alloc] initWithObjects:@"Tag Label 5",@"Foo",@"Foo",@"Foo",@"Foo",@"Foo",@"Foo",@"Foo",@"Foo",@"Foo",@"Foo",@"Foo",@"Foo",@"Foo",@"Foo",@"Foo",@"Foo",@"Foo",@"Foo",@"Foo",@"Foo",@"FooA",@"FooA", @"Long long long long long long Tag", nil];
  NSMutableArray *selectedArray = [NSMutableArray array];
  for (int i = 0; i < _array.count; i++) {
    [selectedArray addObject:[NSNumber numberWithInt:arc4random()%2]];
  }
  [_tagList setSelectedArray:selectedArray];
  [_tagList setTags:_array];
  
  [_tagList setTagDelegate:self];
  
  // Customisation
  [_tagList setCornerRadius:0.0f];
  [_tagList setBorderColor:[UIColor lightGrayColor].CGColor];
  [_tagList setTagHighlightColor:[UIColor redColor]];
  [_tagList setTextShadowColor:[UIColor clearColor]];
  [_tagList setBorderWidth:1.0f];
  [_tagList setSelectedTagBackgroundColor:[UIColor redColor]];
  
  [self.view addSubview:_tagList];
}

- (IBAction)tappedAdd:(id)sender
{
  [_addTagField resignFirstResponder];
  if ([[_addTagField text] length]) {
    [_array addObject:[_addTagField text]];
  }
  [_addTagField setText:@""];
  [_tagList setTags:_array];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
    return YES;
  }
}

@end
