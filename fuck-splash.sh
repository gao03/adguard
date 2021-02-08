#!/bin/bash

# 要创建空文件
empty_file_list=(
    /data/data/com.sankuai.meituan/files/cips/common/mtplatform_group/assets/startup                          # 美团
    /storage/emulated/0/Android/data/com.sankuai.meituan/cache/startup                                        # 美团
    /storage/emulated/0/Android/data/com.ss.android.ugc.aweme/awemeSplashCache                                # 抖音
    /storage/emulated/0/Android/data/com.ss.android.ugc.aweme/liveSplashCache                                 # 抖音
    /storage/emulated/0/Android/data/com.ss.android.ugc.aweme/splashCache                                     # 抖音
    /storage/emulated/0/sina/weibo/.wbadcache                                                                 # 微博1
    /data/data/com.sina.weibo/files/sina/weibo/.wbadcache/                                                    # 微博2 删掉第一个目录后才会出现
    /data/data/com.baidu.netdisk/files/ad_caches                                                              # 百度网盘
    /storage/emulated/0/Android/data/com.baidu.BaiduMap/BaiduMap/cache/AdvertImageCache                       # 百度地图
    /storage/emulated/0/Android/data/tv.danmaku.bili/cache                                                    # 哔哩哔哩
    /data/data/tv.danmaku.bili/files/splash2                                                                  # 哔哩哔哩
    /storage/emulated/0/Android/data/com.sankuai.meituan.takeoutnew/cache                                     # 美团外卖
    /storage/emulated/0/Android/data/com.sankuai.meituan.takeoutnew/files/cips/common/waimai/assets/promotion # 美团外卖
    /storage/emulated/0/Android/data/com.qidian.QDReader/files/QDReader/image                                 # 起点
    /storage/emulated/0/Android/data/com.qidian.QDReader/files/QDReader/splash                                # 起点
    /storage/emulated/0/Android/data/com.qidian.QDReader/cache/com_qq_e_download/video/                       # 起点 自动下载广告视频
    /storage/emulated/0/Android/data/com.netease.cloudmusic/cache/Ad/                                         # 网易云音乐
    /data/data/com.jingdong.app.mall/cache/jingdong/persist                                                   # 京东
    /data/data/com.jingdong.app.mall/files/start_image                                                        # 京东
    /data/data/com.jingdong.app.mall/cache/image_cache/v2.ols100.1                                            # 京东
    /storage/emulated/0/Android/data/com.jingdong.app.mall/files/image                                        # 京东
    /storage/emulated/0/Android/data/com.autonavi.minimap/files/splash                                        # 高德地图
    /storage/emulated/0/Android/data/com.tencent.xriver/files/PicDir                                          # 腾讯加速器
    /storage/emulated/0/Android/data/com.taobao.taobao/files/AVFSCache/bootimage                              # 淘宝
    /storage/emulated/0/Android/data/com.taobao.taobao/cache/taobao/wvcache                                   # 淘宝
    /data/data/com.xunmeng.pinduoduo/cache/image_manager_disk_cache                                           # 拼多多
    /data/data/com.xunmeng.pinduoduo/cache/okhttpcache                                                        # 拼多多
    /data/data/com.unionpay/openAdv                                                                           # 云闪付
    /data/data/com.tencent.qqmusic/app_adnet                                                                  # qq音乐
    /data/data/com.tencent.mtt/app_adnet                                                                      # qq浏览器
    /data/data/com.tencent.mtt/files/data/operation                                                           # qq浏览器
    /storage/emulated/0/Android/data/com.UCMobile/cache/advertise                                             # UC 浏览器
    /data/data/com.tencent.qqlive/files/qad_cache                                                             # 腾讯视频
    /data/data/com.qiyi.video/files/app/spgg                                                                  # 爱奇艺
    /storage/emulated/0/Android/data/com.youku.phone/files/ad                                                 # 优酷
    /data/data/com.xiaomi.hm.health/cache/image_manager_disk_cache                                            # 小米运动
    /data/data/com.coolapk.market/cache/GDTDOWNLOAD/image                                                     # 酷安
    /data/data/cn.wps.moffice_eng/cache/mopub-cache                                                           # WPS
    /storage/emulated/0/Android/data/com.chinamworld.bocmbci/files/adimages                                   # 中国银行

)

# 要修改文件权限
change_attr_list=(
    /storage/emulated/0/Android/data/tv.danmaku.bili/cache
    /storage/emulated/0/Android/data/com.netease.cloudmusic/cache/Ad/
    /storage/emulated/0/Android/data/com.qidian.QDReader/files/QDReader/image
    /storage/emulated/0/Android/data/com.taobao.taobao/files/AVFSCache/bootimage
)

for dir_name in ${empty_file_list[@]}; do
    # 对应文件夹不存在则跳过
    echo "==开始处理=="
    echo $dir_name
    if [ -a $dir_name ]; then
        echo "--已存在同名文件--"
        continue
    fi
    if [ ! -d $dir_name ]; then
        echo "--文件夹不存在--"
        continue
    fi
    rm -r $dir_name
    touch $dir_name
    echo "==处理完成=="
done

# 需要root权限
echo "修改文件权限"
for dir_name in ${change_attr_list[@]}; do
    # 对应文件夹不存在则跳过
    echo "==开始处理2=="
    echo $dir_name
    if [ ! -a $dir_name ]; then
        chattr +i $dir_name
        echo "--文件夹权限修改--"
        continue
    fi
    echo "==处理完成2=="
done
