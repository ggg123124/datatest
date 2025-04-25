#!/bin/sh
[ $# -ne 2 ] && {
 echo "Usage: sh 0263.sh <SU用户(SU或高权限用户)> <SU密码>";
 exit 1;
}

cdir=`pwd`



# 执行pl脚本
perl $cdir/0263.pl "${1}" "${2}"
