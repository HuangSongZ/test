#!/bin/bash

# 同步git项目到d199服务器
# 作者：Cascade
# 日期：2025-06-20

# 源目录（当前git项目）
SOURCE_DIR="/home/hanson/test"

# 目标服务器和目录
TARGET_SERVER="root@d199"
TARGET_DIR="/data/test"  # 可以根据需要修改目标目录

# 显示同步开始信息
echo "Starting sync from $SOURCE_DIR to $TARGET_SERVER:$TARGET_DIR"

# 确保目标目录存在
ssh $TARGET_SERVER "mkdir -p $TARGET_DIR"

# 使用rsync进行同步，排除.git目录和其他不需要的文件
rsync -avz --progress \
  --exclude "node_modules/" \
  --exclude "*.log" \
  --exclude "sync_to_d199.sh" \
  $SOURCE_DIR/ $TARGET_SERVER:$TARGET_DIR/

# 检查同步是否成功
if [ $? -eq 0 ]; then
  echo "Sync completed successfully!"
else
  echo "Sync failed with error code $?"
fi
