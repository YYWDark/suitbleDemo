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
- (NSInteger)cutFaceFacelong:(float)x
                   facewidth:(float)y
                     eyedist:(float)u
                        chin:(float)v;

//收颧骨
- (NSInteger)cheekBonesFacelong:(float)x
                      facewidth:(float)y
                        eyedist:(float)u
                           chin:(float)v;

//收下颌骨
- (NSInteger)lowerJawFacelong:(float)x
                    facewidth:(float)y
                      eyedist:(float)u
                         chin:(float)v;

//鼻长
- (NSInteger)noseFaceratio:(float)x
               eyebrowdist:(float)y
                  facelong:(float)u
                      chin:(float)v;

//发际线
- (NSInteger)foreheadForehead:(float)x;

//眼睛上下移
- (NSInteger)eyesmoveEyebrowdist:(float)x
                       faceratio:(float)y
                        facelong:(float)u;

//下巴
- (NSInteger)chinChin:(float)x
            faceratio:(float)y
           mouthwidth:(float)u
             facelong:(float)v;

//缩人中
- (NSInteger)philtrumChin:(float)x
                faceratio:(float)y
               mouthwidth:(float)u
                 facelong:(float)v;

//大眼
- (NSInteger)bigEye:(float)x
           eyeshape:(float)y
           facelong:(float)u
            eyedist:(float)v
          facewidth:(float)w;

//眼距
- (NSInteger)eyeDistacneEyedist:(float)x
                      facewidth:(float)y;


//瘦鼻
- (NSInteger)nosewidthNosewidth:(float)x
                      faceratio:(float)y;

//嘴型
- (NSInteger)mouthWidthMouth:(float)x;


@end

NS_ASSUME_NONNULL_END
