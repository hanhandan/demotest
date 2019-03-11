#!/bin/bash 
export_env_aarch64()
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

export_env_arm()
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
    echo product is x86
    export_env_x86
    ;;
1)
    echo product is arm
    export_env_arm
    ;;
2)
    echo product is aarch64
    export_env_aarch64
    ;;
*)
    echo unsupport product id 
    ;;
esac


