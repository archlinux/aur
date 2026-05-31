import concurrent.futures
import os
import re
import time
import json
from dataclasses import dataclass
from functools import cache
from typing import Dict, List, Callable,Any
from constant import *
from threading import Thread, local
import requests
from urllib3.util.retry import Retry
from requests.adapters import HTTPAdapter
_cookie_dir = os.path.expanduser("~/.config/shuiyuan-exporter")
_cookie_default_path = os.path.join(_cookie_dir, "cookies.txt")
@cache
def read_cookie(path:str = _cookie_default_path):
    if not os.path.exists(path):
        return ""
    with open(path,"r") as f:
        return f.read()

def set_cookie(data:str, path:str = _cookie_default_path):
    read_cookie.cache_clear()
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path,"w",encoding='utf-8') as f:
        f.write(data)

def validate_cookie(cookie_str):
    # 正则表达式用于匹配 Cookie 名称和值
    cookie_pattern = re.compile(r'^(?:\s*\w+\s*=\\s*[^;]*;)+$')
    return cookie_pattern.match(cookie_str) is not None

@dataclass
class ReqParam:
    url: str
    headers: Dict
    retries: int = 3
    delay: int = 1
    def __init__(self, url: str):
        self.url = url
        self.headers = {
            'User-Agent': UserAgentStr,
            'Cookie': read_cookie()
        }


# def retry(retries:int, delay:int):
#     def decorator(func):
#         def wrapper(*arg, **kwargs):
#             for i in range(retries):
#                 try:
#                     response = func(*arg, **kwargs)
#                     return response
#                 except Exception as e:
#                     nonlocal delay
#                     print(f'Exception: {e}, Retry: {i}')
#                     if i < retries - 1:
#                         time.sleep(delay)
#                         delay *= 2
#         return wrapper
#     return decorator

_url_retry = Retry(connect=3, backoff_factor=0.5)
adapter = HTTPAdapter(max_retries=_url_retry)


def init_session():
    Shuiyuan_Session = requests.Session()
    Shuiyuan_Session.headers.update({
            'User-Agent': UserAgentStr,
            'Cookie': read_cookie()
    })
    Shuiyuan_Session.mount('http://', adapter)
    Shuiyuan_Session.mount('https://', adapter)
    return Shuiyuan_Session
_init_session, _req_session = False, None

# thread_local = local()
_request_posts_cache:Dict[str, Any] = {}
def make_request(param: ReqParam, once=True):
    cacheable:bool = ".json" in param.url # 目前只有同一个topic下的json是会多次请求的
    if cacheable and param.url in _request_posts_cache.keys():
        return _request_posts_cache[param.url]
    global _req_session
    if not _init_session:
        _req_session = init_session()
    if not _req_session:
        raise NotImplementedError
    def req_once():
        response = _req_session.get(param.url, headers=param.headers)
        if cacheable:
            _request_posts_cache[param.url] = response
        return response

    # @retry(retries=param.retries, delay=param.delay)
    def req_multi():
        return req_once()

    if once:
        return req_once()
    return req_multi()




def parallel_topic_in_page(topic:str, limit: int):
    def decorator(func:Callable[[int], Any]):
        def wrapper():
            nonlocal topic
            url_json = Shuiyuan_Topic + topic + '.json'  # 从原始json中得到楼数
            headers = {
                'User-Agent': UserAgentStr,
                'Cookie': read_cookie()
            }
            req_param = ReqParam(url=url_json)
            response_json = make_request(req_param, once=True)

            try:
                data = json.loads(response_json.text)
                pages = data['posts_count'] // limit + (1 if data['posts_count'] % limit != 0 else 0)
            except Exception as e:
                raise Exception(f"获取页数失败! 原因:{e}")
            print(f"总页数 {pages}: 正在爬取......")
            result_futures = []
            with concurrent.futures.ThreadPoolExecutor() as executor:
                for i in range(1, pages + 1):
                    fu = executor.submit(func, i)
                    result_futures.append(fu)
                print("工作已加载完毕")
            results = []
            for cnt, res in enumerate(concurrent.futures.as_completed(result_futures)):
                try:
                    # print(res)
                    results.append(res.result())
                    if cnt % 10 == 0:
                        print(f"--- 已完成工作: {cnt}/{pages}")
                except Exception as e:
                    print(f'Exception: {e}')
            return results
        return wrapper
    return decorator

