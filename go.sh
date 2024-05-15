#!/bin/sh
 
# 下载Go二进制文件
GO_VERSION="1.16.5"
GO_OS="darwin"
GO_ARCH="arm64"
curl -O "https://dl.google.com/go/go$GO_VERSION.$GO_OS-$GO_ARCH.tar.gz"
 
# 检查下载的文件
echo "检查下载的文件"
if [ ! -f "go$GO_VERSION.$GO_OS-$GO_ARCH.tar.gz" ]; then
    echo "文件未下载，退出"
    exit 1
fi
 
# 解压缩
echo "解压缩"
tar -xzf "go$GO_VERSION.$GO_OS-$GO_ARCH.tar.gz"
 
# 移动Go到合适的目录
echo "移动Go到 /usr/local"
sudo mv go /usr/local
 
# 设置环境变量
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile
echo 'export GOPATH=$HOME/go' >> ~/.profile
 
# 应用更改
source ~/.profile
 
# 验证安装
go version
