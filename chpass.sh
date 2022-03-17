#!/bin/bash
while :; do
    read -rp "请输入新的root密码 " SSH_PASS
    read -rp "确认新root密码为$SSH_PASS? 确认请输入Y,否则输入其他按键 " KEY
    if [[ $KEY == "Y" ]]; then
		break
	fi
done
echo root:$SSH_PASS |chpasswd root
sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config;
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config;
service sshd restart;
echo "密码修改完成"