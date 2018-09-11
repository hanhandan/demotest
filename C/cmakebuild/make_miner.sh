export_env_ws1508()
{
    ROOT="/opt"
    export STAGING_DIR=$ROOT/staging_dir/target-arm_cortex-a5+neon_eglibc-2.19_eabi
    CROSS_TOOLCHAINS_DIR=$ROOT/staging_dir/toolchain-arm_cortex-a5+neon_gcc-4.8-linaro_eglibc-2.19_eabi

    export PATH=$PATH:${CROSS_TOOLCHAINS_DIR}/bin
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CROSS_TOOLCHAINS_DIR/usr/lib:$ROOT/build/lib
    export CROSS_COMPILE=arm-openwrt-linux-gnueabi-
}

function init_env()
{
    ENV_DIR=$(dirname $0)
    echo "path: $ENV_DIR"
    rm ${ENV_DIR}/default.cmake
    ln -s ${ENV_DIR}/${ARCH_MAKE} ${ENV_DIR}/default.cmake
    rm ${ENV_DIR}/../bin/libs
    ln -s  ${ENV_DIR}/../${THIRD_LIB_PATH} ${ENV_DIR}/../bin/libs
}

function choose_info()
{
    echo
    echo "Please choose the arch you what build:"
    echo "        1.x86"
    echo "        2.armv7l"
    echo ""
}

function choose_arch()
{
    choose_info
    local DEFAULT_NUM DEFAULT_VALUE
    DEFAULT_NUM=1
    echo -n "Which one would you like ? ["$DEFAULT_NUM"] "
    if [ -z "$1" ]; then
        read ANSWER
    else
        echo $1
        ANSWER=$1
    fi

    case $ANSWER in
    1)
        export ARCH_MAKE="x86.cmake"
        export THIRD_LIB_PATH="x86_lib"
        ;;
    2)
        export ARCH_MAKE="cross.cmake"
        export THIRD_LIB_PATH="boxv2_lib"
        export_env_ws1508
        ;;
    *)
        echo "Default x86 arch"
        export ARCH_MAKE="x86.cmake"
        export THIRD_LIB_PATH="x86_lib"
        ;;
    esac
}

choose_arch
init_env
