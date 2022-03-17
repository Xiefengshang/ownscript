#!/bin/bash
while :; do
    read -rp "请输入需要查询的端口 " port_id
    read -rp "确认需要查询的端口为$port_id? 确认请输入Y,否则输入其他按键 " KEY
    if [[ $KEY == "Y" ]]; then
		break
	fi
done
lsof -i :$port_id