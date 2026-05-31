import concurrent.futures
import json
import re
from typing import List, Tuple

from constant import Shuiyuan_Base, Shuiyuan_Raw, UserAgentStr, Shuiyuan_Topic_Json, json_limit
from utils import read_cookie, make_request, ReqParam, parallel_topic_in_page


def video_replace(path:str, filename:str, topic:str):
    """
    :param path:
    :param filename:
    :param topic:
    :return:
    """
    print('视频替换中...')
    file = open(path + filename, 'r', encoding='utf-8')
    md_content = file.read()
    @parallel_topic_in_page(topic=topic, limit=json_limit)
    def fetch_attachment(page_no: int) -> List[Tuple[str, str]]:
        try:
            url_json = Shuiyuan_Topic_Json + topic + '.json' + "?page=" + str(page_no)
            param = ReqParam(url=url_json)
            response_json = make_request(param, once=False)
            if response_json.status_code == 200:
                data = json.loads(response_json.text)
                posts_list = data['post_stream']['posts']
                url_sha1s = []
                for post in posts_list:
                    cooked_content = post['cooked']
                    cooked_match = re.findall(r'class="video-placeholder-container" data-video-src="([^"]+)"', cooked_content)
                    if cooked_match:
                        url_raw = Shuiyuan_Raw + topic + "/" + str(post['post_number'])
                        raw_content = make_request(param=ReqParam(url_raw)).text
                        raw_match = re.findall(r'\[.*?\|video\]\(upload://([a-zA-Z0-9]+)\.([a-zA-Z0-9]+)\)',
                                               raw_content)
                        raw_match = [t[0] + "." + t[1] for t in raw_match]
                        url_sha1 = [(Shuiyuan_Base + url, sha1) for url, sha1 in zip(cooked_match, raw_match)]
                        url_sha1s += url_sha1
                return url_sha1s
            return []
        except Exception as e:
            print(f"Error processing page {page_no}: {e}")
            return []

    match_urls_lists = fetch_attachment()
    # for url in match_urls:
    #     print("match_urls: " + url)
    url_sha1s = []
    for lst in match_urls_lists:
        if lst:
            url_sha1s += lst

    for url, sha1_with_ext in url_sha1s:
        md_content = md_content.replace('upload://' + sha1_with_ext, url)
    # 将修改后的内容写回文件
    with open(path + filename, 'w', encoding='utf-8') as file:
        file.write(md_content)
