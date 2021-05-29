#!/bin/sh

if test "x$srcdir" = x ; then srcdir=`pwd`; fi
. ../test_common.sh

set -e

testcase1() {
T="$1"
P="$2"
echo -n '	'    
${execdir}/pathcvt $T "$P"
echo ""
}

testcase() {
echo "path: $1:"
    testcase1 "-u" "$1"
    testcase1 "-c" "$1"
    testcase1 "-m" "$1"
    testcase1 "-w" "$1"
}    

testcase "/xxx/a/b"
testcase "d:/x/y"
testcase "d:\\x\\y"
testcase "/cygdrive/d/x/y"
testcase "/d/x/y"
testcase "/cygdrive/d"
testcase "/d"
testcase "/cygdrive/d/git/netcdf-c/dap4_test/test_anon_dim.2.syn"

exit 0
