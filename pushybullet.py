# -*- encoding: utf-8 -*-

from StringIO import StringIO
import os
import datetime
import time
import base64
import binascii

import urllib
import urlparse
import httplib
import random

try:
    import simplejson as json
except ImportError:
    import json

class FilelikeGenerator(object):
    def __init__(self, gen):
        self.__gen = gen
        self.__buf = ''
        self.__eof = False

    def __popbuf(self, buflen):
        self.__buf, res = self.__buf[buflen+1:], self.__buf[0:buflen]
        return res

    def read(self, buflen=0):
        if buflen > 0:
            if len(self.__buf) >= buflen:
                return self.__popbuf(buflen)

            if self.__eof:
                return None

            while len(self.__buf) < buflen:
                try:
                    self.__buf += self.__gen.next()
                except StopIteration:
                    self.__eof = True
                    break

            return self.__popbuf(buflen)

        else:
            for part in self.__gen:
                self.__buf += part

            self.__eof = True
            res, self.__buf = self.__buf, ''
            return res or None

    def next(self):
        value = self.read(8192)
        if value is None:
            raise StopIteration
        return value

    def isatty(self):
        return False

    @property
    def closed(self):
        return False

    def close(self):
        pass

    def seek(self, pos, whence=0):
        raise NotImplementedError

def filelike_generator(func):
    def wrapper(*args, **kwargs):
        return FilelikeGenerator(func(*args, **kwargs))
    return wrapper

class Session(object):
    auth = ()
    headers = {}

    def get(self, url, params=None, auth=None, headers=None):
        return self._request('GET', url, params=params, auth=auth, headers=headers)

    def post(self, url, params=None, data=None, files=None, auth=None, headers=None):
        return self._request('POST', url, params=params, data=data, files=files, auth=auth, headers=headers)

    def delete(self, url, params=None, auth=None, headers=None):
        return self._request('DELETE', url, params=params, auth=auth, headers=headers)

    def _encode_form_data(self, pairs):
        boundary = ''.join(chr(random.choice(xrange(ord('a'), ord('z')))) for _ in xrange(0, 30))

        body = []
        for name, value in pairs:
            if hasattr(value, 'read'):
                _body = value.read()
                body.append(
                    'Content-Type: application/octet-stream\r\n'
                    'Content-Disposition: form-data; name="%s"; filename="%s"\r\n'
                    'Content-Length: %s\r\n'
                    '\r\n'
                    '%s' % (
                        urllib.quote(name),
                        urllib.quote(getattr(value, 'name', None) or "file.txt"),
                        len(_body),
                        _body))
            else:
                body.append(
                        'Content-Type: text/plain\r\n'
                        'Content-Disposition: form-data; name="%s"\r\n'
                        'Content-Length: %s\r\n'
                        '\r\n'
                        '%s' % (
                            urllib.quote(name),
                            len(value),
                            value))

        return 'multipart/form-data; boundary="%s"' % boundary, ('--%s\r\n' % boundary) + ('\r\n--%s\r\n' % boundary).join(body) + ('\r\n--%s--\r\n' % boundary)

    class Response(object):
        def __init__(self, resp):
            self.__resp = resp

        def json(self):
            return json.load(self.__resp)

        def raise_for_status(self):
            status = self.__resp.status
            kind = status // 100

            if kind in (1, 2, 3):
                return

            raise RuntimeError('%s %s' % (status, self.__resp.reason))

    def _request(self, method, url, params=None, data=None, files=None, auth=None, headers=None):
        _url = urlparse.urlparse(url)

        conn = {'http': httplib.HTTPConnection,
                'https': httplib.HTTPSConnection}[_url.scheme](_url.hostname, _url.port)

        if params:
            _params = params.copy()
            for k in _params.keys():
                if _params[k] is None:
                    del _params[k]

            _query = urllib.urlencode(_params)

        else:
            _query = _url.query

        _headers = self.headers.copy()
        _headers['Host'] = _url.hostname

        if files:
            content_type, _data = self._encode_form_data(p for n in (data, files) for p in n.iteritems())

        elif data:
            content_type, _data = ('application/x-www-form-urlencoded',
                    urllib.urlencode(data) if isinstance(data, dict) else str(data))

        else:
            content_type, _data = None, None

        if _data:
            _headers['Content-Type'] = content_type
            #_headers['Content-Length'] = str(len(_data))

        if headers:
            _headers.update(headers)

        _auth = auth if auth is not None else (
                (_url.username or '', _url.password or '')
                    if (_url.username is not None or _url.password is not None) else
                self.auth)
        if _auth:
            _headers['Authorization'] = 'Basic %s' % base64.encodestring(':'.join(_auth)).strip()

        conn.request(method, '?'.join((_url.path, _query)), _data, _headers)

        response = conn.getresponse()
        return self.Response(response)

