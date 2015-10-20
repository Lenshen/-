//
//  AppDelegate.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/4.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "AppDelegate.h"
#import <UIKit/UIKit.h>
#import <RongIMKit/RongIMKit.h>
#import <RongIMLib/RongIMLib.h>
#define RONGCLOUD_IM_APPKEY @"8iqHjxGWCMYbaoDJarlo3F1zXcHQ2P3ZnvANCTouCAPIsE3oTc7mSFYDQ2i785IHyQNI0YrdoUQ="


@interface AppDelegate ()<UIScrollViewDelegate>
@property (nonatomic , strong)UIScrollView *linkPagescrollView;
@property (nonatomic , strong)NSArray *imageArray;


@end

@implementation AppDelegate
NSString* const firstLauch   = @"firstLauch";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.]
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
                   
    [[RCIM sharedRCIM]initWithAppKey:@"p5tvi9dst1nl4"];
#ifdef __IPHONE_8_0
    // 在 iOS 8 下注册苹果推送，申请推送权限。
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge
                                                                                         |UIUserNotificationTypeSound
                                                                                         |UIUserNotificationTypeAlert) categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
#else
    // 注册苹果推送，申请推送权限。
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound];
#endif
    UIFont *font = [UIFont systemFontOfSize:19.f];
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName : font,
                                     NSForegroundColorAttributeName : [UIColor whiteColor]
                                     };
    [[UINavigationBar appearance] setTitleTextAttributes:textAttributes];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance]
     setBarTintColor:[UIColor colorWithRed:(1 / 255.0f) green:(149 / 255.0f) blue:(255 / 255.0f) alpha:1]];

    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(didReceiveMessageNotification:)
     name:RCKitDispatchMessageNotification
     object:nil];
    [[RCIM sharedRCIM] setConnectionStatusDelegate:self];

    [self judgment];
    
    [self.window makeKeyAndVisible];
    return YES;
    
}

//判断一下，是不是第一次登陆入口
-(void)judgment
{
    //用存储查值的方法，判断是不是第一次登陆。如果程序中没有拿不到数值。说明是第一次启动。然后加上数值。第二次启动就一定可以查到。
    if (![[NSUserDefaults standardUserDefaults]boolForKey:firstLauch]) {
        
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:firstLauch];
        NSLog(@"第一次启动");
        
        [self goLinkPage];
    }
    else
    {
        NSLog(@"不是第一次启动");
        [self goMain];
    }
    
}

-(void)goLinkPage
{
   
    [self startScrollview];
    
    
}
-(void)initArray
{
    
}

-(void)goMain
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *tab = [storyboard instantiateViewControllerWithIdentifier:@"tab"];
         self.window.rootViewController = tab;
    
    
}
-(UIScrollView *)startScrollview
{
    CGRect rect = self.window.bounds;
    if (!self.linkPagescrollView)
    {
        self.linkPagescrollView = [[UIScrollView alloc]initWithFrame:rect];
        self.linkPagescrollView.bounces = NO;
        self.linkPagescrollView.delegate = self;
        
        self.linkPagescrollView.pagingEnabled = YES;
        self.linkPagescrollView.contentSize = CGSizeMake(rect.size.width*3,rect.size.height);
        
        self.linkPagescrollView.showsVerticalScrollIndicator = NO;
        
        self.linkPagescrollView.showsHorizontalScrollIndicator = NO;
        
        self.linkPagescrollView.userInteractionEnabled = YES;
        self.linkPagescrollView.backgroundColor = [UIColor orangeColor];
        
        [self.window addSubview:self.linkPagescrollView];
        self.imageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"first"],[UIImage imageNamed:@"second"],[UIImage imageNamed:@"third"],nil];
        for (int i = 0; i < 3; i++)
        {
            UIImageView *imageView = [[UIImageView alloc]initWithImage:[self.imageArray objectAtIndex:i]];
            imageView.frame = CGRectMake(self.window.bounds.size.width*i, 0, self.window.bounds.size.width, self.window.bounds.size.height);
            [self.linkPagescrollView addSubview:imageView];
           
            
        }
        
        
    }
    return self.linkPagescrollView;
}

-(UITapGestureRecognizer *)singleRecognizer
{
    UITapGestureRecognizer *singleRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imgeviewAddTap)];
    singleRecognizer.numberOfTapsRequired = 1;
    return singleRecognizer;
    
}

//点击手势后
-(void)imgeviewAddTap
{
    
    [self goMain];

}
//scrollview代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    //    NSLog(@" scrollViewDidScroll");
    if (scrollView.contentOffset.x == self.linkPagescrollView.bounds.size.width*2) {
        [self.linkPagescrollView addGestureRecognizer:[self singleRecognizer]];

    }
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *token =
    [[[[deviceToken description] stringByReplacingOccurrencesOfString:@"<"
                                                           withString:@""]
      stringByReplacingOccurrencesOfString:@">"
      withString:@""]
     stringByReplacingOccurrencesOfString:@" "
     withString:@""];
    
    [[RCIMClient sharedRCIMClient] setDeviceToken:token];
}
- (void)onRCIMConnectionStatusChanged:(RCConnectionStatus)status {
    if (status == ConnectionStatus_KICKED_OFFLINE_BY_OTHER_CLIENT) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"提示"
                              message:@"您"
                              @"的帐号在别的设备上登录，您被迫下线！"
                              delegate:nil
                              cancelButtonTitle:@"知道了"
                              otherButtonTitles:nil, nil];
        [alert show];
//        ViewController *loginVC = [[ViewController alloc] init];
//        UINavigationController *_navi =
//        [[UINavigationController alloc] initWithRootViewController:loginVC];
//        self.window.rootViewController = _navi;
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.baidu.mapsdk.demo.____" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"____" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"____.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}
- (void)didReceiveMessageNotification:(NSNotification *)notification
{
    
}


@end
