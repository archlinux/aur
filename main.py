import platform

from image_handler import *
from attachments_handler import *
from constant import *
from utils import *
from typing import Tuple
from pathlib import Path
import argparse
import pstats
from pstats import SortKey
import cProfile
from audio_handler import *
from video_handler import *
import sys

def raw_post(path:str, topic:str)->str:
    """
    获取任意编号下的帖子
    """
    url_json = Shuiyuan_Topic_Json + topic + ".json"
    response_json = make_request(param=ReqParam(url_json), once=False)
    title = "Empty"
    if response_json.status_code == 200:
        data = json.loads(response_json.text)
        title = data['title']
    filename = (str(title) + '.md').replace('/', ' or ')
    filename = re.sub(r'[\\/*?:"<>|]', '_', filename)
    filename = topic + ' ' + filename
    with open(path + filename, 'w', encoding='utf-8') as file:
        file.write("")
    @parallel_topic_in_page(topic=topic, limit=raw_limit)
    def handle_func(page_no: int) -> Tuple[int, str]:
        url_raw = Shuiyuan_Raw + topic + '?page=' + str(page_no)
        response_raw = make_request(param=ReqParam(url_raw), once=False)
        if response_raw.status_code == 200:
            return page_no, quote_in_shuiyuan(code_block_fix(response_raw.text))
        return page_no, ""

    # with concurrent.futures.ThreadPoolExecutor() as executor:
    #     for i in range(1, posts_count + 1):
    #         handle_futures.append(executor.submit(handle_func, i))
    handle_res = handle_func()
    # join
    to_write: List[Tuple[int, str]] = []
    # for future in concurrent.futures.as_completed(handle_futures):
    #     to_write.append(future.result())
    for result in handle_res:
        to_write.append(result)
    to_write.sort(key=lambda x: x[0])
    file_text = ""
    post_num = 1
    for _, page_text in to_write:
        parts = page_text.split(layer_pagination)
        for i, part in enumerate(parts):
            if i > 0:
                file_text += layer_pagination
                post_num += 1
            if part.strip():
                file_text += f"**#{post_num}**\n\n"
                file_text += part

    with open(path + filename, 'w', encoding='utf-8') as file:
        file.write(file_text)
    return filename

def export_exec(topic:str, save_dir:str = default_save_dir):
    topic = str(topic)
    topic = topic[1:] if topic[0] == "L" else topic
    print(f'topic:{topic} 文字备份中...')

    path = f'{save_dir}/'
    os.makedirs(path, exist_ok=True)
    last_time = time.time()
    filename = raw_post(path=path, topic=topic)
    print(f"文字爬取耗时: {time.time() - last_time} 秒")
    last_time = time.time()
    img_replace(path=path, filename=filename, topic=topic)
    print(f"图片爬取耗时: {time.time() - last_time} 秒")
    last_time = time.time()
    match_replace(path=path, filename=filename, topic=topic)
    print(f"附件爬取耗时: {time.time() - last_time} 秒")
    last_time = time.time()
    video_replace(path=path, filename=filename, topic=topic)
    print(f"视频爬取耗时: {time.time() - last_time} 秒")
    last_time = time.time()
    audio_replace(path=path, filename=filename, topic=topic)
    print(f"音频爬取耗时: {time.time() - last_time} 秒")
    print(f'编号为 #{topic} 的帖子已备份为本地文件：{filename}\n')
    print("Exit.")

def export_input(save_dir:str = default_save_dir):
    topic = input('请输入帖子编号:(退出请输入"???")\n')
    if topic == "???":
        raise Exception("Exit.")
    export_exec(topic)


def cookie_set():
    """
    设置cookie
    如成功设置则返回True，否则返回False退出
    """
    while True:
        cookies = input('请输入cookie:(如果使用上次结果请输入"!!!",退出输入"???")\n')
        if cookies == "???":
            return False
        if cookies == "!!!":
            cookie_string = read_cookie()
            if len(cookie_string) != 0:
                return True
            print('您还未设置cookie！')
        elif len(cookies) != 0:
            set_cookie(data=cookies)
            print("已同步新cookie到文件")
            return True