def get_apikey_from_config():
    try:
        from ConfigParser import SafeConfigParser as ConfigParser
    except ImportError:
        from configparser import SafeConfigParser as ConfigParser

    try:
        config = ConfigParser()
        config.read(os.path.expanduser('~/.config/pushbullet/config.ini'))
        return config.get('pushbullet', 'apikey')
    except:
        return None

def utf8(s):
    return s if isinstance(s, unicode) else unicode(s, 'utf-8') if isinstance(s, str) else unicode(s)

def parse_since(since):
    if not since:
        return 0

    if isinstance(since, (long, int)):
        return since + time.time() if since < 0 else since

    if isinstance(since, datetime.date):
        return since.strftime('%s')

    if isinstance(since, datetime.timedelta):
        return (datetime.datetime.now() - since).strftime('%s')

    try:
        since = int(since)
        return since + time.time() if since < 0 else since

    except ValueError:
        from dateutil.parser import parse
        return parse(since).strftime('%s')


# Events {{{
class Event(object):
    '''
    Abstract Pushbullet event
    '''
    __slots__ = ['api', 'time']
    def __init__(self, api):
        self.time = time.time()
        self.api = api

    def __repr__(self):
        return '<%s @%s>' % (self.__class__.__name__, self.time)

    def pushes(self, skip_empty=False, limit=None):
        return xrange(0)  # empty generator

    def latest_push_time(self):
        try:
            push = self.pushes(limit=1).next()
            return push.get('modified') or push.get('created')
        except (StopIteration, AttributeError):
            return None

class NopEvent(Event):
    '''
    Nop event (keep-alive ticks)
    '''
    __slots__ = ['api', 'time']

class TickleEvent(Event):
    '''
    Tickle event (user pushes)
    '''
    __slots__ = ['api', 'time', 'since', 'subtype']
    def __init__(self, api, subtype, since):
        Event.__init__(self, api)
        self.subtype = subtype
        self.since = since

    def pushes(self, skip_empty=False, limit=None):
        return self.api.pushes(since=self.since, skip_empty=skip_empty, limit=limit)

    def __repr__(self):
        return '<%s[%s] @%s>' % (self.__class__.__name__, self.subtype, self.time)

class PushEvent(Event):
    '''
    Push event (device notification mirroring)
    '''
    __slots__ = ['api', 'time', 'push']
    def __init__(self, api, push):
        Event.__init__(self, api)
        self.push = push

    def __repr__(self):
        return (u'<%s[%r] @%s>' % (self.__class__.__name__, self.push, self.time)).encode('utf-8')

    def pushes(self, skip_empty=False, limit=None):
        yield self.push

# }}}

class PushBulletError(Exception):
    pass

class PushBulletObject(object):
    '''
    Abstract Pushbullet object for given REST endpoint
    '''

    collection_name = None

    def __init__(self, **data):
        self.__dict__.update(data)

    @property
    def uri(self):
        '''
        Relative REST-object URI
        '''
        raise NotImplementedError

    def delete(self):
        '''
        Delete object
        '''
        self.api.delete(self.uri)

    def bind(self, api):
        '''
        Bind object to given API object

        :param PushBullet api: API object to bind to
        :returns: self
        '''
        assert(isinstance(api, PushBullet))
        self.api = api
        return self

    @property
    def bound(self):
        '''
        True if an object is bound to an API object
        '''
        return bool(getattr(self, 'api', None))

    def reload(self):
        self.__dict__.update(self.api.get(self.uri))
        return self

    @classmethod
    def iterate(cls, api, skip_inactive=True, since=0, limit=None):
        it = api.paged(cls.collection_name,
                modified_after=parse_since(since),
                limit=limit)

        print(cls)
        if skip_inactive:
            return (cls(api, **o) for o in it if o.get('active', False))
        else:
            return (cls(api, **o) for o in it)

    def get(self, name, default=None):
        return getattr(self, name, default)

    def json(self):
        return dict(self.__dict__)

    def __contains__(self, name):
        return hasattr(self, name)

    def __str__(self):
        return unicode(self).encode('utf8')

class ObjectWithIden(object):
    @classmethod
    def load(cls, api, iden):
        self = cls()
        self.bind(api)
        self.iden = iden
        self.reload()
        return self

    def __init__(self, api, iden=None, **data):
        self.iden = iden
        self.__dict__.update(data)
        self.bind(api)

    @property
    def uri(self):
        return '%s/%s' % (self.collection_name, self.iden)

