//
//  AlorithmV3.h
//  FaceAlorithmTest
//
//  Created by wyy on 2019/7/25.
//  Copyright © 2019 dp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlorithmV3 : NSObject
//窄脸：
- (NSInteger)cutFaceFacelong:(CGFloat)x
                   facewidth:(CGFloat)y
                     eyedist:(CGFloat)u
                        chin:(CGFloat)v;

//收颧骨
- (NSInteger)cheekBonesFacelong:(CGFloat)x
                      facewidth:(CGFloat)y
                        eyedist:(CGFloat)u
                           chin:(CGFloat)v;

//收下颌骨
- (NSInteger)lowerJawFacelong:(CGFloat)x
                    facewidth:(CGFloat)y
                      eyedist:(CGFloat)u
                         chin:(CGFloat)v;

//鼻长
- (NSInteger)noseFaceratio:(CGFloat)x
               eyebrowdist:(CGFloat)y
                  facelong:(CGFloat)u
                      chin:(CGFloat)v;

//发际线
- (NSInteger)foreheadForehead:(CGFloat)x;

//眼睛上下移
- (NSInteger)eyesmoveEyebrowdist:(CGFloat)x
                       faceratio:(CGFloat)y
                        facelong:(CGFloat)u;

//下巴
- (NSInteger)chinChin:(CGFloat)x
            faceratio:(CGFloat)y
           mouthwidth:(CGFloat)u
             facelong:(CGFloat)v;

//缩人中
- (NSInteger)philtrumChin:(CGFloat)x
                faceratio:(CGFloat)y
               mouthwidth:(CGFloat)u
                 facelong:(CGFloat)v;

//大眼
- (NSInteger)bigEye:(CGFloat)x
           eyeshape:(CGFloat)y
           facelong:(CGFloat)u
            eyedist:(CGFloat)v
          facewidth:(CGFloat)w;

//眼距
- (NSInteger)eyeDistacneEyedist:(CGFloat)x
                      facewidth:(CGFloat)y;


//瘦鼻
- (NSInteger)nosewidthNosewidth:(CGFloat)x
                      faceratio:(CGFloat)y;

//嘴型
- (NSInteger)mouthWidthMouth:(CGFloat)x;


@end

NS_ASSUME_NONNULL_END
