#!/bin/bash

# 定义要修改的文件路径
SERVICE_FILE="/etc/systemd/system/nezha-agent.service"

# 使用sed命令添加参数到ExecStart行的末尾
sed -i '/^ExecStart=/ s/$/ --report-delay 4 --skip-conn --skip-procs /' "$SERVICE_FILE"
echo "将哪吒上报延迟调整为4s，并跳过进程数和连接数统计"
# 检查sed命令是否执行成功
if [ $? -eq 0 ]; then
    echo "修改成功，正在重新加载systemd配置..."
    # 重新加载systemd的配置文件
    systemctl daemon-reload && systemctl restart nezha-agent.service
else
    echo "修改失败，请检查文件路径或权限。"
fi