class Grant(ObjectWithIden, PushBulletObject):
    collection_name = 'grants'

    def __repr__(self):
        return (u'<Grant[%s]: %s>' % (self.iden, self.client['name'])).encode('utf-8')

    def __unicode__(self):
        return u'grant for %s' % (self.client['name'])

class Subscription(ObjectWithIden, PushBulletObject):
    collection_name = 'subscriptions'

    def __repr__(self):
        return (u'<Subscription[%s] %s>' % (self.iden, getattr(self, 'channel', {}).get('tag', 'untagged'))).encode('utf-8')

    def __unicode__(self):
        channel = getattr(self, 'channel', {})
        return u'%s (%s)' % (
                channel.get('name', 'Unnamed'),
                channel.get('tag', 'untagged'))

    def channel(self):
        return ChannelInfo(self.api, **getattr(self, 'channel', {}))

    def create(self, channel_tag):
        if self.iden:
            raise PushBulletError('subscription already exists')

        if isinstance(channel_tag, (ChannelInfo, Channel)):
            channel_tag = channel_tag.tag

        self.__dict__.update(self.api.post('subscriptions', channel_tag=str(channel_tag)))

        return self

class ChannelInfo(ObjectWithIden, PushBulletObject):
    collection_name = 'channel-info'

    @classmethod
    def load_by_tag(cls, api, tag):
        return cls(api, **api.get('/channel-info', tag=utf8(tag)))

    def __repr__(self):
        return (u'<ChannelInfo[%s]: %s (%s)>' % (self.iden,
            getattr(self, 'name', 'Unnamed'),
            getattr(self, 'tag', 'untagged'))).encode('utf-8')

    def __unicode__(self):
        return u'%s (%s)' % (
                getattr(self, 'name', 'Unnamed'),
                getattr(self, 'tag', 'untagged'))

    def subscribe(self):
        return Subscription(self.api, None).create(self.tag)

# Push targets {{{

class PushTarget(PushBulletObject):
    '''
    Abstract push target object
    '''
    @property
    def ident(self):
        '''
        Interface property with parameters to identify given push target
        :rtype: dict
        '''
        raise NotImplementedError

    def push(self, push=None, **pushargs):
        '''
        Push a message to the push target

        Either `push` or `pushargs` must be given.
        If both are present, `pushargs` are ignored.

        :param Push push: a push object
        :param dict pushargs: parameters to construct push object
        '''
        if not isinstance(push, Push):
            push = self.api.make_push(pushargs, push)

        push.send(self)
        return push

class Channel(PushTarget, ObjectWithIden):
    '''
    Channel to push to
    '''
    collection_name = 'channels'

    def __repr__(self):
        return (u'<Channel[%s]: %s (%s)>' % (self.iden,
            getattr(self, 'name', 'Unnamed'),
            getattr(self, 'tag', 'untagged'))).encode('utf-8')

    def __unicode__(self):
        return u'%s (%s)' % (
                getattr(self, 'name', 'Unnamed'),
                getattr(self, 'tag', 'untagged'))

    @property
    def ident(self):
        return {'channel_tag': self.tag}

    def create(self):
        if self.iden:
            raise PushBulletError('channel already exists')

        self.__dict__.update(self.api.post('clients',
            tag=self.tag,
            name=getattr(self, 'name', None),
            description=getattr(self, 'description', None),
            feed_url=getattr(self, 'feed_url', None),
            feed_filters=getattr(self, 'feed_filters', None)))

        return self

    def update(self):
        if not self.iden:
            raise PushBulletError('channel does not exist yet')

        self.__dict__.update(self.api.post(self.uri,
            name=getattr(self, 'name', None),
            description=getattr(self, 'description', None),
            feed_url=getattr(self, 'feed_url', None),
            feed_filters=getattr(self, 'feed_filters', None)))

        return self

    def subscribe(self):
        return Subscription(self.api, None).create(self.tag)

class Client(PushTarget, ObjectWithIden):
    '''
    Current user's OAuth client

    By pushing to it you push to all users, who granted access to the client.
    '''
    collection_name = 'clients'

    def __repr__(self):
        return (u'<Client[%s]: %s>' % (self.iden, getattr(self, 'name', 'Unnamed'))).encode('utf-8')

    def __unicode__(self):
        return getattr(self, 'name', 'Unnamed')

    @property
    def ident(self):
        return {'client_iden': self.iden}

