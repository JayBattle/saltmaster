#!/bin/bash
service oneagent start
salt-master -d start
salt-minion -d start
sleep 10
salt-key
salt-key -y -A
sleep 30
salt '*' test.ping
killall salt-master
sleep 60
salt-master -l debug
/bin/bash