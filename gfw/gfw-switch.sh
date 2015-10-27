#!/bin/bash

ssPID=`ps aux | grep sslocal | grep -v grep | awk '{print $2}'`
sshPID=`ps aux | grep qTfnN | grep -v grep | awk '{print $2}'`
if  [ -z "$ssPID" ] && [ -z "$sshPID" ] ; then
    echo "Start shadowsocks"
    rm -f /tmp/socks.log
    nohup sslocal -c /Users/tangxm/Workspace/DevEnv/shadowsocks/config.json > /tmp/socks.log&
else
    if [ -n "$ssPID" ] ; then
        echo "Start ssh tunnel"
        kill -9 $ssPID
        ssh -qTfnN -D 18888 as
    else
        echo "Start shadowsocks"
        kill -9 $sshPID
        rm -f /tmp/socks.log
        nohup sslocal -c /Users/tangxm/Workspace/DevEnv/shadowsocks/config.json > /tmp/socks.log&
    fi
fi
