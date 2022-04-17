
#! /bin/bash
# By BlueSkyXN
#https://github.com/BlueSkyXN/SKY-BOX

#彩色
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}


#系统网络配置优化
function system-best(){
	sed -i '/net.ipv4.tcp_retries2/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_slow_start_after_idle/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_fastopen/d' /etc/sysctl.conf
	sed -i '/fs.file-max/d' /etc/sysctl.conf
	sed -i '/fs.inotify.max_user_instances/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_syncookies/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_fin_timeout/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_tw_reuse/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_syn_backlog/d' /etc/sysctl.conf
	sed -i '/net.ipv4.ip_local_port_range/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_tw_buckets/d' /etc/sysctl.conf
	sed -i '/net.ipv4.route.gc_timeout/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_synack_retries/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_syn_retries/d' /etc/sysctl.conf
	sed -i '/net.core.somaxconn/d' /etc/sysctl.conf
	sed -i '/net.core.netdev_max_backlog/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_timestamps/d' /etc/sysctl.conf
	sed -i '/net.ipv4.tcp_max_orphans/d' /etc/sysctl.conf
	sed -i '/net.ipv4.ip_forward/d' /etc/sysctl.conf

echo "net.ipv4.tcp_retries2 = 8
net.ipv4.tcp_slow_start_after_idle = 0
fs.file-max = 1000000
fs.inotify.max_user_instances = 8192
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_tw_reuse = 1
net.ipv4.ip_local_port_range = 1024 65000
net.ipv4.tcp_max_syn_backlog = 16384
net.ipv4.tcp_max_tw_buckets = 6000
net.ipv4.route.gc_timeout = 100
net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_synack_retries = 1
net.core.somaxconn = 32768
net.core.netdev_max_backlog = 32768
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_max_orphans = 32768
# forward ipv4
#net.ipv4.ip_forward = 1">>/etc/sysctl.conf
sysctl -p
	echo "*               soft    nofile           1000000
*               hard    nofile          1000000">/etc/security/limits.conf
	echo "ulimit -SHn 1000000">>/etc/profile
	read -p "需要重启VPS后，才能生效系统优化配置，是否现在重启 ? [Y/n] :" yn
	[ -z "${yn}" ] && yn="y"
	if [[ $yn == [Yy] ]]; then
		echo -e "${Info} VPS 重启中..."
		reboot
	fi
}

#ChangeSource Linux换源脚本·下载
function cssh(){
wget -O "/root/changesource.sh" "https://raw.githubusercontent.com/BlueSkyXN/ChangeSource/master/changesource.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x "/root/changesource.sh"
chmod 777 "/root/changesource.sh"
blue "下载完成"
echo
green "请自行输入下面命令切换对应源"
green " =================================================="
echo
green " bash changesource.sh 切换推荐源 "
green " bash changesource.sh cn  切换中科大源 "
green " bash changesource.sh aliyun 切换阿里源 "
green " bash changesource.sh 163 切换网易源 "
green " bash changesource.sh aws 切换AWS亚马逊云源 "
green " bash changesource.sh restore 还原默认源 "
}


#VPS 密码修改
function chpass(){
wget -O chpass.sh "https://github.com/Xiefengshang/ownscript/raw/main/chpass.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x chpass.sh
chmod 777 chpass.sh
blue "下载完成"
blue "你也可以输入 bash chpass.sh 来手动运行"
printf "\033c"
bash chpass.sh
}

#SSH 端口修改
function sshport(){
wget -O sshport.sh "https://github.com/Xiefengshang/ownscript/raw/main/ssh.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x sshport.sh
chmod 777 sshport.sh
blue "下载完成"
blue "你也可以输入 bash sshport.sh 来手动运行"
printf "\033c"
bash sshport.sh
}

#进程查看
function process(){
wget -O process.sh "https://github.com/Xiefengshang/ownscript/raw/main/process.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x process.sh
chmod 777 process.sh
blue "下载完成"
blue "你也可以输入 bash process.sh 来手动运行"
printf "\033c"
bash process.sh
}

