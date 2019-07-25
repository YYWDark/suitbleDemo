//
//  Alorithm.h
//  FaceAlorithmTest
//
//  Created by 林东鹏 on 2019/3/26.
//  Copyright © 2019 dp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Alorithm : NSObject

- (NSInteger)smallFaceOpt:(float)faceLong faceWidth:(float)faceWidth isMale:(BOOL)isMale;
- (NSInteger)cutFaceOpt:(float)faceLong faceWidth:(float)faceWidth isMale:(BOOL)isMale;
- (NSInteger)cheekBoneOpt:(float)faceLong faceWidth:(float)faceWidth isMale:(BOOL)isMale;
- (NSInteger)lowerJawOpt:(float)faceLong faceWidth:(float)faceWidth isMale:(BOOL)isMale;

- (NSInteger)bigEyesDefaultValue:(float)ratio isMale:(BOOL)isMale;
- (NSInteger)thinNoseDefaultValue:(float)ratio isMale:(BOOL)isMale;

@end

NS_ASSUME_NONNULL_END
