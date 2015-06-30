#!/usr/bin/env python2

BZR_SERVE_DIR = '/srv/bzr/'

import sys
import os
sys.path.insert(0, os.path.dirname(__file__))

from paste.httpexceptions import HTTPExceptionHandler
from loggerhead.apps.transport import BranchesFromTransportRoot
from loggerhead.apps.error import ErrorHandlerApp
from loggerhead.config import LoggerheadConfig
from paste.deploy.config import PrefixMiddleware
from bzrlib.plugin import load_plugins

load_plugins()
config = LoggerheadConfig()
app = BranchesFromTransportRoot(BZR_SERVE_DIR, config)
app = PrefixMiddleware(app, prefix='/')
app = HTTPExceptionHandler(app)
application = ErrorHandlerApp(app)
