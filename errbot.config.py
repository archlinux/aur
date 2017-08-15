import logging

BACKEND = 'XMPP'

BOT_DATA_DIR = r'/var/lib/errbot/data'
BOT_EXTRA_PLUGIN_DIR = '/var/lib/errbot/plugins'

#BOT_LOG_FILE = r'/var/log/errbot/errbot.log'
BOT_LOG_FILE = None
BOT_LOG_LEVEL = logging.WARNING

BOT_ADMINS = ('user1@example.com',
              'user2@example.com')

BOT_IDENTITY = {
    'username': 'chatbot@example.com/errbot',
    'password': 'PASSWORD' }

CHATROOM_PRESENCE = ('room1@conference.example.com',
                     'room2@conference.example.com')
