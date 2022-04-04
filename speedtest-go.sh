apt install wget -y
apt install jq -y
apt install tar -y

mkdir -p ./speedtest-go && cd ./speedtest-go
version=$(curl -sL https://api.github.com/repos/mengskysama/speedtest-go/releases | jq -r ".[0].tag_name")
wget https://github.com/mengskysama/speedtest-go/releases/download/$version/speedtest-go-$version-`uname -s`-`dpkg --print-architecture`.tar.gz -O speedtest-go.tar.gz
tar -zxvf speedtest-go.tar.gz

read -rp "你想要运行在哪个端口上?默认为9999:" port
read -rp "请输入每个IP每24小时能跑的流量，以G为单位，默认为10G:" traffic
sed -i 's/10/'${traffic:-10}'/' ./settings.toml
sed -i 's/9999/'${port:-9999}'/' ./settings.toml

nohup ./speedtest-go -c settings.toml &
rm -rf speedtest-go.tar.gz
echo "测速端口为${port:-9999}"
echo "注意：settings.toml里面 ip_daily_traffic_limit 可以设置每个IP每24小时能跑的流量"
echo "改了配置需要执行pkill speedtest-go杀掉，重启一下。"