class Contact(ObjectWithIden, PushTarget):
    '''
    Contact to push to
    '''
    collection_name = 'contacts'

    def __repr__(self):
        return (u'<Contact[%s]: %s <%s>>' % (self.iden,
                getattr(self, 'name', 'Unnamed'),
                getattr(self, 'email', None) or getattr(self, 'email_normalized'))).encode('utf-8')

    def __unicode__(self):
        return u'%s <%s>' % (self.name, self.email)

    @property
    def ident(self):
        return {'email': self.email_normalized}

    def create(self):
        if self.iden:
            raise PushBulletError('contact already exists')

        self.__dict__.update(self.api.post('contacts', name=self.name, email=self.email))
        return self

    def update(self):
        if not self.iden:
            raise PushBulletError('contact does not exist yet')

        self.__dict__.update(self.api.post(self.uri, name=self.name))
        return self

    def rename(self, newname):
        self.name = newname
        return self.update()

class Device(ObjectWithIden, PushTarget):
    '''
    Device to push to
    '''
    collection_name = 'devices'

    def __repr__(self):
        return (u'<Device[%s]: %s>' % (self.iden,
                getattr(self, 'nickname', None) or
                getattr(self, 'model', None) or
                'Unnamed')).encode('utf-8')

    def __unicode__(self):
        return (getattr(self, 'nickname', None) or
                getattr(self, 'model', None) or
                self.iden)

    @property
    def ident(self):
        return {'device_iden': self.iden}

    def create(self):
        if self.iden:
            raise PushBulletError('device already exists')

        self.__dict__.update(self.api.post('devices', nickname=self.nickname, type=getattr(self, 'type', 'stream')))
        return self

    def update(self):
        if not self.iden:
            raise PushBulletError('device does not exist yet')

        self.__dict__.update(self.api.post(self.uri, nickname=self.nickname))
        return self

    def rename(self, newname):
        self.nickname = newname
        return self.update()

class PhoneNumber(PushTarget):
    '''
    Phone number to push SMS to
    '''
    device = None
    number = None

    def __init__(self, device, number):
        assert isinstance(device, Device)
        self.device = device
        self.number = str(number)

    @property
    def ident(self):
        return {
                'type': 'messaging_extension_reply',
                'package_name': 'com.pushbullet.android',
                'conversation_iden': self.number,
                'target_device_iden': self.device.iden,
                'source_user_iden': self.api.me.iden
                }

    def push(self, push=None, **pushargs):
        api = self.device.api
        if not isinstance(push, Push):
            push = api.make_push(pushargs, push)

        data = self.ident
        data['message'] = push.body
        api.post("ephemerals", type="push", push=data)
        return push

    def __repr__(self):
        return (u'<PhoneNumber[%s] device=%s>' % (self.number, self.device)).encode('utf-8')

    def __unicode__(self):
        return self.number

class User(PushTarget):
    '''
    User profile
    '''
    def __init__(self, api, **data):
        self.__dict__.update(data)
        self.bind(api)

    @classmethod
    def load(cls, api):
        return cls(api, **api.get('users/me'))

    def __repr__(self):
        return (u'<User[%s]: %s <%s>>' % (self.iden,
                getattr(self, 'name', 'Unnamed'),
                getattr(self, 'email', None) or getattr(self, 'email_normalized'))).encode('utf-8')

    @property
    def ident(self):
        return {}

    @property
    def uri(self):
        return 'users/me'

    def update(self):
        self.__dict__.update(self.api.post(self.uri, preferences=getattr(self, 'preferences', {})))
        return self

    def set_prefs(self, **prefs):
        try:
            self.preferences.update(prefs)
        except AttributeError:
            self.prefereces = prefs

        return self.update()

# }}}

# Pushes {{{

