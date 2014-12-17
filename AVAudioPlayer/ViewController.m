//
//  ViewController.m
//  AVAudioPlayer
//
//  Created by Matthew S. Hill on 12/10/14.
//  Copyright (c) 2014 Matthew S. Hill. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController (){

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path = [NSString stringWithFormat:@"%@/DRUM_LOOP_FOR_MATTHEW.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    NSError *error;
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:&error];
    
    if (error) {
        NSLog(@"Error in audioPlayer: %@", [error localizedDescription]);
    }
    else {
        _audioPlayer.delegate = self;
        [_audioPlayer prepareToPlay];
    }
    
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setup{
    _volControl = [[UISlider alloc] initWithFrame:CGRectMake(20, 300, 320, 270)];
    [_volControl addTarget:self action:@selector(adjustVol:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_volControl];
    
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    playButton.frame = CGRectMake(120, 230, 120, 60);
    [playButton addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [playButton setTitle:@"Play" forState:UIControlStateNormal];
    playButton.userInteractionEnabled = YES;
    [self.view addSubview:playButton];
    
    UIButton *stopButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    stopButton.frame = CGRectMake(120, 320, 120, 60);
    [stopButton addTarget:self action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
    [stopButton setTitle:@"Stop" forState:UIControlStateNormal];
    stopButton.userInteractionEnabled = YES;
    [self.view addSubview:stopButton];
    
}
#pragma mark AVAudioPlayerDelegate Protocol Methods

#pragma UI instance methods
- (IBAction)adjustVol:(id)sender {
    if (_audioPlayer != nil) {
        _audioPlayer.volume = _volControl.value;
    }
}

- (IBAction)play:(id)sender{
    [_audioPlayer play];
}

- (IBAction)stop:(id)sender{
    [_audioPlayer stop];
}
@end
