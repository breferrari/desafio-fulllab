//
//  FulllabService.h
//  Desafio FullLab
//
//  Created by Brenno Ferrari on 21/06/17.
//  Copyright © 2017 Brenno Ferrari. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "REST.h"

typedef void (^ServiceResultBlock)(id response, NSError *error);

@interface FulllabService : NSObject

@end
