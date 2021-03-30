#!/usr/bin/python
# -*- encoding: utf-8 -*-
# Author:  MoeClub.org
# Forked and revised by Ayatale

from urllib import request
import threading
import queue
import re
import os


class pixiv:
    def __init__(self):
        self.folder = 'PixivImage'
        self.web_coding = 'utf-8'
        self.root = os.environ['HOME']
        self.DefaultHeader = {
            "User-Agent":
            "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0",
            "Accept": "*/*",
            "Accept-Language": "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3",
            "Accept-Encoding": "",
            "Connection": "keep-alive",
        }
        self.data_low = []
        self.num = 0

    def _http(self, url, headers, Obj=False):
        res = request.urlopen(
            request.Request(url, headers=headers, method='GET'))
        if Obj:
            return res
        else:
            return res.read().decode(self.web_coding, "ignore")

    def data_image(self, url_id):
        _header = self.DefaultHeader.copy()
        _header[
            "Referer"] = "https://www.pixiv.net/member_illust.php?mode=medium&illust_id={}".format(
                url_id)
        _url_data = "https://www.pixiv.net/touch/ajax/illust/details?illust_id={}".format(
            url_id)
        _data_details = self._http(_url_data, _header)
        data_url = self.sort_data(re.findall('"url_big":"[^"]*"',
                                             _data_details))
        data_uid = str(
            str(
                str(re.findall('"user_id":"[^"]*"',
                               _data_details)[0]).split(':', 1)[-1]).strip('"'))
        return data_url, _header, data_uid

    def sort_data(self, data):
        _data = []
        for item in data:
            if item not in _data:
                _data.append(item)
        return [
            str(str(item).replace('\\', '').split(':', 1)[-1]).strip('"')
            for item in _data
        ]

    def get_item(self, UserID=None):
        if not UserID:
            UserID = 'https://www.pixiv.net/ranking.php?mode=male'
        if '://' in str(UserID):
            Mode_ID = False
        else:
            Mode_ID = True
        if Mode_ID:
            _url = "https://www.pixiv.net/ajax/user/{}/profile/all".format(
                str(UserID))
            page = self._http(_url, self.DefaultHeader, True)
            if page.code != 200:
                raise Exception("Pixiv Page:", page.code)
            _data = re.findall('"[0-9]+":null',
                               page.read().decode(self.web_coding, "ignore"))
            self.data_low = [
                str(str(item).split(":")[0]).strip('"') for item in _data
                if ':null' in str(item)
            ]
        else:
            page = self._http(UserID, self.DefaultHeader, True)
            if page.code != 200:
                raise Exception("Pixiv Page:", page.code)
            _data = re.findall('data-src="[^"]*"',
                               page.read().decode(self.web_coding, "ignore"))
            self.data_low = [
                str(
                    str(
                        str(str(str(item).split("=", 1)[-1]).strip('"')).rsplit(
                            '/', 1)[-1]).split('_')[0]) for item in _data
                if '/img-master/img/' in str(item)
            ]
        self.fliter_item()

    def fliter_item(self):
        folder = os.path.join(self.root, self.folder)
        if not os.path.exists(folder):
            return None
        _split = "_"
        _exist = {}.fromkeys([
            str(str(item).split(_split)[1]) for item in os.listdir(folder)
            if _split in item
        ]).keys()
        print("Exist Item:", len(_exist))
        for _item in self.data_low.copy():
            if _item in _exist:
                self.data_low.remove(_item)

    def get_data_by_item(self, item):
        data = self.data_image(item)
        for data_url in data[0]:
            image = self._http(data_url, data[1], True)
            if image.code != 200:
                raise Exception(f"Pixiv Image: [{image.code} | {data[0]}]")
            self.write(f"{data[2]}_{str(data_url).rsplit('/', 1)[-1]}",
                       image.read())

    def get_data(self, data_list=None):
        if not data_list:
            data_list = self.data_low
        for item in data_list:
            self.get_data_by_item(item)
        print("\nTotal Image: ", self.num)

    def write(self, name, data):
        folder = os.path.join(self.root, self.folder)
        if not os.path.exists(folder):
            os.mkdir(folder)
        file = os.path.join(folder, str(name))
        fp = open(file, 'wb')
        fp.write(data)
        fp.close()
        self.num += 1
        print("Pixiv Image: [ OK | {} ]".format(file))

    def add_queue(self, _queue, data_list=None):
        for item in data_list:
            _item = str(item).strip()
            if item and _item:
                _queue.put(_item)

    def multi_data(self, data_list=None, max=25):
        if not data_list:
            data_list = self.data_low
        print("New Item:", len(data_list))
        _threads = []
        _queue = queue.Queue(maxsize=max)
        task_main = threading.Thread(target=self.add_queue,
                                     args=(_queue, data_list))
        task_main.setName("TaskMain")
        task_main.setDaemon(True)
        task_main.start()
        while _queue.qsize() > 0:
            if len(_threads) >= max:
                for _item in _threads.copy():
                    if not _item.is_alive():
                        _threads.remove(_item)
                continue
            item = _queue.get()
            task = threading.Thread(target=self.get_data_by_item, args=(item, ))
            task.setDaemon(True)
            task.start()
            _threads.append(task)
        for _task in _threads:
            _task.join()
        print("\nTotal Image: ", self.num)


if __name__ == '__main__':
    try:
        task = os.sys.argv[1]
    except:
        task = None
    if task == '-h' or task == '--help':
        print('Usage: pixiv-dl [Operation...]\n\nOperations:\n',
              ' pixiv-dl -h, --help\tShow help options\n',
              ' pixiv-dl "UserID"\tDownload all paintings by the artist\n',
              ' pixiv-dl "RankLink"\tDownload all paintings by RankLink',
              '\n\nExamples:\n', ' pixiv-dl "2509595"\n',
              ' pixiv-dl "https://www.pixiv.net/ranking.php?mode=male"')
    else:
        p = pixiv()
        p.get_item(task)
        p.multi_data(max=25)
