#!/bin/bash
make
./mkfs -f test.img
base=~cs537-1/tests/p4/p4-test
killall server
pkill -9 -u $USER -f "/home/cs537-1/tests/p4/Python-2.7.1/python  $base/p4-test/project4.py"
/home/cs537-1/tests/p4/Python-2.7.1/python $base/project4.py --test-path $base $@ | tee -i runtests.log
exit $?
