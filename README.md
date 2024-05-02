# 自用/修改的一些脚本。
**理论而言仅适用于Ubuntu/Debian系,我没有加yum的库的适配,需要的可以自己加**  
`own_box.sh`为自己几个脚本小合集+抄了[blueskyxn](https://github.com/BlueSkyXN/SKY-BOX)里面的一些东西。  
`gclone.sh`为[gclone mod](https://github.com/dogbutcat/gclone) 的一键脚本。  
`ssh.sh`为修改`ssh`端口脚本(**记得改之前把目标ssh端口开放！**)  
`chpass.sh`为修改`ssh`密码脚本(**如若之前未开放密码登录则运行脚本之后会自动开启密码登录**)  
`process.sh`为查看进程脚本  
`port.sh`为查看端口占用脚本  
`kill.sh`为停止进程的脚本  
`traceroute.sh`为回程线路检测脚本**仅供娱乐**  
`swap.sh`为开启swap的脚本,从`Moerats`那边`copy`过来的(  
`speedtest-go.sh`为`speedtest-go`的搭建脚本,基于[这个库](https://github.com/mengskysama/speedtest-go),加了自定义端口以及自定义单IP 24h允许的流量。  

## 使用
### 没存在该仓库的
#### hyperspeed测速
```
rm -rf hyperspeed.sh && wget -O hyperspeed.sh "https://github.com/veoco/bim-core/raw/main/hyperspeed.sh" && bash hyperspeed.sh
```
#### i-abc测速
```
rm -rf speedtest.sh && wget -O speedtest.sh "https://github.com/i-abc/Speedtest/raw/main/speedtest.sh" && bash speedtest.sh
```
### 自用所有脚本合集
```
bash -c "$(curl -L https://github.com/Xiefengshang/ownscript/raw/main/own_box.sh)"
```
### 网络优化脚本(`BBR`下载地址懒得改，还是NNR的)
**偷自nnr.moe**
```
wget https://raw.githubusercontent.com/Xiefengshang/ownscript/main/tools.sh && bash tools.sh
```
### 回程路由测试(源自[这位佬](https://github.com/Chennhaoo/Shell_Bash),仅作备份,优先使用他的脚本吧)
```
wget -N --no-check-certificate https://raw.githubusercontent.com/Xiefengshang/ownscript/main/AutoTrace.sh && chmod +x AutoTrace.sh && bash AutoTrace.sh
```
### 改密码
```
bash -c "$(curl -L https://github.com/Xiefengshang/ownscript/raw/main/chpass.sh)"
```
### ssh端口修改
```
bash -c "$(curl -L https://github.com/Xiefengshang/ownscript/raw/main/ssh.sh)"
```
### gclone安装
```
bash -c "$(curl -L https://github.com/Xiefengshang/ownscript/raw/main/gclone.sh)"
```
### speedtest-go安装
```
bash -c "$(curl -L https://github.com/Xiefengshang/ownscript/raw/main/speedtest-go.sh)"
```
### hzcloud dd win
```
wget -O- "gz系统包连接" |gunzip| dd of=/dev/sda
```
