#import <Foundation/Foundation.h>

@interface AGCBook : NSObject

- (instancetype)initWithTitle:(NSString*)title author:(NSString*)author createdAt:(NSDate*)createdAd characters:(NSArray<NSString*>*)characters adaptions:(NSDictionary<NSNumber*, NSString*>*)adaptions;

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* author;
@property (nonatomic, strong) NSDate* createdAt;
@property (nonatomic, strong) NSArray<NSString*>* characters;
@property (nonatomic, strong) NSDictionary<NSNumber*, NSString*>* adaptions;

@end