def code_block_fix(content:str)->str:
    def find_end_pos(content:str, start:int=None, end:int=None)->int:
        layer_pos = content.find(layer_pagination, start, end)
        details_pos = content.find(details_end_pagination, start, end)
        if layer_pos == -1 and details_pos == -1:
            return -1
        elif layer_pos == -1:
            return details_pos
        elif details_pos == -1:
            return layer_pos
        else:
            return min(layer_pos, details_pos)
    fixed_content = ""
    insert_pos = []
    code_block_start = 0
    while True:
        code_block_start = content.find(code_block_pagination, code_block_start)
        if code_block_start == -1:
            break
        code_block_start += 1
        code_block_end = content.find(code_block_pagination, code_block_start)
        #layer_pos = content.find(layer_pagination, code_block_start)
        end_pos = find_end_pos(content, start=code_block_start)
        if end_pos == -1:
            break
        elif code_block_end == -1:
            insert_pos.append(end_pos)
            break
        elif end_pos < code_block_end:
            insert_pos.append(end_pos)
            code_block_start = code_block_end
        elif end_pos > code_block_end:
            code_block_start = end_pos
    if not insert_pos:
        return content
    for i in range(len(insert_pos)):
        fixed_content += content[:insert_pos[i]] + code_block_pagination + "\n"
    fixed_content += content[insert_pos[-1]:]
    return fixed_content

def get_main_raw_post(topic:str, post:str)->str:
    if not topic:
        return ""
    if post:
        url_raw = Shuiyuan_Raw + topic + "/" + post
    else:
        url_raw = Shuiyuan_Raw + topic + "/1"
    response = make_request(ReqParam(url=url_raw), once=False)
    if response.status_code == 200:
        data = response.text
        return data
    return ""


def add_md_quote(md_text: str) -> str:
    """
    Adds Markdown quote formatting to the given text.

    :param md_text: The Markdown text to be converted to a quote.
    :return: The quoted Markdown text.
    """
    # Split the text into lines
    lines = md_text.splitlines()

    # Add the quote symbol '>' to each line
    quoted_lines = [f"> {line}" for line in lines]

    # Join the lines back into a single string with newlines
    quoted_text = "\n".join(quoted_lines)

    return quoted_text

def quote_in_shuiyuan(md_text:str)->str:
    """
    parse links like https://shuiyuan.sjtu.edu.cn/t/topic/XXXXX(/XXXX) to quote
    """
    # 定义正则表达式匹配代码块（包括行内代码和块级代码）
    code_block_pattern = r"(?P<code_block>```[\s\S]*?```|`[^`]*`)"

    # 定义正则表达式匹配Markdown格式的链接（[链接文本](链接地址)）
    markdown_link_pattern = r"\[.*?\]\(https?://[^\)]+\)"

    # 定义正则表达式匹配裸链接（http:// 或 https:// 开头的链接）
    bare_link_pattern = r"https://shuiyuan\.sjtu\.edu\.cn/t/topic/(\d+)(/(\d+))?"

    # 保存代码块和Markdown格式链接的原始内容
    code_blocks = re.findall(code_block_pattern, md_text)
    markdown_links = re.findall(markdown_link_pattern, md_text)

    # 替换代码块和Markdown格式链接为占位符
    temp_text = re.sub(code_block_pattern, "%%CODE_BLOCK%%", md_text)
    temp_text = re.sub(markdown_link_pattern, "%%MARKDOWN_LINK%%", temp_text)

    def replace(m:re.Match)->str:
        topic = m[1]
        post = m[3]
        quote_text = get_main_raw_post(topic, post)
        return add_md_quote(quote_text)


    replaced_text = re.sub(bare_link_pattern, replace, temp_text)

    # 还原代码块和Markdown格式链接
    for block in code_blocks:
        replaced_text = replaced_text.replace("%%CODE_BLOCK%%", block, 1)
    for link in markdown_links:
        replaced_text = replaced_text.replace("%%MARKDOWN_LINK%%", link, 1)

    return replaced_text