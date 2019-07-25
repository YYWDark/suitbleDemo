//
//  Alorithm.m
//  FaceAlorithmTest
//
//  Created by 林东鹏 on 2019/3/26.
//  Copyright © 2019 dp. All rights reserved.
//

#import "Alorithm.h"
#import <UIKit/UIKit.h>

@implementation Alorithm

//小脸
- (NSInteger)smallFaceOpt:(float)faceLong faceWidth:(float)faceWidth isMale:(BOOL)isMale {
    //faceLong= x, facewidth = y
    if (isMale) {
        if (faceLong == 1) {
            return faceWidth < 0.5 ? 0 : 30*(faceWidth-0.5);
        } else {
            return 0;
        }
    } else {
        if (faceLong < 0.35) {
            return 0;
        } else if (faceLong < 0.65) {
            return 18;
        } else if (faceLong < 0.80) {
            return 20;
        } else if (faceLong < 0.99) {
            return 30 + 20*faceWidth;
        } else {
            return 50;
        }
    }
}

- (NSInteger)cutFaceOpt:(float)faceLong faceWidth:(float)faceWidth isMale:(BOOL)isMale {
    if (isMale) {
        if (faceLong <= 0) {
            return faceWidth < 0.5 ? 0 : (0 + 60*(faceWidth-0.5));
        } else if (faceLong < 0.22) {
            return faceWidth < 0.5 ? 20*faceWidth : 10+10*(faceWidth-0.5);
        } else if (faceLong < 0.35) {
            return faceWidth < 0.5 ? 0 : 30*(faceWidth-0.5);
        } else {
            return 0;
        }
    } else {
        if (faceLong <= 0) {
            return 25 + 10*faceWidth;
        } else if (faceLong < 0.22) {
            return faceWidth < 0.5 ? 5 : (5 + 30*(faceWidth-0.5));
        } else if (faceLong < 0.35) {
            return faceWidth < 0.5 ? 0 : 40*(faceWidth - 0.5);
        } else {
            return 0;
        }
    }
}

//瘦颧骨
- (NSInteger)cheekBoneOpt:(float)faceLong faceWidth:(float)faceWidth isMale:(BOOL)isMale {
    //区间有共性。把faceWidth两个起始值定为a b。统一公式。
    if (isMale) {
        CGFloat a = 0;
        CGFloat b = 0;
        if (faceLong <= 0) {
            a = 50;
            b = 50;
        } else if (faceLong < 0.22) {
            a = 45;
            b = 50;
        } else if (faceLong < 0.35) {
            a = 45;
            b = 45;
        } else if (faceLong < 0.65) {
            a = 45;
            b = 20;
        } else if (faceLong < 0.8) {
            a = 40;
            b = 30;
        } else if (faceLong < 0.99) {
            a = 40;
            b = 30;
        } else {
            a = 40;
            b = 35;
        }
        return faceWidth < 0.5 ? (a - (a-b)*2.0*faceWidth) : (b-b*2*(faceWidth-0.5));
    } else {
        if (faceLong >= 0.35 && faceLong < 0.65) {
            //35 0 35
            return 70*fabs(faceWidth-0.5);
        } else {
            CGFloat a = 0;
            CGFloat b = 20;
            if (faceLong <= 0) {
                a = 50;
            } else if (faceLong < 0.22) {
                a = 30;
            } else if (faceLong < 0.35) {
                a = 25;
                b = 15;
            } else if (faceLong >= 0.65 && faceLong < 0.8) {
                a = 25;
                b = 10;
            } else if (faceLong < 0.99) {
                a = 45;
                b = 15;
            } else {
                a = 40;
            }
            return faceWidth < 0.5 ? (a - (a-b)*2.0*faceWidth) : (b-b*2*(faceWidth-0.5));
        }
    }
}

//收下颌
- (NSInteger)lowerJawOpt:(float)faceLong faceWidth:(float)faceWidth isMale:(BOOL)isMale {
    if (isMale) {
        CGFloat a = 0;
        if (faceLong >= 0.35 && faceLong < 0.65) {
            a = 15;
            return faceWidth < 0.5 ? 0 : a*2*(faceWidth-0.5);
        } else if (faceLong >= 1) {
            a = 10;
            return faceWidth < 0.5 ? 0 : a*2*(faceWidth-0.5);
        } else {
            return 0;
        }
    } else {
        CGFloat a = faceLong < 0.65 ? 30 : 40;
        return faceWidth < 0.5 ? 0 : a*2*(faceWidth-0.5);
    }
}



- (NSInteger)bigEyesDefaultValue:(float)ratio isMale:(BOOL)isMale {
//    logInfo(@"【智能形变】eye : %@", @(ratio));
    if (isMale) {
        return ratio < 0.5 ? 40-ratio*30 : 25;
    } else {
        if (ratio <= 0) {
            return 50;
        } else if (ratio < 0.5) {
            return 50-40*ratio;
        } else {
            return 30-10*(ratio-0.5);
        }
    }
    return 0;
}


- (NSInteger)thinNoseDefaultValue:(float)ratio isMale:(BOOL)isMale {
//    logInfo(@"【智能形变】nosewidth : %@", @(ratio));
    if (isMale) {
        if (ratio <= 0.3) {
            return (int)(50 * ratio);
        } else if (ratio <= 0.53) {
            return 15 + (int)(10 * (ratio - 0.3) / 0.23);
        } else if (ratio <= 0.76) {
            return 25 + (int)(5 * (ratio - 0.53) / 0.23);
        } else {
            return 30 + (int)(10 * (ratio - 0.76) / 0.24);
        }
    } else {
        if (ratio <= 0.3) {
            return 25;
        } else if (ratio <= 0.53) {
            return 25 + (int)(10 * (ratio - 0.3) / 0.23);
        } else if (ratio <= 0.76) {
            return 35 + (int)(15 * (ratio - 0.53) / 0.23);
        } else {
            return 50 + (int)(10 * (ratio - 0.76) / 0.24);
        }
    }
}

@end
