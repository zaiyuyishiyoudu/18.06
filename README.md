--------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------

这是OpenWRT Linux发行版的构建系统.

要构建自己的固件，您需要Linux、BSD或MacOSX系统 (案例需要敏感文件系统). 由于缺乏对于区分大小写的文件系统.

您需要安装 gcc, binutils, bzip2, flex, python, perl, make, find, grep, diff,
unzip, gawk, getopt, subversion, libz-dev and libc headers .

1. 运行 "./scripts/feeds update -a" 获取所有最新的包定义定义在 feeds.conf / feeds.conf.default

2. 运行 "./scripts/feeds install -a" 获取所有最新的包定义信息 packages 关联链接到 package/feeds/

3. 运行 "make menuconfig" 选择您的首选配置 工具链，目标系统 & 固件包.

4. 运行 "make" 构建固件。这将下载所有源, 建造交叉编译工具链，然后交叉编译Linux内核 & 全部的为目标系统选择的应用程序.

--------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------
**[图文教程](https://github.com/zaiyuyishiyoudu/Customized/blob/master/COURSE.md)**
# 注意：
1. 不要用 root 用户 git 和编译

2. 源码建议放在用户根目录 不要丢桌面

3. 尽量不要从"windows"里拿源码 因为权限问题可能会出错 需要对比修改权限

4. 国内用户编译前最好准备好科学上网以加快源下载速度

5. 默认登陆IP 192.168.1.1, 密码 空

# 搭建环境：
1. ubuntu:首先装好 Ubuntu 64bit，或  Ubuntu  14 LTS x64

2. 运行 sudo apt-get install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev 安装构建固件所需要的环境或工具
--------------------------------------------------------------------------------------------------------------------
1. centos:版本自已选。。。

2. 运行 yum install subversion binutils bzip2 gcc gcc-c++ gawk gettext flex ncurses-devel zlib-devel make patch unzip perl-ExtUtils-MakeMaker  glibc glibc-devel glibc-static quilt ncurses-lib sed sdcc intltool sharutils bison wget git-core openssl-devel xz  zlib-static 安装构建固件所需要的环境或工具

# 开始编译：
0. 简单编译只需要运行 1 2 3 6 10 就可以了

1. 运行 git clone https://github.com/zaiyuyishiyoudu/18.06.git LEDE 命令下载好源代码，然后 cd LEDE 进入目录

2. 运行 ./scripts/feeds update -a 命令下获取最新应用包源码

3. 运行 ./scripts/feeds install -a 建立与SDK的关联链接

4. make download V=s 只下载dl库 你可以开双终端 一个下载 一个编译 以节约编译时间

5. 运行 make kernel_menuconfig 进入内核定制界面

6. 运行 make menuconfig 进入功能定制界面

7. 运行 make 编译

8. 运行 make V=99 带信息输出编译

9. 运行 make -j V=99 带信息输出全速编译 不建议使用

10. 运行 make -j1 V=99 [-j1 1是线程数，比如你的CPU是双核心四线程 可以是make -j4 V=99 四核心八线程 以此类推

--------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------