#端口占用查看
function portcheck(){
wget -O portcheck.sh "https://github.com/Xiefengshang/ownscript/raw/main/port.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x portcheck.sh
chmod 777 portcheck.sh
blue "下载完成"
blue "你也可以输入 bash portcheck.sh 来手动运行"
printf "\033c"
bash portcheck.sh
}

#进程停止
function killprocess(){
wget -O killprocess.sh "https://github.com/Xiefengshang/ownscript/raw/main/kill.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x killprocess.sh
chmod 777 killprocess.sh
blue "下载完成"
blue "你也可以输入 bash killprocess.sh 来手动运行"
printf "\033c"
bash killprocess.sh
}

#回程线路检测
function tracerouteforfun(){
wget -O tracerouteforfun.sh "https://github.com/Xiefengshang/ownscript/raw/main/traceroute.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x tracerouteforfun.sh
chmod 777 tracerouteforfun.sh
blue "下载完成"
blue "你也可以输入 bash tracerouteforfun.sh 来手动运行"
bash tracerouteforfun.sh
}

#swap开启
function swap(){
wget -O swap.sh "https://github.com/Xiefengshang/ownscript/raw/main/swap.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x swap.sh
chmod 777 swap.sh
blue "下载完成"
blue "你也可以输入 bash swap.sh 来手动运行"
bash swap.sh
}

#speedtest-go搭建
function speedtest-go(){
wget -O speedtest-go.sh "https://github.com/Xiefengshang/ownscript/raw/main/speedtest-go.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x speedtest-go.sh
chmod 777 speedtest-go.sh
blue "下载完成"
blue "你也可以输入 bash speedtest-go.sh 来手动运行"
bash speedtest-go.sh
}

#smokeping搭建
function smokeping(){
wget -O smokeping.sh "https://github.com/Xiefengshang/smokeping/raw/main/main.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x smokeping.sh
chmod 777 smokeping.sh
blue "下载完成"
blue "你也可以输入 bash smokeping.sh 来手动运行"
bash smokeping.sh
}

#gclone编译
function gclone(){
wget -O gclone.sh "https://github.com/Xiefengshang/ownscript/raw/main/gclone.sh" --no-check-certificate -T 30 -t 5 -d
chmod +x gclone.sh
chmod 777 gclone.sh
blue "下载完成"
blue "你也可以输入 bash gclone.sh 来手动运行"
bash gclone.sh
}

#主菜单
function start_menu(){
    clear
    red " xieshang 综合工具箱 Linux Supported ONLY" 
    green " FROM: https://github.com/Xiefengshang/ownscript "
    green " HELP: https://www.blueskyxn.com/202104/4465.html "
    green " USE:  wget -O own_box.sh https://raw.githubusercontent.com/Xiefengshang/ownscript/main/box.sh && chmod +x own_box.sh && clear && ./own_box.sh "
    yellow " =================================================="
    green " 1. VPS密码修改" 
    green " 2. SSH端口修改"
    green " 3. 进程查看"
    green " 4. 端口占用查看" 
    green " 5. 进程停止"
    green " 6. 回程检测"
    green " 7. swap开启"
    yellow " --------------------------------------------------"
    green " 8. speedtest-go搭建"
    green " 9. smokeping搭建"
    green " 10. gclone编译"
    yellow " ----------------blueskyxn的脚本--------------------"
    green " 11. 服务器换源"
    green " 12. 系统网络配置优化"
    green " =================================================="
    green " 0. 退出脚本"
    echo
    read -p "请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           chpass
	;;
        2 )
           sshport
	;;
        3 )
           process
	;;
        4 )
           portcheck
	;;
        5 )
           killprocess
	;;
	6 )
           tracerouteforfun
	;;
	7 )
           swap
	;;
	8 )
           speedtest-go
	;;
	9 )
           smokeping
	;;
	10 )
           gclone
     ;;
	11 )
           cssh
     ;;
     12 )
           system-best
     ;;
        0 )
            exit 1
        ;;
        * )
            clear
            red "请输入正确数字 !"
            start_menu
        ;;
    esac
}
start_menu "first"
