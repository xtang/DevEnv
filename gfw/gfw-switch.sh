#!/bin/bash

function startShadowsocks() {
    echo "Start shadowsocks"
    rm -f /tmp/socks.log
    nohup sslocal -c /Users/tangxm/Workspace/DevEnv/shadowsocks/config.json > /tmp/socks.log&
}

function startSSH() {
    echo "Start ssh tunnel"
    ssh -qTfnN -D 18888 as
}

ssPID=`ps aux | grep sslocal | grep -v grep | awk '{print $2}'`
sshPID=`ps aux | grep qTfnN | grep -v grep | awk '{print $2}'`
if  [ -z "$ssPID" ] && [ -z "$sshPID" ] ; then
else
    if [ -n "$ssPID" ] ; then
        kill -9 $ssPID
        startSSH
    else
        kill -9 $sshPID
        startShadowsocks
    fi
fi