class Push(PushBulletObject):
    '''
    Abstract push object
    '''
    type = None
    collection_name = 'pushes'

    @property
    def uri(self):
        return "pushes/%s" % self.iden

    def decode(self):
        try:
            self.modified = datetime.datetime.fromtimestamp(self.modified)
        except AttributeError:
            pass

        try:
            self.created = datetime.datetime.fromtimestamp(self.created)
        except AttributeError:
            pass

    def send(self, target=None):
        '''
        Send the push to some target

        If target is None (or omitted) or a string, the push must be bound to some API.
        By default the push will be sent to API object (i.e. all user devices).

        If target is a string, it must be a device iden to push to.

        If you use anything except for Device, Contact or PushBullet object as a target
        (i.e. a PushTarget object), you must make sure a push is bound to PushBullet
        object before by calling `push.bind(api)` method.
        Push is already bound if you fetched it with `api.pushes()` call
        or sent it before.

        :param target: push target
        :type target: PushTarget|str|None
        '''
        if not isinstance(target, PushTarget):
            target = self.api.make_target(target)

        self.bind(target.api)

        data = self.data
        data.update(target.ident)
        data['type'] = self.type

        result = self.api.post('pushes', **data)
        self.__dict__.update(result)

    def resend(self):
        '''
        Try to send the push to the same target again (e.g. as a part of error handling logic)
        '''
        if not hasattr(self, 'target_device_iden'):
            raise PushBulletError('push was not sent yet')

        self.send(self.target_device_iden)

    def update(self):
        self.__dict__.update(self.api.post(self.uri, dissmissed=getattr(self, 'dismissed', False)))
        return self

    def dismiss(self):
        '''
        Dismiss a push
        '''
        if getattr(self, 'dismissed', False):
            return  # don't dismiss twice

        self.dismissed = True
        return self.update()

    @property
    def data(self):
        '''
        Push data necessary to send push to a target

        :rtype: dict
        '''
        raise NotImplementedError

    @property
    def target_device(self):
        '''
        Get target device object
        '''
        iden = self.get('target_device_iden')
        return Device(self.api, iden) if iden else None

    @property
    def source_device(self):
        '''
        Get source device object
        '''
        iden = self.get('source_device_iden')
        return Device(self.api, iden) if iden else None

    def __eq__(self, other):
        return isinstance(other, Push) and self.iden == other.iden

    def __repr__(self):
        return (u'<%s[%s]: %s>' % (self.__class__.__name__, getattr(self, 'iden', None), unicode(self))).encode('utf-8')

    def __unicode__(self):
        return u'%s push' % getattr(self, 'type', 'general')


class NotePush(Push):
    '''
    Note push
    '''
    type = 'note'
    def __init__(self, body='', title='', **data):
        '''
        A note push constructor

        Notes has both body and title parameters optional, but at least one of them
        must be defined for the push to be useful. The `title` argument defaults to "Note"
        by PushBullet service, so I choose to require at least `body` argument.
        If you really don't need body (you should define `title` then, or you will end up
        with empty note, which usually has no sense), set it to empty string `''`.

        :type body: str
        :type title: str
        '''
        self.title, self.body = utf8(title), utf8(body)
        Push.__init__(self, **data)

    @property
    def data(self):
        return {'title': self.title, 'body': self.body}

    def __unicode__(self):
        return self.title

class LinkPush(Push):
    '''
    Link push
    '''
    type = 'link'
    def __init__(self, url, title='', body='', **data):
        '''
        A link push constructor

        URL is the only required argument, otherwise the push is actually useless.
        You can of cause set it to empty string (`''`), but what is the use of it?

        :type url: str
        :type title: str
        :type body: str
        '''
        self.title, self.url, self.body = utf8(title), utf8(url), utf8(body)
        Push.__init__(self, **data)

    @property
    def data(self):
        return {'title': self.title, 'url': self.url, 'body': self.body}

    def __unicode__(self):
        return self.url

class AddressPush(Push):
    '''
    Address push
    '''
    type = 'address'
    def __init__(self, address, name='', **data):
        '''
        An address push constructor

        Address argument is the only required argument here.
        The push actually has no sense without it, doesn't it?

        :type address: str
        :type name: str
        '''
        self.name, self.address = utf8(name), utf8(address)
        Push.__init__(self, **data)

    @property
    def data(self):
        return {'name': self.name, 'address': self.address}

    def __unicode__(self):
        return u'%s (%s)' % (self.name, self.address)

class ListPush(Push):
    '''
    List push
    '''
    type = 'list'
    def __init__(self, items, title='', **data):
        '''
        A list push constructor

        Items argument is the only required one, and it should be a list
        of strings. Of cause you can send empty list (`[]`), but what is the use of it?

        :type items: list of str
        :type title: str
        '''
        self.title, self.items = utf8(title), map(utf8, items)
        Push.__init__(self, **data)

    @property
    def data(self):
        return {'title': self.title, 'items': self.items}

    def __unicode__(self):
        return u'%s (%d)' % (self.title, len(self.items))

