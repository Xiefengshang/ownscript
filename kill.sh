#!/bin/bash
while :; do
    read -rp "请输入需要查询的端口 " port_be_kill
    read -rp "确认需要查询的端口为$port_be_kill? 确认请输入Y,否则输入其他按键 " KEY
    if [[ $KEY == "Y" ]]; then
		break
	fi
done
while :; do
    read -rp "请输入进程相关关键字 " filter_content
    read -rp "确认进程相关关键字为$filter_content? 确认请输入Y,否则输入其他按键 " KEY
    if [[ $KEY == "Y" ]]; then
		break
	fi
done
# 获取Shell返回值
ip_cmd='lsof -i tcp:'$port_be_kill

echo "获取端口号对应的进程命令："$ip_cmd
echo "过滤命令字符串为:"$filter_content

# 执行命令
ip_status=`$ip_cmd`
# 以空格来分隔，转为一个数组变量
array=(${ip_status// / })
function check(){
    local a="$1"
    printf "%d" "$a" &>/dev/null && echo "integer" && return
    printf "%d" "$(echo $a|sed 's/^[+-]\?0\+//')" &>/dev/null && echo "integer" && return
    printf "%f" "$a" &>/dev/null && echo "number" && return
    [ ${#a} -eq 1 ] && echo "char" && return
    echo "string"
}
# 遍历数组
for i in "${!array[@]}"; do
    # 注意：赋值等号=前后不能有空格
    item="${array[i]}"

    # 注意：过滤十六进制字符串
    # 先转为字符串，然后判断是否以0x开头
    # echo $item
    if [[ $item != 0x* ]]
    then
        # 非十六进制数据，即：PID
        if [ $(check $item) = "integer" ]
        then
            # 判断上一个元素是否包含关键字
            # 命令行是否包含关键字
            item_pre="${array[i-1]}"
            # echo $item_pre
            # echo $filter_content
            if [[ $item_pre =~ $filter_content ]]
            then
                # echo $item
                # 调用kill-9 pid命令干掉进程
                kill_cmd="kill -9 "$item
                echo $kill_cmd
                # 执行命令，干掉进程
                $kill_cmd
            fi
        fi
    fi  
done