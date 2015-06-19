#!/usr/bin/env python2
# encoding: utf-8

from __future__ import print_function

import argparse
import pushybullet
import time
import sys
import os

def get_parser():
    apikey = pushybullet.get_apikey_from_config()
    parser = argparse.ArgumentParser(description='PushBullet command line client')
    parser.add_argument('--apikey', help='API key (get from https://www.pushbullet.com/account)', type=str,
            default=apikey, required=not apikey)
    parser.add_argument('--target', help='target device identifiers', default=[], action='append')
    subparsers = parser.add_subparsers(help='message type', dest='type')

    note_group = subparsers.add_parser('note')
    note_group.add_argument('body', help='note body', type=str, default='', nargs='?')
    note_group.add_argument('--title', help='note title', default='', type=str)

    link_group = subparsers.add_parser('link')
    link_group.add_argument('url', help='link URL', type=str)
    link_group.add_argument('--title', help='link title', default='', type=str)
    link_group.add_argument('--body', help='link messsage', default='', type=str)

    list_group = subparsers.add_parser('list')
    list_group.add_argument('items', help='list item', action='append', nargs='+', metavar='item')
    list_group.add_argument('--title', help='list title', default='', type=str)

    file_group = subparsers.add_parser('file')
    file_group.add_argument('file', help='file name to push', type=argparse.FileType('rb'), default=sys.stdin, nargs='?')
    file_group.add_argument('--name', help='user visible file name', type=str, default='', dest='file_name')
    file_group.add_argument('--mime', help='file mime type', type=str, default='', dest='file_type')
    file_group.add_argument('--body', help='file message', default='', type=str)

    address_group = subparsers.add_parser('address')
    address_group.add_argument('address', help='address', type=str)
    address_group.add_argument('--name', help='address name', default='', type=str)

    devices_group = subparsers.add_parser('devices', help='list all devices')

    contacts_group = subparsers.add_parser('contacts', help='list all contacts')

    clients_group = subparsers.add_parser('clients', help='list all clients')

    channels_group = subparsers.add_parser('channels', help='list all channels')

    subscriptions_group = subparsers.add_parser('subscriptions', help='list all subscriptions')

    pushes_group = subparsers.add_parser('pushes', help='list all pushes')
    pushes_group.add_argument('--since', help='show pushes since this timestamp', type=str, default='')
    pushes_group.add_argument('--with-empty', help='include empty pushes', action='store_false', dest='skip_empty', default=True)

    watch_group = subparsers.add_parser('watch', help='watch for events')
    watch_group.add_argument('--with-nop', help='include "nop" events', action='store_false', dest='skip_nop', default=True)
    watch_group.add_argument('--with-pushes', help='output arrived pushes', action='store_true', dest='with_pushes', default=False)
    watch_group.add_argument('--with-empty', help='include empty pushes', action='store_false', dest='skip_empty', default=True)

    return parser

def command_devices(api, args):
    devices = api.devices()
    for device in devices:
        print(device.iden, str(device))

def command_pushes(api, args):
    pushes = api.pushes(since=args['since'], skip_empty=args['skip_empty'])
    for push in pushes:
        print_push(push)

def command_contacts(api, args):
    contacts = api.contacts()
    for contact in contacts:
        print(contact.iden, '%s <%s>' % (contact.name, contact.email))

def command_watch(api, args):
    print('Watching for push events (press <Ctrl-C> to interrupt)...')

    try:
        for event in api.stream(skip_nop=args['skip_nop']):
            print_event(event)

            if args['with_pushes']:
                for push in event.pushes(skip_empty=args['skip_empty']):
                    print_push(push)

    except KeyboardInterrupt:
        print('Watching stopped')

def command_push(api, args):
    devices = args.pop('target') or [api]
    print('... preparing push ...')
    push = api.make_push(args)
    for device in devices:
        print('... pushing to %s ...' % device)
        push.send(device)

    print('... all done!')

def command_clients(api, args):
    clients = api.clients()
    for client in clients:
        print(client.iden, str(client))

def command_channels(api, args):
    channels = api.channels()
    for channel in channels:
        print(channel.iden, str(channel))

def command_subscriptions(api, args):
    subscriptions = api.subscriptions()
    for subscription in subscriptions:
        print(subscription.__dict__)
        print(subscription.iden, str(subscription))

def print_push(push):
    print('%(created)s %(type)s %(iden)s [%(flags)s] %(sender_iden)s <%(sender_email)s> -> %(receiver_iden)s <%(receiver_email)s> %(target_device_iden)s %(push)s' % dict(
        created=time.strftime('%b %d %Y %H:%M:%S', time.localtime(getattr(push, 'created', 0))),
        type=push.type, iden=push.iden, push=unicode(push),
        target_device_iden=getattr(push, 'target_device_iden', '-'),
        sender_iden=getattr(push, 'sender_iden', 'N/A'), sender_email=getattr(push, 'sender_email', 'N/A'),
        receiver_iden=getattr(push, 'receiver_iden', 'N/A'), receiver_email=getattr(push, 'receiver_email', 'N/A'),
        flags=('A' if push.active else '') + ('D' if getattr(push, 'dismissed', False) else '')))

def print_event(event):
    print('%(time)s %(type)s %(data)s' % dict(
        time=time.strftime('%b %d %Y %H:%M:%S', time.localtime(event.time)),
        type='tickle' if isinstance(event, pushybullet.TickleEvent) else
             'push' if isinstance(event, pushybullet.PushEvent) else
             'nop' if isinstance(event, pushybullet.NopEvent) else
             'unknown',
        data=event.subtype if isinstance(event, pushybullet.TickleEvent) else
             event.push.type if isinstance(event, pushybullet.PushEvent) else
             ''))

def main():
    parser = get_parser()
    args = vars(parser.parse_args())
    api = pushybullet.PushBullet(args.pop('apikey'))
    command = globals().get('command_%s' % args['type'], command_push)
    command(api, args)

if __name__ == '__main__':
    main()