class FilePush(Push):
    '''
    File push
    '''
    type = 'file'
    def __init__(self, file=None, file_name=None, file_type=None, body='', **data):
        '''
        A file push constructor

        You must specify at least `file` argument in order to be able to push some new file

        The `file` argument is optional only for internal usage, like if a file push fetched
        by `api.pushes()` method call, in which case file to push is undefined, but `file_url`
        is present to download the file. If you then resend such push, file designated by `file_url`
        will be sent, not any new file set by you. You can use this knowledge to try and
        set `file_url` directly on `FilePush` object without setting `file` argument on your
        own risk, but bear in mind it's an internal implementation detail, so please make sure you
        a) understand what you are doing, b) don't abuse the feature.

        If you specify `file` only, it must be either a file-like object, a file-handler opened for read,
        a buffer (for in-memory files), an openable object (the one with `open([mode])` method)
        or a string with absolute file path.
        You will see basename of the file (the part of path after final slash).

        If you specify both `file` and `file_name`, a push receiver will see `file_name` value
        as a file name, not the actual file name. You can use it for example to send some
        system stream without user-friendly name, like `sys.stdin`.

        The `file_type` argument is optional and must be a string in MIME-type format (e.g. `text/plain`).
        If you omit it, file type will be deteremined by magic library by file's content, and if
        autodetection will fail, file type will default to `application/octet-stream`.
        The autodetection reads first 1024 bytes of file content and then resets file's seek cursor
        to the beginning, so it won't work for non-seekable streams, so if you are about to push
        something like `sys.stdin`, make sure you set `file_type` manually.

        :param file: file to push
        :type file: str, file, buffer, int, Path or any file-like or openable object
        :param str file_name: file name to push (will be visible to reciever)
        :param str file_type: file's MIME type (will be determined by file's content if omitted)
        :param str body: optional message to accompany file
        '''
        assert(file or file_name)
        self.file, self.file_name, self.file_type = file, utf8(file_name), utf8(file_type)
        if not self.file:
            self.file = self.file_name

        self.file_url = None
        self.body = utf8(body)
        Push.__init__(self, **data)

    def send(self, target=None):
        if not isinstance(target, PushTarget):
            target = self.api.make_target(target)

        if not self.file_url:  # file not uploaded yet
            fh = (self.file if hasattr(self.file, 'read') else  # file-like object
                  self.file.open('rb') if hasattr(self.file, 'open') else  # openable object
                  os.fdopen(self.file, 'rb') if isinstance(self.file, int) else  # file descriptor
                  StringIO(self.file) if isinstance(self.file, buffer) else  # in-memory file
                  open(self.file, 'rb'))  # file name

            try:
                file_name = utf8(self.file_name) if self.file_name else os.path.basename(fh.name)
                file_type = utf8(self.file_type) if self.file_type else self.guess_type(fh)
                req = target.api.get('upload-request', file_name=file_name, file_type=file_type)
                target.api.upload(req['upload_url'], data=req['data'], file=fh)
                self.file_name, self.file_type, self.file_url = req['file_name'], req['file_type'], req['file_url']

            finally:
                fh.close()

        Push.send(self, target)

    def guess_type(self, file):
        try:
            import magic
            guesser = magic.open(magic.MIME_TYPE)
            guesser.load()
            mime_type = guesser.buffer(file.read(1024))
            file.seek(0)
            return mime_type or 'application/octet-stream'

        except:
            return 'application/octet-stream'

    @property
    def data(self):
        return {'file_name': self.file_name, 'file_type': self.file_type, 'file_url': self.file_url, 'body': self.body}

    def __unicode__(self):
        return self.file_name

class MirrorPush(Push):
    '''
    Mirror push (internal usage only)
    '''
    type = 'mirror'

    def decode(self):
        super(MirrorPush, self).decode()

        try:
            self.icon = base64.decodestring(self.icon)
        except (AttributeError, binascii.Error):
            pass

    def send(self, target):
        raise NotImplementedError

class DismissalPush(Push):
    '''
    Dismissal push (internal usage only)
    '''
    type = 'dismissal'

    def send(self, target):
        raise NotImplementedError

# }}}

# Main API class {{{

def cached_list_method(cls):
    cache_key = '_%s' % cls.collection_name
    def wrapper(self, reset_cache=False):
        if reset_cache or getattr(self, cache_key, None) is None:
            setattr(self, cache_key, list(cls.iterate(self)))
        return getattr(self, cache_key)
    return wrapper

def iterator_method(cls):
    def iterator(self, skip_inactive=False, since=0, limit=None):
        return cls.iterate(self, skip_inactive, since, limit)
    return iterator

