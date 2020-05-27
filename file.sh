#!/bin/bash

# 要创建空文件
empty_file_list=(
    /storage/emulated/0/Android/data/com.sankuai.meituan/cache/startup         # 美团
    /storage/emulated/0/Android/data/com.ss.android.ugc.aweme/awemeSplashCache # 抖音
    /storage/emulated/0/Android/data/tv.danmaku.bili/cache                     # 哔哩哔哩
    /storage/emulated/0/Android/data/com.sankuai.meituan.takeoutnew/cache      # 美团外卖
    /storage/emulated/0/Android/data/com.qidian.QDReader/files/QDReader/image  # 起点
    /storage/emulated/0/Android/data/com.netease.cloudmusic/cache/Ad/          # 网易云音乐
)

# 要修改文件权限
change_attr_list=(
    /storage/emulated/0/Android/data/tv.danmaku.bili/cache
    /storage/emulated/0/Android/data/com.netease.cloudmusic/cache/Ad/
)

for dir_name in ${empty_file_list[@]}; do
    # 对应文件夹不存在则跳过
    echo "==开始处理=="
    echo $dir_name
    if [ ! -d $dir_name ]; then
        echo "--文件夹不存在--"
        continue
    fi
    rm -r $dir_name
    touch $dir_name
    echo "==处理完成=="
done

# 需要root权限
su
for dir_name in ${empty_file_list[@]}; do
    # 对应文件夹不存在则跳过
    echo "==开始处理2=="
    echo $dir_name
    if [ ! -d $dir_name ]; then
        echo "--文件夹不存在2--"
        continue
    fi
    chattr -i $dir_name
    echo "==处理完成2=="
done
