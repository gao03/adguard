#!/bin/bash

# 要创建空文件
empty_file_list=(
    /storage/emulated/0/Android/data/com.sankuai.meituan/cache/startup
    /storage/emulated/0/Android/data/com.ss.android.ugc.aweme/awemeSplashCache
    /storage/emulated/0/Android/data/tv.danmaku.bili/cache
    /storage/emulated/0/Android/data/com.sankuai.meituan.takeoutnew/cache)

# 要修改文件权限
change_attr_list=(
    /storage/emulated/0/Android/data/tv.danmaku.bili/cache)

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