class PushBullet(PushTarget):
    '''
    Main API class for PushBullet
    '''

    API_URL = 'https://api.pushbullet.com/v2/%s'

    def __init__(self, apikey):
        '''
        Initialize API object (get API key from https://www.pushbullet.com/account)

        :param str apikey: API key (get at https://www.pushbullet.com/account)
        '''
        self.apikey = apikey
        self.sess = Session()
        self.sess.auth = (apikey, '')

    def get_type_by_args(self, args, arg=None):
        return args.get('type') or ('url' if 'url' in args else
                     'list' if 'items' in args else
                     'address' if 'address' in args else
                     'file' if 'file' in args or 'file_name' in args else
                     self.get_type_by_class(arg) if arg else
                     'note')

    def get_type_by_class(self, arg):
        if isinstance(arg, (file, buffer)):
            return 'file'

        # any iteratable (except for strings) is a list push
        if hasattr(arg, '__iter__') and not isinstance(arg, (str, unicode)):
            return 'list'

        # special case: looks like url, therefore it is an link push
        if utf8(arg).startswith(('http://', 'https://', 'ftp://', 'ftps://', 'mailto:')):
            return 'link'

        # default is a note push
        return 'note'

    def make_push(self, pushargs, pusharg=None):
        '''
        Factory to create a push object out of raw data in dictionary

        The `pushargs` dict should contain `type` element to determine
        push type. If you omit it, push type will be autodefined by presence of
        other elements, defaulting to `note`.

        Other `pushargs` elements depend on push type:

        * for `note`: `title` and `body`,
        * for `list`: `title` and `items`,
        * for `file`: `file`, `file_name`, `file_type` and `body`,
        * for `link`: `title` and `url`,
        * for `address`: `name` and `address`.

        See correspondent push classes docs for details of these arguments.

        :param dict pushargs: a dict of parameters to compose a push object
        '''
        # a set of arguments in a dictionary
        pushcls = {
                'note': NotePush,
                'list': ListPush,
                'link': LinkPush,
                'file': FilePush,
                'address': AddressPush,
                'mirror': MirrorPush,
                'dismissal': DismissalPush,
                }.get(self.get_type_by_args(pushargs, pusharg), Push)
        push = pushcls(pusharg, **pushargs) if pusharg else pushcls(**pushargs)

        return push.bind(self)

    def delete(self, _uri):
        '''
        Helper method for DELETE requests to API
        '''
        self.sess.delete(self.API_URL % _uri).raise_for_status()

    def post(self, _uri, **data):
        '''
        Helper method for POST requests to API
        '''
        response = self.sess.post(self.API_URL % _uri, data=json.dumps(data),
                headers={'Content-Type': 'application/json'})
        response.raise_for_status()

        result = response.json()

        if 'error' in result:
            raise PushBulletError(result['message'])

        return result

    def get(self, _uri, **params):
        '''
        Helper method for GET requests to API
        '''
        response = self.sess.get(self.API_URL % _uri, params=params)
        response.raise_for_status()

        result = response.json()

        if 'error' in result:
            raise PushBulletError(result['message'])

        return result

    def upload(self, _uri, data, **files):
        '''
        Helper method to upload a file to given URL
        '''
        response = self.sess.post(_uri, data=data, files=files, auth=()).raise_for_status()

    def paged(self, _uri, **params):
        page = self.get(_uri, **params)

        while True:
            for item in page[_uri]:
                yield item

            if not page.get('cursor'):
                break

            page = self.get(_uri, cursor=page['cursor'])

    def subscribe(self, channel_tag):
        return Subscription(self, None).create(channel_tag)

    def create_device(self, nickname, type='stream'):
        '''
        Create new (a stream) device with given nickname

        :param str nickname: device's name
        :param str type: device's type
        :rtype: Device
        '''
        return Device(self, None, nickname=nickname, type=type).create()

    def create_contact(self, name, email):
        '''
        Create a new contact with given name and email

        :param str name: contact's name
        :param str email: contact's email
        :rtype: Contact
        '''
        return Contact(self, None, name=name, email=email).create()

    iter_contacts = iterator_method(Contact)
    iter_devices = iterator_method(Device)
    iter_grants = iterator_method(Grant)
    iter_clients = iterator_method(Client)
    iter_channels = iterator_method(Channel)
    iter_subscriptions = iterator_method(Subscription)

    contacts = cached_list_method(Contact)
    devices = cached_list_method(Device)
    grants = cached_list_method(Grant)
    clients = cached_list_method(Client)
    channels = cached_list_method(Channel)
    subscriptions = cached_list_method(Subscription)

    def pushes(self, since=0, skip_empty=True, limit=None):
        '''
        Generator fetches and yields all pushes since given timestamp

        The `since` argument, which defines time limit in the past to get
        pushes from, accepts almost any sensible date/time object.

        If it is an integer (int or long) and positive, it is expected
        to be correct unix timestamp (number of seconds since 1/1/1970 00:00:00 UTC).
        If it is an integer and negative, it is a number of seconds in the past
        (e.g. use `-86400` to fetch pushes for the last day).
        If it is a date or datetime object, it is, well, a date/time =).
        If it is a timedelta object, it is a time-span in the past
        (so `timedelta(days=7)` means "pushes for the last week").
        If it is a string, it is parsed with dateutil.parser.parse() for datetime object.

        :param since: minimal time for pushes to fetch
        :type since: int|long|date|datetime|timedelta
        :param bool skip_empty: skip empty (inactive, removed) pushes, default is True
        :param int limit: limit number of items per page
        :rtype: generator
        '''
        it = self.paged(Push.collection_name,
                modified_after=parse_since(since),
                limit=limit)

        if skip_empty:
            return (self.make_push(o) for o in it if bool(o.get('type', None)))
        else:
            return (self.make_push(o) for o in it)

    def __getitem__(self, device_iden):
        '''
        Find and return device object by device iden or device name

        At first search is done by device iden field, and if it's not found,
        search is repeated by device name. A device name is either device nickname,
        model or iden, whichever is defined for any given device object.

        So you can get your Chrome device object with `api["Chrome"]` call.

        Throws `KeyError` if no device is found.

        :param str device_iden: a device iden
        '''
        try:
            return next(d for d in self.devices() if d.iden == device_iden)
        except StopIteration:
            try:
                return next(d for d in self.devices() if utf8(d) == device_iden)
            except StopIteration:
                raise KeyError(device_iden)

    _me = None
    def me(self, reset_cache=False):
        '''
        Get current user information
        '''
        if not reset_cache and self._me:
            return self._me

        self._me = User.load(self)
        return self._me

    def make_target(self, target):
        if target is None:
            return self

        if isinstance(target, PushTarget):
            return target

        target = utf8(target)
        return (Device(self, target) if '@' not in target else
                Contact(self, None, email_normalized=target))

    def push(self, push=None, target=None, **pushargs):
        '''
        Send push to a target (to all devices by default)

        If you omit `target` argument, the push will be sent to all user devices.
        If `target` is anything but `PushTarget` object, it will be cast to string
        and will be taken as a device iden to push to.

        Only one of `push` or `pushargs` arguments must be given at a time.
        If `push` is omitted, new push will be constructed from `pushargs` arguments,
        if both `push` and `pushargs` are given, `pushargs` is ignored.

        :param Push push: a push object ot push
        :param target: a push target to push to
        :type target: str|PushTarget|None
        :param dict pushargs: push arguments
        :rtype: Push
        :returns: push just sent
        '''
        if not isinstance(push, Push):
            push = self.make_push(pushargs, push)

        push.bind(self).send(target)
        return push

    def bind(self, obj):
        '''
        Bind given object to the API

        :type obj: PushBulletObject
        :returns: obj
        '''
        assert(isinstance(obj, PushBulletObject))
        return obj.bind(self)

    @property
    def ident(self):
        '''
        For `PushTarget` interface compliance
        '''
        return {}

    @property
    def api(self):
        '''
        For `PushTarget` interface compliance only
        '''
        return self

    def stream(self, skip_nop=True, use_server_time=False, throttle=1):
        '''
        Generator to listen for events on websocket and yield them

        The method requires `websocket` library. It will run an infinite event loop, which
        fetches events from websocket and provides them as an Event objects, e.g.::

            for ev in api.stream():
                print(ev)

        To be able to run any other code at the same time, consider running the loop
        in some other (background) thread.

        :param bool skip_nop: skip "nop" events (used as keep-alive heartbeats only), default is True
        :param bool use_server_time: use server time to track last push to fetch (requires additional request on event), default is False
        :rtype: generator
        '''
        from websocket import create_connection
        conn = create_connection('wss://stream.pushbullet.com/websocket/%s' % self.apikey)
        last_ts = ((self.latest_push_time() or time.time()) if use_server_time else time.time()) + throttle

        while True:
            event = json.loads(conn.recv())
            evtype = event['type']
            if skip_nop and evtype == 'nop':
                continue

            event = (NopEvent(self) if evtype == 'nop' else
                     TickleEvent(self, event['subtype'], since=last_ts) if evtype == 'tickle' else
                     PushEvent(self, self.make_push(event['push'])) if evtype == 'push' else
                     None)

            last_ts = ((event.latest_push_time() or time.time()) if use_server_time else time.time()) + throttle

            if event:
                yield event

    def latest_push_time(self):
        try:
            push = self.pushes(limit=1).next()
            return push.get('modified') or push.get('created')
        except StopIteration:
            return None

    def __unicode__(self):
        return u'<PushBullet>'

# }}}

#import yaml
#with open('/usr/local/etc/pushbullet.yml', 'rb') as f:
#    config = yaml.safe_load(f)
#
#pb = PushBullet(config['apikey'])

