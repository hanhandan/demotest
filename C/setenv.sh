#!/bin/bash 

download_toolchain()
{
    if [ ! -d ./toolchain ];then
        echo "Downloading toolchain from gitlab"
        git clone git@wx-gitlab.xunlei.cn:FirmwareSupport/toolchain.git
    fi
}


export_env_ws1508()
{
    export ROOT=`pwd`
    export PRODUCT_ID='WS1508'
    export STAGING_DIR="/opt/staging_dir/target-arm_cortex-a5+neon_eglibc-2.19_eabi"
    CROSS_TOOLCHAINS_DIR="/opt/staging_dir/toolchain-arm_cortex-a5+neon_gcc-4.8-linaro_eglibc-2.19_eabi"
    
    if [ ! -h "/opt/staging_dir" ];then
        if [ ! -x "${ROOT}/toolchain/staging_dir" ];then
            cd ${ROOT}
            download_toolchain
            cd $ROOT/toolchain
            tar xjvf staging_dir.tar.bz2 
        fi

        echo "Running command : sudo ln -s ${ROOT}/toolchain/staging_dir /opt/staging_dir"
        echo "Please input the root password,and continue"
        sudo ln -s ${ROOT}/toolchain/staging_dir /opt/staging_dir
        echo "Create soft link /opt/staging_dir success"
    fi

   
    export PATH=$PATH:${CROSS_TOOLCHAINS_DIR}/bin
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CROSS_TOOLCHAINS_DIR/usr/lib:$ROOT/build/lib
    export NAND_FLASH_SUPPORT=1
    export AMLOGIC_PLATFORM=1
    export CROSS_COMPILE=arm-openwrt-linux-gnueabi-
    export TOOLCHAIN_ROOT="/opt/staging_dir/target-arm_cortex-a5+neon_eglibc-2.19_eabi"
    export REPO_NAME=zqb_ipk
    cd $ROOT
}

_export_env_ws1508()
{
    export ROOT=`pwd`
    export PRODUCT_ID='WS1508'
    CROSS_TOOLCHAINS_DIR="/opt/openlinux-toolchain"

    if [ ! -h "/opt/openlinux-toolchain" ];then
        if [ ! -x "${ROOT}/toolchain/openlinux-toolchain" ];then
            cd ${ROOT}
            download_toolchain
            cd $ROOT/toolchain
            tar xjvf openlinux-toolchain.tar.bz2
        fi

        echo "Running command : sudo ln -s ${ROOT}/toolchain/openlinux-toolchain /opt/openlinux-toolchain"
        echo "Please input the root password,and continue"
        sudo ln -s ${ROOT}/toolchain/openlinux-toolchain /opt/openlinux-toolchain
        echo "Create soft link /opt/openlinux-toolchain success"
    fi

    export PATH=$PATH:${CROSS_TOOLCHAINS_DIR}/bin
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CROSS_TOOLCHAINS_DIR/usr/lib:$ROOT/build/lib
    export NAND_FLASH_SUPPORT=1
    export AMLOGIC_PLATFORM=1
    export CROSS_COMPILE=arm-linux-gnueabihf-
    export TOOLCHAIN_ROOT="/opt/openlinux-toolchain"
    cd $ROOT
}

export_env_ws1608()
{
    export ROOT=`pwd`
    export PRODUCT_ID='WS1608'
    CROSS_TOOLCHAINS_DIR="/opt/openlinux-toolchain"

    if [ ! -h "/opt/openlinux-toolchain" ];then
        if [ ! -x "${ROOT}/toolchain/openlinux-toolchain" ];then
            cd ${ROOT}
            download_toolchain
            cd $ROOT/toolchain
            tar xjvf openlinux-toolchain.tar.bz2
        fi

        echo "Running command : sudo ln -s ${ROOT}/toolchain/openlinux-toolchain /opt/openlinux-toolchain"
        echo "Please input the root password,and continue"
        sudo ln -s ${ROOT}/toolchain/openlinux-toolchain /opt/openlinux-toolchain
        echo "Create soft link /opt/openlinux-toolchain success"
    fi

    export PATH=$PATH:${CROSS_TOOLCHAINS_DIR}/bin
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CROSS_TOOLCHAINS_DIR/usr/lib:$ROOT/build/lib
    export NAND_FLASH_SUPPORT=1
    export AMLOGIC_PLATFORM=1
    export CROSS_COMPILE=arm-linux-gnueabihf-
    export TOOLCHAIN_ROOT="/opt/openlinux-toolchain"
    export REPO_NAME=mcloud_ipk
    cd $ROOT
}

print_help()
{
    echo "Set up env for minecraft pro"
    echo "$0 1"

    echo ""
    echo "Set up env for onecloud"
    echo "$0 2"
}

if  [ $# -lt 1 ];then
    echo $#
    print_help
    return
fi




case $1 in
"")
    echo product is ws1408
    export_env_ws1608
    ;;
1)
    echo product is minecrafter pro
    export_env_ws1508
    ;;
2)
    echo product is onecloud
    export_env_ws1608
    ;;
*)
    echo unsupport product id 
    ;;
esac