def run(batch_topic:Tuple[str] = None, ask_cookie=True, save_dir:str = default_save_dir):
    if ask_cookie:
        cookie_set()
    if batch_topic and len(batch_topic) != 0:
        for topic in batch_topic:
            try:
                export_exec(topic=topic, save_dir=save_dir)
            except Exception as e:
                print(e)
        return
    else:
        while True:
            try:
                export_input(save_dir=save_dir)
            except Exception as e:
                print(e)
                break
def clean(directory = Path(default_save_dir)):
    def clean_helper(file):
        if item.is_dir() and re.match(r'\d+', item.name):
            print(f"目录: {item}")
            for file in item.iterdir():
                if file.name.endswith('Empty.md') or file.name.endswith('Single Sign On.md'):
                    os.remove(file)
    for item in directory.iterdir():
        if item.is_dir() and not re.match(r'\d+', item.name):
            clean(directory=item)
        elif item.is_dir():
            clean_helper(item)


def stat(program: str):
    stat_dir = Path("./stat")
    if not stat_dir.exists():
        stat_dir.mkdir()
    cProfile.run(f'{program}', './stat/run_stats.txt')
    p = pstats.Stats('./stat/run_stats.txt')
    p.strip_dirs().sort_stats(SortKey.TIME).print_stats(10)


def detect_os():
    os_name = platform.system()
    if os_name == "Windows":
        return "Windows"
    elif os_name == "Linux":
        return "Linux"
    elif os_name == "Darwin":  # macOS 系统在 platform.system() 中返回 'Darwin'
        return "macOS"
    else:
        raise NotImplementedError(f"Unsupported OS: {os_name}")

def choose_list()->Tuple[str, List]:
    """
    choose a list from quality_list.py in CLI interaction
    :return: list_name, list
    """
    local_vars = {}

    with open("quality_list.py", "r") as f:
        exec(f.read(), None, local_vars)
    lists_only = {k: v for k, v in local_vars.items() if isinstance(v, list)}
    list_names = [k for k in lists_only.keys()]
    host_os = detect_os()
    if host_os in ["Linux", "macOS"]:
        from simple_term_menu import TerminalMenu
        terminal_menu = TerminalMenu(list_names)
        menu_entry_index = terminal_menu.show()

        return list_names[menu_entry_index], lists_only[list_names[menu_entry_index]]
    elif host_os in ["Windows"]:
        import dumb_menu
        index = dumb_menu.get_menu_choice(list_names)
        return list_names[index], lists_only[list_names[index]]
    else:
        raise NotImplementedError(f"Unsupported OS: {host_os}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="The script is created to export posts on Shuiyuan Forum as markdown documents.")
    parser.add_argument('-b', '--batch', nargs='+',type=str, help='For test and CI: -b 1 2 3 means download the topic 1, 2, 3')
    parser.add_argument('-c', '--clean', action='store_true', help='clean the posts folder for possible meaningless md')
    parser.add_argument('-n','--not_ask_cookie', action='store_true', help='if ask for cookie or use saved cookie directly')
    parser.add_argument('-s', '--stat', action='store_true', help="stat the time consuming analysis and save.")
    parser.add_argument('-l','--list', action='store_true', help="list the available quality list and pull one in batch mode.)")
    args = parser.parse_args()
    ask = not args.not_ask_cookie if args.not_ask_cookie else True
    if args.list:
        name, choose_list = choose_list()
        dir = f"{default_save_dir}/{name}"
        os.makedirs(dir, exist_ok=True)
        run(choose_list, ask_cookie=False, save_dir=dir)
        sys.exit(0)
    if args.batch:
        print(args.batch)
        run(args.batch, ask_cookie=ask)
    elif args.clean:
        clean()
    elif args.stat:
        stat("run(['276006'], False)")
    else:
        run(ask_cookie=ask)
