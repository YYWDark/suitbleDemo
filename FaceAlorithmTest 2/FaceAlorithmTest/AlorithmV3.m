//
//  AlorithmV3.m
//  FaceAlorithmTest
//
//  Created by wyy on 2019/7/25.
//  Copyright © 2019 dp. All rights reserved.
//

#import "AlorithmV3.h"

@implementation AlorithmV3

//窄脸：
- (NSInteger)cutFaceFacelong:(CGFloat)x
                   facewidth:(CGFloat)y
                     eyedist:(CGFloat)u
                        chin:(CGFloat)v {
    //facewidth
    CGFloat z = 0.0;
    
    //facelong
    if (x >= 0 && x < 0.005) {
        z = x + 22.0;
    } else if (x >= 0.005 && x < 0.215) {
        z = x + 17.0;
    } else if (x >= 0.215 && x < 0.355) {
        z = x + 8.0;
    } else if (x >= 0.355) {
        z = z;
    }
    
    //eyedist
    if ((y >= 0.0 && y < 0.2)) {
        if ((u >= 0 && u < 0.155)) {
            z = z - 5.0;
        } else if (u >= 0.155) {
            z = z;
        }
    } else if (y >= 0.2) {
        z = z;
    }
    
    //chin
    if (x >= 0.005 && x < 0.355) {
        if (v >= 0 && v < 0.105) {
            z = z + 8.0;
        } else if (v >= 0.105) {
            z = z;
        }
    } else if (x >= 0.355) {
        z = z;
    }
    
    return MAX(0, MIN(z, 100));;
}

//瘦颧骨
- (NSInteger)cheekBonesFacelong:(CGFloat)x
                      facewidth:(CGFloat)y
                        eyedist:(CGFloat)u
                           chin:(CGFloat)v {
    
    CGFloat z = 0.0;
    //facewidth
    if (y < 0.5) {
        z = 30 - 60*y;
    } else if (y >= 0.5) {
        z = 0.0;
    }
    
    //facelong
    if (x >= 0.0 && x < 0.005) {
        if (y >= 0 && y < 0.5) {
            z = z + 7;
        } else if (y >= 0.5) {
            z = z + 14*(1 - y);
        }
    } else if (x >= 0.005 && x< 0.215) {
        if (y >= 0 && y < 0.5) {
            z = z + 5;
        } else if (y >= 0.5) {
            z = z + 10*(1 - y);
        }
    } else if (x >= 0.215 && x < 0.355) {
        if (y >= 0 && y < 0.5) {
            z = z + 3.0;
        } else if (y >= 0.5) {
            z = z + 6*(1 - y);
        }
    } else if (x >= 0.355 && x < 0.805) {
        z = z;
    } else if (x >= 0.805 && x < 0.995) {
        if (y >= 0 && y < 0.5) {
            z = z - 10.0;
        } else if (y >= 0.5 && y<= 1.0) {
            z = z - 20*(1 - y);
        }
    } else if (x >= 0.995 && x <= 1.0) {
        if (y >= 0 && y < 0.5) {
            z = z - 15;
        } else if (y >= 0.5) {
            z = z - 30*(1 - y);
        }
    }
    //eyedist
    if (x>= 0 && x < 0.2) {
        if (u >= 0 && u < 0.155) {
            z = z - 5.0;
        } else if (u >= 0.155) {
            z = z;
        }
    } else if (x >= 0.2) {
        z = z;
    }
    
    return MAX(0, MIN(z, 100));
}

//收下颌骨
- (NSInteger)lowerJawFacelong:(CGFloat)x
                    facewidth:(CGFloat)y
                      eyedist:(CGFloat)u
                         chin:(CGFloat)v {
    CGFloat z = 0.0;
    //facewidth
    if (y >= 0 && y < 0.5) {
        z = z;
    } else if (y >= 0.5){
        z = 20*(2*y - 1);
    }
    
    //facelong
    if (x >= 0.0 && x < 0.215) {
        if (y >= 0 && y < 0.5) {
            z = z;
        } else if (y >= 0.5) {
            if (x < 0.005) {
                z = z + 6*(2*y -1);
            } else {
                z = z + 4*(2*y -1);
            }
        }
    } else if (x >= 0.215 && x < 0.645) {
        z = z;
    } else if (x >= 0.645 && x <= 1) {
        z = z + 8*y;
    }
    
    return MAX(0, MIN(z, 100));;
}

