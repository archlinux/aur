import json
import re
import os
from constant import Shuiyuan_Base, Shuiyuan_Topic_Json, json_limit, image_extensions
from utils import ReqParam, make_request, parallel_topic_in_page

def download_image(param: ReqParam, output_dir:str, sha1_name:str):
    """
    从水源上下载图片到本地(以进行markdown格式替换)
    :param param: 请求参数
    :param output_dir: 保存文件夹
    :param sha1_name: 图片的sha1
    :return:
    """
    response = make_request(param, once=False)
    if response is None:
        return
    os.makedirs(output_dir, exist_ok=True)
    output_path = os.path.join(output_dir, sha1_name)
    with open(output_path, 'wb') as f:
        f.write(response.content)


def img_replace(path:str, filename:str, topic:str):
    """
    替换原始拉取的raw图片内容
    :param path:
    :param filename:
    :param topic:
    :return:
    """
    print('图片载入中...')
    file = open(path + filename, 'r', encoding='utf-8')
    md_content = file.read()

    """
    case 1: 
    raw文本： ![<name0>|<width>x<height>](upload://<fake_name>)
    cooked内容： <img src="<address>.<extension>", ..., data-base62-sha1="<real_name>">
    替换后： ![<name0>|<width>x<height>](./images/<real_name>.<extension>)
    
    case 2:
    raw文本： ![<name0>|<width>x<height>](upload://<name>.<fake_extension>)
    cooked内容： <img src="<address>.<real_extension>", ..., data-base62-sha1="<name>">
    替换后： ![<name0>|<width>x<height>](./images/<name>.<real_extension>)
    
    case 3:
    raw文本： ![<name0>|<width>x<height>](upload://<name>.<extension>)
    cooked内容： <img src="<address>.<extension>", ..., data-base62-sha1="<name>">
    替换后： ![<name0>|<width>x<height>](./images/<name>.<extension>)
    """
    name_with_fake_exts = re.findall(r'!\[.*?]\(upload:\/\/([a-zA-Z0-9\.]+)\)', md_content)
    for name in name_with_fake_exts:
        match_ext = re.search(r'\.([a-zA-Z0-9]+)$', name)
        if match_ext and ("." + match_ext.group(1)) not in image_extensions:
            name_with_fake_exts.remove(name)
    deleted_names = []
    @parallel_topic_in_page(topic=topic, limit=json_limit)
    def fetch_image(page_no: int):
        nonlocal deleted_names
        url_json = Shuiyuan_Topic_Json + topic + '.json' + "?page=" + str(page_no)
        req_param = ReqParam(url=url_json)
        response_json = make_request(req_param, True)
        ret = []
        if response_json.status_code == 200:
            data = json.loads(response_json.text)
            posts_list = data['post_stream']['posts']
            for post in posts_list:
                html_content = post['cooked']
                """
                exist: r'<img src="([a-zA-Z0-9_:\/\-\.]+)" alt=".*?" data-base62-sha1="(.*?)"'
                deleted: r'<img src="([a-zA-Z0-9_:\/\-\.]+)" alt=".*?" data-orig-src="(.*?)"'
                """
                pattern_deleted = r'<img src="[a-zA-Z0-9_:\/\-\.]+" alt=".*?" data-orig-src="(.*?)"'
                matches_deleted = re.findall(pattern_deleted, html_content)
                if matches_deleted:
                    deleted_names += [deleted_name.removeprefix("upload://") for deleted_name in matches_deleted]

                pattern = r'<img src="([a-zA-Z0-9_:\/\-\.]+)" alt=".*?" data-base62-sha1="(.*?)"'
                matches = re.findall(pattern, html_content) # '?' is not included
                if not matches:
                    continue
                src_with_real_exts = [t[0] for t in matches]
                real_names = [t[1] for t in matches]
                src_with_real_exts = [src if Shuiyuan_Base in src else Shuiyuan_Base[:-1] + src for src in src_with_real_exts]
                real_exts = [re.search(r'\.([a-zA-Z0-9]+)$', src).group(1) for src in src_with_real_exts]
                for src, name, ext in zip(src_with_real_exts, real_names, real_exts):
                    download_image(ReqParam(src), path + 'images', name + '.' + ext)
                    ret.append(name + '.' + ext)

        return page_no, ret
    image_names = fetch_image()
    for name in deleted_names:
        name_with_fake_exts.remove(name)
    image_names.sort(key=lambda x: x[0])
    img_names_flatten = [y for x in image_names for y in x[1]]
    for sha1_with_ext, name in zip(name_with_fake_exts, img_names_flatten):
        pattern = r'!\[.*?\]\(upload://{}\)'.format(re.escape(sha1_with_ext))
        md_content = re.sub(pattern, '![](upload://{})'.format(name), md_content)

    def replace(matchs):
        old_link = matchs.group(0)
        ext_match = re.search(r'\.([a-zA-Z0-9]+)', old_link)
        if ext_match and ext_match.group(0) not in image_extensions:
            return old_link
        new_link = old_link.replace('upload://', './images/')
        return new_link

    md_content = re.sub(r'!\[.*?\]\(upload://([a-zA-Z0-9\.]+)\)', replace, md_content)
    with open(path + filename, 'w', encoding='utf-8') as file:
        file.write(md_content)
