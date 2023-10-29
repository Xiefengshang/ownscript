import requests
import concurrent.futures
import time

# 定义你的 qB UI 的地址
host = "http://1.1.1.1:8080"

# 定义用户名和密码
username = "user"
password = "password"

# 定义需要过滤的种子分类
category = "category"

# 定义 Telegram Bot 的 API token
telegram_token = 'API token'

# 定义 Telegram 用户ID
telegram_chat_id = 'ID'

# 登录并获取 CSRF Token
def get_csrf_token():
    login_url = f"{host}/api/v2/auth/login"
    login_data = {"username": username, "password": password}
    headers = {'User-Agent': 'Mozilla/5.0'}
    response = requests.post(login_url, data=login_data, headers=headers)
    response.raise_for_status()
    return response.cookies.get('SID')

# 定义一个函数，用于获取 JSON 数据
def fetchJSON(url, cookies):
    headers = {'User-Agent': 'Mozilla/5.0'}
    response = requests.get(url, cookies={'SID': cookies}, headers=headers)
    response.raise_for_status()
    return response.json()

# 删除种子及相关文件的函数
def delete_torrents(hash, cookies):
    delete_url = f"{host}/api/v2/torrents/delete"
    # deletefiles=true表示种子和文件一起删除
    data = {'hashes': hash, 'deleteFiles': 'true'}
    headers = {'User-Agent': 'Mozilla/5.0'}
    response = requests.post(delete_url, data=data, cookies={'SID': cookies}, headers=headers)
    response.raise_for_status()
    result = response.json()
    if result["deleted"] == [hash]:
        messages.append(f"种子 {hash} 及相关文件删除成功")
    else:
        messages.append(f"种子 {hash} 及相关文件删除失败")

# 处理种子的函数
def process_torrent(hash, data, cookies):
    if data["category"] == category:
        # 获取特定种子的信息
        trackers = fetchJSON(f"{host}/api/v2/torrents/trackers?hash={hash}", cookies)
        name = data["name"]
        # 过滤出符合条件的种子信息
        filteredTrackers = [tracker for tracker in trackers if tracker["msg"] == "torrent not registered with this tracker"]
        if len(filteredTrackers) > 0:
            # 发送符合条件的种子信息到 Telegram
            message = f"种子名称： {name}\nhash值： {hash}"
            messages.append(message)
            # 删除符合条件的种子及相关文件，只需要通知不需要删除可以注释下面这行
            delete_torrents(hash, cookies)

# 发送消息到 Telegram
def send_telegram_message(message):
    combined_message = '\n'.join(messages)
    requests.get(f"https://api.telegram.org/bot{telegram_token}/sendMessage?chat_id={telegram_chat_id}&text={combined_message}")

# 主函数
def main():
    try:
        start_time = time.time()

        # 获取 CSRF Token
        cookies = get_csrf_token()

        # 定义全局消息列表
        global messages
        messages = []
       
        # 获取主数据
        maindata_url = f"{host}/api/v2/sync/maindata"
        maindata = fetchJSON(maindata_url, cookies)

        # 使用多线程处理种子
        with concurrent.futures.ThreadPoolExecutor() as executor:
            for hash, data in maindata["torrents"].items():
                executor.submit(process_torrent, hash, data, cookies)

        end_time = time.time()
        execution_time = end_time - start_time
        message = f"程序运行时间：{execution_time} 秒"
        messages.append(message)
        
        send_telegram_message(messages)

    except requests.exceptions.RequestException as e:
        print("发生错误:", e)
        send_telegram_message(f"发生错误: {e}")

# 调用主函数
if __name__ == "__main__":
    main()