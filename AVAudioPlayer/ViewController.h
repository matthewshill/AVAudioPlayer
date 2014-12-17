//
//  ViewController.h
//  AVAudioPlayer
//
//  Created by Matthew S. Hill on 12/10/14.
//  Copyright (c) 2014 Matthew S. Hill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) UISlider *volControl;
- (IBAction)adjustVol:(id)sender;
- (IBAction)play;
- (IBAction)stop:(id)sender;
@end

