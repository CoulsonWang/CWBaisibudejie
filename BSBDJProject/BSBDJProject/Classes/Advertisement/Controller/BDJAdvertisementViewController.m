//
//  BDJAdvertisementViewController.m
//  BSBDJProject
//
//  Created by Coulson_Wang on 2017/6/26.
//  Copyright © 2017年 Coulson_Wang. All rights reserved.
//

//请求URL头
#define urlPrefix @"http://mobads.baidu.com/cpro/ui/mads.php"
//广告请求参数名
#define adRequestKey @"code2"
//广告请求参数
#define adRequestParam @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

#import "BDJAdvertisementViewController.h"
#import <AFNetworking.h>

@interface BDJAdvertisementViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchView;
@property (weak, nonatomic) IBOutlet UIView *adView;

@end

@implementation BDJAdvertisementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpLaunchImage];
    
    [self setUpAdView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setUpLaunchImage {
    UIImage *launchImage;
    if (iPhonePlus) {
        launchImage = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    } else if (iPhone7) {
        launchImage = [UIImage imageNamed:@"LaunchImage-800-667h@2x"];
    } else if (iPhone5) {
        launchImage = [UIImage imageNamed:@"LaunchImage-700-568h@2x"];
    } else if (iPhone4) {
        launchImage = [UIImage imageNamed:@"LaunchImage-700@2x"];
    }
    self.launchView.image = launchImage;
}

- (void)setUpAdView {
    [self loadAdData];
}

- (void)loadAdData {
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    
    NSDictionary *parameters = @{ adRequestKey : adRequestParam };
    [mgr GET:urlPrefix parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"succeed");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

@end