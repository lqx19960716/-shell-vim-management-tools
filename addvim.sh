#!/bin/bash
#bthis script is used to add or remove mode file from exvim.
help()
{
    echo "USAGE:./addvim.sh [-h/-r] <modename>"
    exit 0
}
error()
{
    echo $1
    exit 1
}

flag=1
while [ -n $1 ];do
    case $1 in
        -h)help;shift1;;
        -r)flag=0;shift;;
        -*)error "No such option for script.";;
        *)break;;
    esac
done
[ -z $1 ]&&help
test -d ~/exvim
if [ $? = 1 ];then
    mkdir ~/exvim
fi
test -d ~/exvim/$1
ex=$?
if [ $flag = 1 ];then
    if [ $ex = 0 ];then
        echo "This mode is esiting,do you want to cover it?(y/n)"
        read ans
        if [ $ans = "n" ];then
            error "Change the modename please."
        elif [ $ans != "y" ];then
            error "Something wrong."
        fi
    else
        mkdir ~/exvim/$1
    fi
    cp ~/.vimrc ~/exvim/$1
else
    if [ $ex = 1 ];then
        error "No such mode."
    else
        echo "Are you sure to remove the mode $1(y/n)?"
        read ans
        if [ $ans = "n" ];then
            exit 2
        elif [ $ans != "y" ];then
            error "Something wrong."
        fi
        rm -r ~/exvim/$1
    fi
fi