//鼻长
- (NSInteger)noseFaceratio:(CGFloat)x
               eyebrowdist:(CGFloat)y
                  facelong:(CGFloat)u
                      chin:(CGFloat)v {
    CGFloat z = 0.0;
    //faceratio
    if (x >= 0.0 && x < 0.055) {
        z = 50 + 20;
    } else if (x >= 0.055 && x < 0.255) {
        z = 50 + 7;
    } else if (x >= 0.255 && x < 0.505) {
        z = 50;
    } else if (x >= 0.505 && x < 0.825) {
        z = 50 - 12;
    } else if (x >= 0.825) {
        z = 50 - 30;
    }
    
    //eyebrowdist
    if (x < 0.455) {
        z = z;
    } else if (x >= 0.455 && x <= 1.0) {
        if (y >= 0 && y < 0.915) {
            z = z;
        } else if (y >= 0.915 && y <= 1.0) {
            z = z - 7;
        }
    }
    
    //facelong
    if (x >= 0 && x < 0.055 && u >= 0 && u < 0.005) {
        z = z - 8.0;
    } else if (x >= 0 && x < 0.055 && u >= 0.005 && u < 0.355) {
        z = z - 5.0;
    } else if (x >= 0 && x < 0.505 && u >= 0.355 && u < 0.805) {
        z = z;
    } else if (x >= 0 && x < 0.505 && u >= 0.805 && u <= 1) {
        z = z + 3;
    } else if (x >= 0.055 && x < 0.505 && u >= 0 && u < 0.005) {
        z = z - 5;
    } else if (x >= 0.055 && x < 0.505 && u >= 0.005 && u < 0.355) {
        z = z - 3;
    } else if (x >= 0.505 && x <= 1 && u >= 0 && u < 0.645) {
        z = z;
    } else if (x >= 0.505 && x <= 1 && u >= 0.645 && u < 0.805) {
        z = z + 3;
    } else if (x >= 0.505 && x <= 1 && u >= 0.805 && u <= 1) {
        z = z + 5;
    }
    
    //chin
    if (x >= 0.265 && x < 0.505) {
        if (v >= 0 && v < 0.105) {
            z = z - 5.0;
        } else if (v >= 0.105 && v < 0.665) {
            z = z - 3.0;
        }
    }
    
    z = z - 50.0;
    return MAX(-50, MIN(z, 50));
}

//发际线
- (NSInteger)foreheadForehead:(CGFloat)x {
    //forehead
    CGFloat z = 0.0;
    z = 25 * x + 40;
    z = z - 50.0;
    return MAX(-50, MIN(z, 50));
}

//眼睛上下移
- (NSInteger)eyesmoveEyebrowdist:(CGFloat)x
                       faceratio:(CGFloat)y
                        facelong:(CGFloat)u {
    CGFloat z = 0.0;
    //eyebrowdist
    if (x >= 0.0 && x < 0.605) {
        z = 50.0;
    } else if (x >= 0.605 && x < 0.955) {
        z = 50.0 + 4.0;
    } else if (x >= 0.955) {
        z = 50.0 + 10.0;
    }
    
    //faceratio
    if (x >= 0 && x < 0.925) {
        z = z ;
    } else if (x >= 0.925) {
        if (y >= 0 && y <0.805) {
            z = z ;
        } else if (y >= 0.805) {
            z = z + 25.0;
        }
    }
    
    
    //facelong
    if (u >= 0 && u <0.355) {
        z = z + 5.0;
    } else if (u >= 0.355 && u <0.645) {
        z = z;
    } else if (u >= 0.645) {
        z = z - 10.0;
    }
    z = z - 50.0;
    return MAX(-50, MIN(z, 50));
}

//下巴
- (NSInteger)chinChin:(CGFloat)x
            faceratio:(CGFloat)y
           mouthwidth:(CGFloat)u
             facelong:(CGFloat)v {
    CGFloat z = 0.0;
    //chin
    if (x >= 0 && x < 0.105) {
        z = 50 + 16;
    } else if (x >= 0.105) {
        z = 50 + 0;
    }
    //faceratio
    if (y >= 0 && y < 0.495) {
        z = z;
    } else if (y >= 0.495 && y < 0.825) {
        if (v >= 0 && v < 0.215) {
            z = z + 4;
        } else if (v >= 0.215) {
            z = z + 8;
        }
    } else if(y >= 0.825) {
        if (v >= 0 && v < 0.215) {
            z = z + 6;
        } else if (v >= 0.215) {
            z = z + 9;
        }
    }
    
    //facelong
    if (v >= 0.645) {
        z = z + 5;
    }
    
    z = z - 50.0;
    return MAX(-50, MIN(z, 50));
}
// 缩人中
- (NSInteger)philtrumChin:(CGFloat)x
                faceratio:(CGFloat)y
               mouthwidth:(CGFloat)u
                 facelong:(CGFloat)v {
    float z = 0.0;
    //chin
    if (x >= 0 && x < 0.505) {
        z = 50;
    } else if (x >= 0.505 && x < 0.665) {
        z = 50 + 12;
    } else if (x >= 0.665) {
        z = 50 + 18;
    }
    //faceratio
    if (y >= 0.0 && y < 0.055) {
        z = z - 5.0;
    } else if (y >= 0.055 && y < 0.495) {
        z = z;
    } else if (y >= 0.495 && y < 0.825) {
        if (v >= 0 && v < 0.215) {
            z = z + 5.0;
        } else if (v >= 0.215 && v < 0.645) {
            z = z + 9.0;
        } else if (v >= 0.645) {
            z = z + 11.0;
        }
    } else if (y >= 0.825) {
        if (v >= 0 && v < 0.215) {
            z = z + 7.0;
        } else if (v >= 0.215 && v < 0.645) {
            z = z + 12.0;
        } else if (v >= 0.645) {
            z = z + 13.0;
        }
    }
    //mouthwidth
    if (x >= 0 && x < 0.665) {
        z = z;
    } else if (x >= 0.665 ) {
        if (u >= 0 && u < 0.935) {
            z = z;
        } else if ( u >= 0.935) {
            z = z + 6.0;
        }
    }
    
    //facelong
    if (v >= 0 && v < 0.215) {
        z = z + 5.0;
    } else if (v >= 0.215 && v < 0.355) {
        z = z;
    } else if (v >= 0.355 && v < 0.645) {
        z = z - 2.0;
    }
    else if (v >= 0.645) {
        z = z - 5.0;
    }
    z = z - 50.0;
    return MAX(-50, MIN(z, 50));
}

