#!/bin/bash
#This script is used to change the mode of vim
help()
{
cat<<HELP
    First make sure that your location is ~
    USAGE:./chvim.sh [-h] <modename>
HELP
    exit 0
}
error()
{
    echo $1
    exit 1
}

if [ `pwd` != "/home/$USER" ];then
    error "Your location is not ~,you can run 'cd ~' first."
fi
while [ -n $1 ];do
    case $1 in
        -h)help;shift1;;
        -*)error "No such option for script.";;
        *)break;;
    esac
done
[ -z $1 ]&&help
vimnum=$1
test -d ./exvim/$vimnum
if [ $? = 1 ];then
    error "No such mode,you can creat one in exvim."
fi
rm .vimrc
cp ./exvim/$vimnum/.vimrc .
