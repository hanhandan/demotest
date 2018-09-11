#!/bin/bash

usage ()
{
    echo "$0  <source_dir>  <package_name>  <version>"
}

if [ $# -lt 3 ] ; then
    echo "param less the 3"
    usage
    exit 1
fi


VERSION_NO=$3
CURDIR=`pwd`
OUTPUT=$CURDIR/output
IPK_NAME=$2
IPK_FILE_DIR=$1

create_meson_ipk ()
{
    mkdir -p ${IPK_FILE_DIR}/CONTROL
    cd ${IPK_FILE_DIR}
    echo "Package: $IPK_NAME" > CONTROL/control
    echo "Priority: optional" >> CONTROL/control
    echo "Version: ${VERSION_NO}" >> CONTROL/control
    echo "Architecture: meson" >> CONTROL/control
    echo "Maintainer: xlwthink<xlwthink@xunlei.com>" >> CONTROL/control
    echo "Depends:" >> CONTROL/control
    echo "Source: null" >> CONTROL/control
    echo "Section: extras" >> CONTROL/control
    echo "Description: Xunlei miner software." >> CONTROL/control
    cd -
    mkdir -p $OUTPUT
    echo "ipkg-build -o root -g root $IPK_FILE_DIR $OUTPUT"
    sed -e "s/IPK_REPO/zqb_ipk/g" ${IPK_FILE_DIR}/../ipk_opkg.conf.tpl > ${IPK_FILE_DIR}/app/miner.xyipkmng.ipk/ipk_opkg.conf 
    ipkg-build -o root -g root $IPK_FILE_DIR $OUTPUT
    #    rm -rf  ${IPK_FILE_DIR}/app/CONTROL
    cd ${CURDIR}
}

create_arm_ipk ()
{
    mkdir -p ${IPK_FILE_DIR}/CONTROL
    cd ${IPK_FILE_DIR}
    echo "Package: $IPK_NAME" > CONTROL/control
    echo "Priority: optional" >> CONTROL/control
    echo "Version: ${VERSION_NO}" >> CONTROL/control
    echo "Architecture: arm" >> CONTROL/control
    echo "Maintainer: xlwthink<xlwthink@xunlei.com>" >> CONTROL/control
    echo "Depends:" >> CONTROL/control
    echo "Source: null" >> CONTROL/control
    echo "Section: extras" >> CONTROL/control
    echo "Description: Xunlei miner software." >> CONTROL/control
    cd -
    mkdir -p $OUTPUT
    sed -e "s/IPK_REPO/mcloud_ipk/g" ${IPK_FILE_DIR}/../ipk_opkg.conf.tpl > ${IPK_FILE_DIR}/app/miner.xyipkmng.ipk/ipk_opkg.conf 
    echo "ipkg-build -o root -g root $IPK_FILE_DIR $OUTPUT"
    ipkg-build -o root -g root $IPK_FILE_DIR $OUTPUT
    #    rm -rf  ${IPK_FILE_DIR}/app/CONTROL
    cd ${CURDIR}
}

# clean and construct
rm -rf $OUTPUT
create_arm_ipk
create_meson_ipk

