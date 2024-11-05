#!/bin/bash

# 源目录
src_dir="/home/gyx/projects/YOLOPv2/data/final_cams1"
# 目标目录
dest_dir_a="/home/gyx/projects/YOLOPv2/data/final_cams1a"
dest_dir_b="/home/gyx/projects/YOLOPv2/data/final_cams1b"

# 检查源目录是否存在
if [ ! -d "$src_dir" ]; then
    echo "Source directory $src_dir does not exist."
    exit 1
fi

# 创建目标目录
mkdir -p "$dest_dir_a"
mkdir -p "$dest_dir_b"

# 获取子文件夹列表
dirs=("$src_dir"/*)

# 计算子文件夹数量
num_dirs=${#dirs[@]}
half_num=$((num_dirs / 2))

# 移动前一半到目标目录A
for i in $(seq 0 $((half_num - 1))); do
    mv "${dirs[i]}" "$dest_dir_a"
done

# 移动后一半到目标目录B
for i in $(seq $((half_num)) $(expr $num_dirs - 1)); do
    mv "${dirs[i]}" "$dest_dir_b"
done

echo "Folders have been split into $dest_dir_a and $dest_dir_b."