//大眼
- (NSInteger)bigEye:(CGFloat)x
           eyeshape:(CGFloat)y
           facelong:(CGFloat)u
            eyedist:(CGFloat)v
          facewidth:(CGFloat)w {
    CGFloat z = 0.0;
    //eye
    if (x >= 0 && x < 0.5) {
        z = 60 - 30*x;
    } else if (x >= 0.5) {
        z = 45 - 20*(2*x - 1);
    }
    
    //eyeshape
    if (y >= 0 && y < 0.505) {
        z = z;
    } else if (y >= 0.505 && y <= 0.805) {
        z = z - 10;
    } else if (y >= 0.805) {
        z = z - 18.0;
    }
    
    //facewidth
    if (w >= 0 && w < 0.5) {
        z = z - 10 + 20*w;
    } else if (w >= 0.5) {
        z = z - 8*(2*w - 1);
    }
    
    //facelong
    if (u >= 0 && u < 0.645) {
        z = z;
    } else if (u >= 0.645 && u < 0.805) {
        z = z - 4;
    } else if (u >= 0.805 && u < 0.995) {
        z = z - 7;
    } else if (u >= 0.995) {
        z = z - 10;
    }
    
    //eyedist
    if (v >= 0 && v < 0.155) {
        z = z - 5.0;
    } else if (v >= 0.155 && v < 0.665) {
        z = z;
    } else if (v >= 0.665) {
        z = z + 5.0;
    }
    
    return MAX(20, MIN(z, 100));
}

//眼距
- (NSInteger)eyeDistacneEyedist:(CGFloat)x
                      facewidth:(CGFloat)y {
    CGFloat z = 0.0;
    //eyedist
    if (x >= 0.0 && x < 0.135) {
        z = 50.0 + 20.0;
    } else if (x >= 0.135 && x < 0.475) {
        z = 50.0 + 15.0;
    } else if (x >= 0.475 && x < 0.685) {
        z = 50.0;
    } else if (x >= 0.685) {
        z = 50 - 20;
    }
    //facewidth
    if (y >= 0 && y < 0.5) {
        z = z + 5 - 10*y;
    } else if (y >= 0.5) {
        z = z;
    }
    z = z - 50.0;
    return MAX(-50, MIN(z, 50));
}

//瘦鼻
- (NSInteger)nosewidthNosewidth:(CGFloat)x
                      faceratio:(CGFloat)y {
    CGFloat z = 0.0;
    //nosewidth
    if (x >= 0.0 && x < 0.5) {
        z = 25.0 + 10*x;
    } else if (x >= 0.5) {
        z = 30.0 + 25*(2*x - 1);
    }
    
    //faceratio
    if (y >= 0.0 && y < 0.805) {
        z  = z ;
    } else if (y >= 0.805) {
        z = z -5.0;
    }
    return MAX(25, MIN(z, 100));
}

//嘴型
- (NSInteger)mouthWidthMouth:(CGFloat)x {
    CGFloat z = 0.0;
    //嘴型
    if (x >= 0 && x < 0.515) {
        z = 50.0 + 0;
    } else if (x >= 0.515 && x < 0.935) {
        z = 50.0 + 18.0;
    } else if (x >= 0.935) {
        z = 50.0 + 23.0;
    }
    z = z - 50.0;
    return MAX(-50, MIN(z, 50));
}

//法令纹
- (NSInteger)wrinkle {
    return 40;
}

- (NSInteger)eyebag {
    return 50;
}

@end
