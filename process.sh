#!/bin/bash
while :; do
    read -rp "请输入需要查询的进程名称 " PROCESS_NAME
    read -rp "确认需要查询的进程名称为$PROCESS_NAME? 确认请输入Y,否则输入其他按键 " KEY
    if [[ $KEY == "Y" ]]; then
		break
	fi
done
ps -ef|grep $PROCESS_NAME