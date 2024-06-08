#!/usr/bin/env python
#
# SHBASECOPYRIGHT
#
# FSL installer script.
#
"""This is the FSL installation script, which can be used to install FSL.

This script must:

 - be able to be executed with Python 2.7 or newer.

 - be able to be executed in a "vanilla" Python environment, with no third
   party dependencies.

 - be self-contained, with no dependencies on any other modules (apart from
   the Python standard library).

 - be importable as a Python module - this script contains functions and
   classes that may be used by other scripts.
"""


from __future__ import print_function, division, unicode_literals

import functools      as ft
import os.path        as op
import subprocess     as sp
import textwrap       as tw
import                   argparse
import                   contextlib
import                   datetime
import                   fnmatch
import                   getpass
import                   glob
import                   hashlib
import                   json
import                   logging
import                   os
import                   platform
import                   pwd
import                   readline
import                   shlex
import                   shutil
import                   ssl
import                   sys
import                   tempfile
import                   threading
import                   time
import                   traceback

try:
    import urllib.request as urlrequest
except ImportError:
    import urllib
    import urllib2 as urlrequest
    urlrequest.pathname2url = urllib.pathname2url


try:                import urllib.parse as urlparse
except ImportError: import                 urlparse

try:                import queue
except ImportError: import Queue as queue


PYVER = sys.version_info[:2]


log = logging.getLogger(__name__)


# this sometimes gets set to fslinstaller.pyc, so rstrip c
__absfile__ = op.abspath(__file__).rstrip('c')


__version__ = '3.11.0'
"""Installer script version number. This must be updated
whenever a new version of the installer script is released.
"""


DEFAULT_INSTALLATION_DIRECTORY = op.join(op.expanduser('~'), 'fsl')
"""Default FSL installation directory. """


DEFAULT_ROOT_INSTALLATION_DIRECTORY = '/usr/local/fsl/'
"""Default FSL installation directory when the installer is run as root. """


FSL_RELEASE_MANIFEST = 'https://fsl.fmrib.ox.ac.uk/fsldownloads/' \
                       'fslconda/releases/manifest.json'
"""URL to download the FSL installer manifest file from. The installer
manifest file is a JSON file which contains information about available FSL
versions.

See the download_manifest function, and an example manifest file
in test/data/manifest.json, for more details.

A custom manifest URL can be specified with the -a/--manifest command-line
option.
"""


FSL_DEV_RELEASES = 'https://fsl.fmrib.ox.ac.uk/fsldownloads/' \
                   'fslconda/releases/devreleases.txt'
"""URL to the devreleases.txt file, which contains a list of available
internal/development FSL releases. See the download_dev_releases function
for more details.
"""


# List of modifiers which can be used to change how
# a message is printed by the printmsg function.
INFO      = 1
IMPORTANT = 2
QUESTION  = 3
PROMPT    = 4
WARNING   = 5
ERROR     = 6
EMPH      = 7
EMPHASIS  = 7
UNDERLINE = 8
RESET     = 9
ANSICODES = {
    INFO      : '\033[37m',         # Light grey
    IMPORTANT : '\033[92m',         # Green
    QUESTION  : '\033[36m\033[4m',  # Blue+underline
    PROMPT    : '\033[36m\033[1m',  # Bright blue+bold
    WARNING   : '\033[93m',         # Yellow
    ERROR     : '\033[91m',         # Red
    EMPHASIS  : '\033[1m',          # White+bold
    UNDERLINE : '\033[4m',          # Underline
    RESET     : '\033[0m',          # Used internally
}

def get_terminal_width(fallback=None):
    """Return the number of columns in the current terminal, or fallback
    if it cannot be determined.
    """
    # os.get_terminal_size added in python
    # 3.3, so we try it but fall back to
    # COLUMNS, or tput as a last resort.
    try:
        return shutil.get_terminal_size()[0]
    except Exception:
        pass

    try:
        return int(os.environ['COLUMNS'])
    except Exception:
        pass

    try:
        result = Process.check_output('tput cols', log_output=False)
        return int(result.strip())
    except Exception:
        return fallback


def printmsg(*args, **kwargs):
    """Prints a sequence of strings formatted with ANSI codes. Expects
    positional arguments to be of the form::

        printable, ANSICODE, printable, ANSICODE, ...

    :arg log:  Must be specified as a keyword argument. If True (default),
               the message is logged.

    :arg fill: Must be specified as a keyword argument. If True (default),
               the message is wrapped to the terminal width.

    All other keyword arguments are passed through to the print function.
    """

    args     = list(args)
    blockids = [i for i in range(len(args)) if (args[i] not in ANSICODES)]
    logmsg   = kwargs.pop('log',  True)
    fill     = kwargs.pop('fill', True)

    coded    = ''
    uncoded  = ''

    for i, idx in enumerate(blockids):
        if i == len(blockids) - 1:
            slc = slice(idx + 1, None)
        else:
            slc = slice(idx + 1, blockids[i + 1])

        msg      = args[idx]
        msgcodes = args[slc]
        msgcodes = [ANSICODES[c] for c in msgcodes]
        msgcodes = ''.join(msgcodes)
        uncoded += msg
        coded   += '{}{}{}'.format(msgcodes, msg, ANSICODES[RESET])

    if len(blockids) > 0:

        if fill:
            width = get_terminal_width(70)
            coded = tw.fill(coded, width, replace_whitespace=False)

        print(coded, **kwargs)

        if logmsg:
            log.debug(uncoded)

    sys.stdout.flush()


def prompt(promptmsg, *msgtypes, **kwargs):
    """Prompts the user for some input. msgtypes and kwargs are passed
    through to the printmsg function.
    """
    printmsg(promptmsg, *msgtypes, end='', log=False, **kwargs)

    if PYVER[0] == 2: response = raw_input(' ').strip()
    else:             response = input(    ' ').strip()

    log.debug('%s: %s', promptmsg, response)

    return response


def post_request(url, data):
    """Send JSON data to a URL via a HTTP POST request. """

    data                    = json.dumps(data).encode('utf-8')
    headers                 = {}
    headers['Content-Type'] = 'application/json'
    resp                    = None

    try:
        req  = urlrequest.Request(url,
                                  headers=headers,
                                  data=data)
        resp = urlrequest.urlopen(req)
    finally:
        if resp:
            resp.close()


def identify_platform():
    """Figures out what platform we are running on. Returns a platform
    identifier string - one of:

      - "linux-64" (Linux, x86_64)
      - "macos-64" (macOS, x86_64)
      - "macos-M1" (macOS, M1)

    Note that these identifiers are for FSL releases, and are not the
    same as the platform identifiers used by conda.
    """

    platforms = {
        ('linux',  'x86_64') : 'linux-64',
        ('darwin', 'x86_64') : 'macos-64',
        ('darwin', 'arm64')  : 'macos-M1',
    }

    system = platform.system().lower()
    cpu    = platform.machine()
    key    = (system, cpu)

    if key not in platforms:
        supported = ', '.join(['[{}, {}]' for s, c in platforms])
        raise Exception('This platform [{}, {}] is unrecognised or '
                        'unsupported! Supported platforms: {}'.format(
                            system, cpu, supported))

    return platforms[key]


def timestamp():
    """Return a string containing the local time, with time zone offset.
    """
    now     = datetime.datetime.now()
    offset  = (now - datetime.datetime.utcnow())
    offset  = round(offset.total_seconds())
    hours   = int(offset / 3600)
    minutes = int((offset % 3600) / 60)
    now     = now.strftime('%Y-%m-%dT%H:%M:%S')
    return '{}{:+03d}:{:02d}'.format(now, hours, minutes)


def check_need_admin(dirname):
    """Returns True if dirname needs administrator privileges to write to,
    False otherwise.
    """
    # os.supports_effective_ids added in
    # python 3.3, so can't be used here
    return not os.access(dirname, os.W_OK | os.X_OK)


def get_admin_password(action='install FSL'):
    """Prompt the user for their administrator password. An Exception is raised
    if an incorrect password is entered three times.a

    :arg action: String which describes what the password is needed for, i.e.:
                 "Your administrator password is needed to {action}"
    :returns:    the validated administrator password
    """

    def validate_admin_password(password):
        proc = Process.sudo_popen(['true'], password, stdin=sp.PIPE)
        proc.communicate()
        return proc.returncode == 0

    msg = 'Your administrator password is needed to {}'.format(action)

    for attempt in range(3):
        if attempt == 0: msg = '{}:'.format(msg)
        else:            msg = '{} [attempt {} of 3]:'.format(msg, attempt + 1)
        printmsg(msg, IMPORTANT, end='')
        password = getpass.getpass('')
        valid    = validate_admin_password(password)

        if valid:
            printmsg('Password accepted', INFO)
            break
        else:
            printmsg('Incorrect password', WARNING)

    if not valid:
        raise Exception('Incorrect password')

    return password


def isstr(s):
    """Returns True if s is a string, False otherwise. Works on python 2.7
    and >=3.3.
    """
    try:              return isinstance(s, basestring)
    except Exception: return isinstance(s, str)


def match_any(s, patterns):
    """Test if the string s matches any of the fnmatch-style patterns.
    Returns the matched pattern, or None.
    """
    for pat in patterns:
        if fnmatch.fnmatch(s, pat):
            return pat
    return None


@contextlib.contextmanager
def tempdir(override_dir=None, change_into=True, delete=True):
    """Returns a context manager which creates, changes into, and returns a
    temporary directory, and then deletes it on exit (unless delete is False).

    If override_dir is not None, instead of creating and changing into a
    temporary directory, this function just changes into override_dir.
    """

    if override_dir is None: tmpdir = tempfile.mkdtemp()
    else:                    tmpdir = override_dir

    prevdir = os.getcwd()

    try:
        if change_into:
            os.chdir(tmpdir)
        yield tmpdir

    finally:
        if change_into:
            os.chdir(prevdir)
        if delete and override_dir is None:
            shutil.rmtree(tmpdir)


def warn_on_error(*msgargs, **msgkwargs):
    """Decorator which tries to run a function, and prints a message if it
    fails. The arguments after the function are passed to the printmsg
    function, e.g.:

    @warn_on_error('Function failed!', WARNING)
    def function(a, b):
        ...

    function('a', 'b')

    :arg toscreen: Defaults to True. Print the warning to the screen.
    :arg tolog:    Defaults to True. Print the warning to the log file.
    """

    toscreen = msgkwargs.pop('toscreen', True)
    tolog    = msgkwargs.pop('tolog',    True)

    def decorator(function):
        def wrapper(*args, **kwargs):
            try:
                function(*args, **kwargs)
            except Exception as e:
                if toscreen: printmsg(*msgargs, **msgkwargs)
                if tolog:    log.debug('%s', e, exc_info=True)
        return wrapper
    return decorator


def retry_on_error(func, num_attempts, *args, **kwargs):
    """Run func(*args, **kwargs), re-calling it up to num_attempts if it fails.

    In addition to num_attempts, this function accepts two options, which must
    be specified as keyword arguments. All other arguments will be passed
    through to func when it is called.

    :arg retry_error_message: Message to print when func fails, and before the
                              next retry.
    :arg retry_condition:     Function which is called when func fails. Passed
                              the Exception object that was raised. If this
                              function returns False, the function is not
                              retried, and the exception is re-raised..
    """

    error_message   = kwargs.pop('retry_error_message',  '')
    retry_condition = kwargs.pop('retry_condition', lambda e : True)
    attempts        = 0
    while True:
        try:
            return func(*args, **kwargs)

        except Exception as e:
            attempts += 1
            if (attempts >= num_attempts) or (not retry_condition(e)):
                raise e
            else:
                printmsg('{} Trying again (attempt {} of {})'.format(
                         error_message, attempts + 1, num_attempts),
                         WARNING, EMPHASIS)
                log.debug('retry_on_error - reason for failure: {}'.format(
                    str(e), WARNING))


class LogRecordingHandler(logging.Handler):
    """Custom logging handler which simply records log messages to an internal
    queue. When used as a context manager, will install itself as a handler
    on the fsl.installer.log logger object.
    """
    def __init__(self, patterns, logobj=None):
        """Create a LogRecordingHandler.

        :arg patterns: Sequence of strings - any log record which contains any
                       of these strings will be recorded.

        :arg logobj:   Log to register this handler with, when used as a
                       context manager. Defaults to the fsl.installer.log
                       object.
        """

        if logobj is None:
            logobj = log

        logging.Handler.__init__(self, level=logging.DEBUG)
        self.__records  = []
        self.__patterns = list(patterns)
        self.__log      = logobj

    def __enter__(self):
        self.__log.addHandler(self)
        return self

    def __exit__(self, *args):
        self.__log.removeHandler(self)

    def emit(self, record):
        record = record.getMessage()
        if any([pat in record for pat in self.__patterns]):
            self.__records.append(record)

    def records(self):
        return list(self.__records)

    def clear(self):
        self.__records = []


@contextlib.contextmanager
def tempfilename(permissions=None, delete=True):
    """Returns a context manager which creates a temporary file, yields its
    name, then deletes the file on exit.
    """

    fname = None

    try:
        tmpf  = tempfile.NamedTemporaryFile(delete=False)
        fname = tmpf.name

        tmpf.close()

        if permissions:
            os.chmod(fname, permissions)

        yield fname

    finally:
        if delete and fname and op.exists(fname):
            os.remove(fname)


def sha256(filename, check_against=None, blocksize=1048576):
    """Calculate the SHA256 checksum of the given file. If check_against
    is provided, it is compared against the calculated checksum, and an
    error is raised if they are not the same.
    """

    hashobj = hashlib.sha256()

    with open(filename, 'rb') as f:
        while True:
            block = f.read(blocksize)
            if len(block) == 0:
                break
            hashobj.update(block)

    checksum = hashobj.hexdigest()

    if check_against is not None:
        if checksum != check_against:
            raise Exception('File {} does not match expected checksum '
                            '({})'.format(filename, check_against))

    return checksum


def clean_environ():
    """Return a dict containing a set of sanitised environment variables.

    All FSL and conda related variables are removed.
    """
    env = os.environ.copy()
    for v in list(env.keys()):
        if any(('FSL' in v, 'CONDA' in v, 'MAMBA' in v, 'PYTHON' in v)):
            env.pop(v)
    return env


def install_environ(fsldir, username=None, password=None):
    """Returns a dict containing some environment variables that should
    be added to the shell environment when the FSL conda environment is
    being installed.
    """
    env = {}
    # post-link scripts call $FSLDIR/share/fsl/sbin/createFSLWrapper
    # (part of fsl/base), which will only do its thing if the following
    # env vars are set
    env['FSL_CREATE_WRAPPER_SCRIPTS'] = '1'
    env['FSLDIR']                     = fsldir

    # Make sure HTTP proxy variables, if set,
    # are available to the conda env command
    for v in ['http_proxy', 'https_proxy',
              'HTTP_PROXY', 'HTTPS_PROXY']:
        if v in os.environ:
            env[v] = os.environ[v]

    # Tell mamba not to abort if the download is taking time
    # https://github.com/mamba-org/mamba/issues/1941
    env['MAMBA_NO_LOW_SPEED_LIMIT'] = '1'

    # FSL environments which source packages from the internal
    # FSL conda channel will refer to the channel as:
    #
    # http://${FSLCONDA_USERNAME}:${FSLCONDA_PASSWORD}/abc.com/
    #
    # so we need to set those variables
    if username: env['FSLCONDA_USERNAME'] = username
    if password: env['FSLCONDA_PASSWORD'] = password

    return env


def download_file(url,
                  destination,
                  progress=None,
                  blocksize=131072,
                  ssl_verify=True):
    """Download a file from url, saving it to destination. """

    def default_progress(downloaded, total):
        pass

    if progress is None:
        progress = default_progress

    log.debug('Downloading %s ...', url)

    # Path to local file
    if op.exists(url):
        url = 'file:' + urlrequest.pathname2url(op.abspath(url))

    # We create and use an unconfigured SSL
    # context to disable SSL verification.
    # Otherwise pass None causes urlopen to
    # use default behaviour.
    kwargs = {}
    if not ssl_verify:

        # - The urlopen(context) argument is not available in py3.3
        # - py3.4 does not have PROTOCOL_TLS
        # - PROTOCOL_TLS deprecated in py3.10
        if   PYVER == (3, 3):                     pro = None
        elif hasattr(ssl, 'PROTOCOL_TLS_CLIENT'): pro = ssl.PROTOCOL_TLS_CLIENT
        elif hasattr(ssl, 'PROTOCOL_TLS'):        pro = ssl.PROTOCOL_TLS
        elif hasattr(ssl, 'PROTOCOL_TLSv1_2'):    pro = ssl.PROTOCOL_TLSv1_2
        elif hasattr(ssl, 'PROTOCOL_TLSv1_1'):    pro = ssl.PROTOCOL_TLSv1_1
        elif hasattr(ssl, 'PROTOCOL_TLSv1'):      pro = ssl.PROTOCOL_TLSv1
        else:                                     pro = None

        if pro is None:
            printmsg('SSL verification cannot be skipped - if this is '
                     'a problem, try running the installer with a newer '
                     'version of Python.', INFO)
        else:
            printmsg('Skipping SSL verification - this '
                     'is not recommended!', WARNING)

            sslctx                = ssl.SSLContext(pro)
            sslctx.check_hostname = False
            sslctx.verify_mode    = ssl.CERT_NONE
            kwargs['context']     = sslctx

    req = None

    try:
        # py2: urlopen result cannot be
        # used as a context manager
        req = urlrequest.urlopen(url, **kwargs)
        with open(destination, 'wb') as outf:

            try:             total = int(req.headers['content-length'])
            except KeyError: total = None

            downloaded = 0

            progress(downloaded, total)
            while True:
                block = req.read(blocksize)
                if len(block) == 0:
                    break
                downloaded += len(block)
                outf.write(block)
                progress(downloaded, total)

    finally:
        if req:
            req.close()


def download_manifest(url, workdir=None, **kwargs):
    """Downloads the installer manifest file, which contains information
    about available FSL versions, and the most recent version number of the
    installer (this script).

    Keyword arguments are passed through to the download_file function.

    The manifest file is a JSON file. Lines beginning with a double-forward
    slash are ignored.

    This function modifies the manifest structure by adding a 'version'
    attribute to all FSL build entries.
    """

    log.debug('Downloading FSL installer manifest from %s', url)

    with tempdir(workdir):

        try:
            download_file(url, 'manifest.json', **kwargs)
        except Exception as e:
            log.debug('Error downloading FSL release manifest from %s',
                      url, exc_info=True)
            raise Exception('Unable to download FSL release manifest '
                            'from {} [{}]!'.format(url, str(e)))

        with open('manifest.json') as f:
            lines = f.readlines()

    # Drop comments
    lines = [l for l in lines if not l.lstrip().startswith('//')]

    manifest = json.loads('\n'.join(lines))

    # Add "version" to every build
    for version, builds in manifest['versions'].items():
        if version == 'latest':
            continue
        for build in builds:
            build['version'] = version

    return manifest


def download_dev_releases(url, workdir=None, **kwargs):
    """Downloads the FSL_DEV_RELEASES file. This file contains a list of
    available development manifest URLS. Returns a list of tuples, one
    for each development release, with each tuple containing:

      - URL to the manifest file
      - Version identifier
      - Commit hash (on the fsl/conda/manifest repository)
      - Branch name (on the fsl/conda/manifest repository)

    The list is sorted by date, newest first.

    Keyword arguments are passed through to the download_file function.
    """

    # parse a dev manifest file name, returning
    # a sequence containing the tage, date, commit
    # hash, and branch name. Dev manifest files
    # are named like so:
    #
    #   manifest-<tag>.<date>.<commit>.<branch>.json
    #
    # where <tag> is the tag of the most recent
    # public FSL release, and everything else is
    # self-explanatory.
    def parse_devrelease_name(url):
        name = urlparse.urlparse(url).path
        name = op.basename(name)
        name = name.lstrip('manifest-').rstrip('.json')

        # The devrelease list may contain public
        # releases too - sniff the commit, and if
        # it doesn't look like a commit hash,
        # assume that this file corresponds to a
        # public release.
        commit = name.rsplit('.', 2)[-2]

        # public release or dev release
        if len(commit) < 7: bits = [name, None, None]
        else:               bits = name.rsplit('.', 2)

        return bits

    # list of (url, version, commit, branch)
    devreleases = []

    with tempdir(workdir):

        try:
            download_file(url, 'devreleases.txt', **kwargs)
        except Exception as e:
            log.debug('Error downloading devreleases.txt from %s',
                      url, exc_info=True)
            raise Exception('Unable to download development manifest '
                            'list from {}!'.format(url))

        with open('devreleases.txt', 'rt') as f:
            urls = f.read().strip().split('\n')
            urls = [l.strip() for l in urls]

        for url in urls:
            devreleases.append([url] + parse_devrelease_name(url))

    # sort by version, newest first
    return sorted(devreleases, key=lambda r: Version(r[1]), reverse=True)


class Progress(object):
    """Simple progress reporter. Displays one of the following:

       - If both a value and total are provided, a progress bar is shown
       - If only a value is provided, a cumulative count is shown
       - If nothing is provided, a spinner is shown.

    Use as a context manager, and call the update method to report progress,
    e,g:

        with Progress('%') as p:
            for i in range(100):
                p.update(i + 1, 100)
    """

    def __init__(self,
                 label='',
                 transform=None,
                 fmt='{:.1f}',
                 total=None,
                 width=None,
                 proglabel='progress',
                 progfile=None):
        """Create a Progress reporter.

        :arg label:     Units (e.g. "MB", "%",)

        :arg transform: Function to transform values (see e.g.
                        Progress.bytes_to_mb)

        :arg fmt:       Template string used to format value / total.

        :arg total:     Maximum value - overrides the total value passed to
                        the update method.

        :arg width:     Maximum width, if a progress bar is displayed. Default
                        is to automatically infer the terminal width (see
                        get_terminal_width).

        :arg proglabel: Label to use when writing progress updates to progfile.

        :arg progfile:  File to write progress updates to. Each update is
                        written on a new line, and has the form:

                        <proglabel> <value>[ <total>]
        """

        if transform is None:
            transform = Progress.default_transform

        self.width     = width
        self.fmt       = fmt.format
        self.total     = total
        self.label     = label
        self.transform = transform
        self.proglabel = proglabel
        self.progfile  = progfile

        # used by the spin function
        self.__last_spin = None

    @staticmethod
    def default_transform(val, total):
        return val, total

    @staticmethod
    def bytes_to_mb(val, total):
        if val   is not None: val   = val   / 1048576
        if total is not None: total = total / 1048576
        return val, total

    @staticmethod
    def percent(val, total):
        if val is None or total is None:
            return val, total
        return 100 * (val / total), 100

    def __enter__(self):
        return self

    def __exit__(self, *args, **kwargs):
        printmsg('', log=False, fill=False)

    def write_progress(self, value, total):

        if self.progfile is None:
            return

        if value is None: value = ''
        if total is None: total = ''

        with open(self.progfile, 'at') as f:
            f.write('{} {} {}\n'.format(self.proglabel, value, total))

    def update(self, value=None, total=None):

        if total is None:
            total = self.total

        value, total = self.transform(value, total)

        if value is None and total is None:
            self.spin()
        elif value is not None and total is None:
            self.count(value)
        elif value is not None and total is not None:
            self.progress(value, total)

        self.write_progress(value, total)

    def spin(self):

        symbols = ['|', '/', '-',  '\\']

        if self.__last_spin is not None: last = self.__last_spin
        else:                            last = symbols[-1]

        idx  = symbols.index(last)
        idx  = (idx + 1) % len(symbols)
        this = symbols[idx]

        printmsg(this, end='\r', log=False, fill=False)
        self.__last_spin = this

    def count(self, value):

        value = self.fmt(value)

        if self.label is None: line = '{} ...'.format(value)
        else:                  line = '{}{} ...'.format(value, self.label)

        printmsg(line, end='\r', log=False, fill=False)

    def progress(self, value, total):

        value = min(value, total)

        # arbitrary fallback of 50 columns if
        # terminal width cannot be determined
        if self.width is None: width = get_terminal_width(50)
        else:                  width = self.width

        fvalue = self.fmt(value)
        ftotal = self.fmt(total)
        suffix = '{} / {} {}'.format(fvalue, ftotal, self.label).rstrip()

        # +5: - square brackets around bar
        #     - space between bar and tally
        #     - space+spin at the end
        width     = width - (len(suffix) + 5)
        completed = int(round(width * (value  / total)))
        remaining = width - completed
        progress  = '[{}{}] {}'.format('#' * completed,
                                       ' ' * remaining,
                                       suffix)

        printmsg(progress, end='', log=False, fill=False)
        printmsg(' ', end='', log=False, fill=False)
        self.spin()
        printmsg(end='\r', log=False, fill=False)


class Process(object):
    """Container for a subprocess.Popen object, allowing non-blocking
    line-based access to its standard output and error streams via separate
    queues, while logging all outputs.

    Don't create a Process directly - use one of the following static methods:
     - Process.check_output
     - Process.check_call
     - Process.monitor_progress
    """


    def __init__(self,
                 cmd,
                 admin=False,
                 password=None,
                 log_output=True,
                 print_output=False,
                 append_env=None,
                 **kwargs):
        """Run the specified command. Starts threads to capture stdout and
        stderr.

        :arg cmd:          Command to run - passed through shlex.split, then
                           passed to subprocess.Popen

        :arg admin:        Run the command with administrative privileges

        :arg password:     Administrator password - can be None if admin is
                           False.

        :arg log_output:   If True, the command and all of its stdout/stderr
                           are logged.

        :arg print_output: If True, the command and all of its stdout/stderr
                           are logged.

        :arg append_env:   Dictionary of additional environment to be set when
                           the command is run.

        :arg kwargs:       Passed to subprocess.Popen
        """

        self.cmd     = cmd
        self.stdoutq = queue.Queue()
        self.stderrq = queue.Queue()

        if log_output:
            log.debug('Running %s [as admin: %s]', cmd, admin)

        self.popen = Process.popen(cmd, admin, password,
                                   append_env=append_env, **kwargs)

        # threads for consuming stdout/stderr
        self.stdout_thread = threading.Thread(
            target=Process.forward_stream,
            args=(self.popen.stdout, self.stdoutq, cmd,
                  'stdout', log_output, print_output))
        self.stderr_thread = threading.Thread(
            target=Process.forward_stream,
            args=(self.popen.stderr, self.stderrq, cmd,
                  'stderr', log_output, print_output))

        self.stdout_thread.daemon = True
        self.stderr_thread.daemon = True
        self.stdout_thread.start()
        self.stderr_thread.start()


    def wait(self):
        """Waits for the process to terminate, then waits for the stdout
        and stderr consumer threads to finish.
        """
        self.popen.wait()
        self.stdout_thread.join()
        self.stderr_thread.join()


    @property
    def returncode(self):
        """Process return code. Returns None until the process has terminated,
        and the stdout/stderr consumer threads have finished.
        """
        if self.popen.returncode is None: return None
        if self.stdout_thread.is_alive(): return None
        if self.stderr_thread.is_alive(): return None
        return self.popen.returncode


    @staticmethod
    def check_output(cmd, *args, **kwargs):
        """Behaves like subprocess.check_output. Runs the given command, then
        waits until it finishes, and return its standard output. An error
        is raised if the process returns a non-zero exit code, unless a keyword
        argument `check=False` is specified.

        :arg cmd: The command to run, as a string
        """

        check = kwargs.pop('check', True)
        proc  = Process(cmd, *args, **kwargs)

        proc.wait()

        if check and (proc.returncode != 0):
            raise RuntimeError('This command returned an error: ' + cmd)

        stdout = ''
        while True:
            try:
                stdout += proc.stdoutq.get_nowait()
            except queue.Empty:
                break

        return stdout


    @staticmethod
    def check_call(cmd, *args, **kwargs):
        """Behaves like subprocess.check_call. Runs the given command, then
        waits until it finishes. An error is raised if the process returns a
        non-zero exit code, unless a keyword argument `check=False` is
        specified.

        :arg cmd: The command to run, as a string
        """

        check = kwargs.pop('check', True)
        proc  = Process(cmd, *args, **kwargs)

        proc.wait()

        if check and proc.returncode != 0:
            raise RuntimeError('This command returned an error: ' + cmd)

        return proc.returncode


    @staticmethod
    def monitor_progress(cmd, total=None, *args, **kwargs):
        """Runs the given command(s), and shows a progress bar under the
        assumption that cmd will produce "total" number of lines of output.

        :arg cmd:       The commmand to run as a string, or a sequence of
                        multiple commands.

        :arg total:     Total number of lines of standard output to expect.

        :arg timeout:   Refresh rate in seconds. Must be passed as a keyword
                        argument.

        :arg progfunc:  Function which returns a number indicating how far
                        the process has progressed.  If provided, this
                        function is called, instead of standard output
                        lines being monitored. The function is passed a
                        reference to the Process object. Must be passed as a
                        keyword argument.

        :arg progfile:  File to write progress updates to.

        :arg proglabel: Label to use when writing progress updates to progfile.
        """

        timeout   = kwargs.pop('timeout',   0.5)
        progfunc  = kwargs.pop('progfunc',  None)
        proglabel = kwargs.pop('proglabel', None)
        progfile  = kwargs.pop('progfile',  None)

        if total is None: label = None
        else:             label = '%'

        if progfunc is None:
            nlines = [0]
            def progfunc(proc):
                try:
                    _         = proc.stdoutq.get_nowait()
                    nlines[0] = nlines[0] + 1
                except queue.Empty:
                    pass
                return nlines[0]

        if isstr(cmd): cmds = [cmd]
        else:          cmds =  cmd

        with Progress(label=label,
                      fmt='{:.0f}',
                      transform=Progress.percent,
                      proglabel=proglabel,
                      progfile=progfile) as prog:

            progcount = 0 if total else None

            for cmd in cmds:

                proc = Process(cmd, *args, **kwargs)
                prog.update(progcount, total)

                while proc.returncode is None:
                    time.sleep(timeout)
                    progcount = progfunc(proc) if total else None
                    prog.update(progcount, total)
                    proc.popen.poll()

                # force progress bar to 100% when finished
                if proc.returncode == 0:
                    prog.update(total, total)
                else:
                    raise RuntimeError('This command returned '
                                       'an error: ' + cmd)


    @staticmethod
    def forward_stream(stream,
                       queue,
                       cmd,
                       streamname,
                       log_output,
                       print_output):
        """Reads lines from stream and pushes them onto queue until popen
        is finished. Logs every line.

        :arg stream:       stream to forward
        :arg queue:        queue.Queue to push lines onto
        :arg cmd:          string - the command that is running
        :arg streamname:   string - 'stdout' or 'stderr'
        :arg log_output:   If True, log all stdout/stderr.
        :arg print_output: If True, print all stdout/stderr.
        """

        while True:
            line = stream.readline().decode('utf-8')
            if line == '':
                break
            queue.put(line)
            if log_output:
                log.debug(' [%s]: %s', streamname, line.rstrip())
            if print_output:
                print(' [{}]: {}'.format(streamname, line.rstrip()))


    @staticmethod
    def popen(cmd, admin=False, password=None, append_env=None, **kwargs):
        """Runs the given command via subprocess.Popen, as administrator if
        requested.

        :arg cmd:        The command to run, as a string

        :arg admin:      Whether to run with administrative privileges

        :arg pssword:    Administrator password. Only required if admin is
                         True.

        :arg append_env: Dictionary of additional environment to be set when
                         the command is run.

        :arg kwargs:     Passed to subprocess.Popen. stdin, stdout, and stderr
                         will be silently clobbered

        :returns:        The subprocess.Popen object.
        """

        admin = admin and os.getuid() != 0

        cmd              = shlex.split(cmd)
        kwargs['stdin']  = sp.PIPE
        kwargs['stdout'] = sp.PIPE
        kwargs['stderr'] = sp.PIPE

        if admin:
            proc = Process.sudo_popen(cmd, password, append_env, **kwargs)
        else:
            # if append_env has been specified,
            # add it to the normal env option.
            if append_env is not None:
                env = kwargs.get('env', os.environ.copy())
                env.update(append_env)
                kwargs['env'] = env

            proc = sp.Popen(cmd, **kwargs)

        return proc


    @staticmethod
    def sudo_popen(cmd, password, append_env=None, **kwargs):
        """Runs "sudo cmd" using subprocess.Popen. Used by Process.popen.
        Assumes that kwargs contains stdin=sp.PIPE
        """

        # sudo will not necessarily propagate environment
        # variables, and there is no guarantee that the
        # sudo -E option will work. So here we create a
        # wrapper shell script with "export VAR=VALUE"
        # statements for all environment variables that
        # are set.
        if append_env is None:
            append_env = {}

        # Make the wrapper script delete itself
        # after the command has been executed.
        with tempfilename(0o755, delete=False) as wrapper:
            with open(wrapper, 'wt') as f:
                f.write('#!/usr/bin/env sh\n')
                f.write('set -e\n')
                f.write('thisfile=$0\n')
                f.write('thisdir=$(cd $(dirname $0) && pwd)\n')
                for k, v in append_env.items():
                    f.write('export {}="{}"\n'.format(k, v))
                # shlex.join not available in py27
                f.write(' '.join(cmd) + '\n')
                f.write('cd ${thisdir} && rm ${thisfile}\n')

        cmd  = ['sudo', '-S', '-k', wrapper]
        proc = sp.Popen(cmd, **kwargs)
        proc.stdin.write('{}\n'.format(password).encode())
        proc.stdin.flush()
        return proc


@ft.total_ordering
class Version(object):
    """Class to represent and compare version strings.  Accepted version
    strings are of the form W.X.Y.Z, where W, X, Y, and Z are all integers.
    """
    def __init__(self, verstr):
        # Version identifiers for official FSL
        # releases will have up to four
        # components (X.Y.Z.W), but we accept
        # any number of (integer) components,
        # as internal releases may have more.
        components = []

        # ignore a leading "v", e.g. v1.2.3
        verstr = verstr.lower()
        if verstr.startswith('v'):
            verstr = verstr[1:]

        for comp in verstr.split('.'):
            try:              components.append(int(comp))
            except Exception: break

        self.components = components
        self.verstr     = verstr

    def __str__(self):
        return self.verstr

    def __eq__(self, other):
        for sn, on in zip(self.components, other.components):
            if sn != on:
                return False
        return len(self.components) == len(other.components)

    def __lt__(self, other):
        for p1, p2 in zip(self.components, other.components):
            if p1 < p2: return True
            if p1 > p2: return False
        return len(self.components) < len(other.components)


class Context(object):
    """Bag of information and settings created in the main function, and passed
    around this script.

    Several settings are lazily evaluated on first access, but once evaluated,
    their values are immutable.
    """

    def __init__(self, args, destdir=None, action='install FSL'):
        """Create the context with the argparse.Namespace object containing
        parsed command-line arguments.

        :arg args:    argparse.Namespace containing command-line arguments
        :arg destdir: Installation directory. If not provided, read from
                      args.dest, or read from the user,
        :arg action:  Passed to get_admin_password as a prompt.
        """

        if destdir is not None:
            destdir = op.abspath(destdir)

        self.args  = args
        self.shell = op.basename(os.environ.get('SHELL', 'sh')).lower()

        # These attributes are updated on-demand via
        # the property accessors defined below, or are
        # all updated via the finalise_settings method.
        self.__platform         = None
        self.__manifest         = None
        self.__devmanifest      = None
        self.__candidate_builds = None
        self.__build            = None
        self.__destdir          = destdir
        self.__need_admin       = None
        self.__admin_password   = None
        self.__action           = action

        # If the destination directory already exists,
        # and the user chooses to overwrite it, it is
        # moved so that, if the installation fails, it
        # can be restored. The new path is stored
        # here - refer to overwrite_destdir.
        self.old_destdir = None

        # The download_fsl_environment function stores
        # the path to the FSL conda environment file
        # list of conda channels, and python version
        # to be installed
        self.environment_file     = None
        self.environment_channels = None
        self.python_version       = None

        # The config_logging function stores the path
        # to the fslinstaller log file here.
        self.logfile = None


    def finalise_settings(self):
        """Finalise values for all information and settings in the Context.
        """
        self.manifest
        self.candidate_builds
        self.platform
        self.build
        self.destdir
        self.need_admin
        self.admin_password


    @property
    def license_url(self):
        """Return the FSL license URL from the manifest, or None if it is not
        present.
        """
        return self.manifest['installer'].get('license_url')


    @property
    def registration_url(self):
        """Return the FSL registration URL from the manifest, or None if it is
        not present.
        """
        return self.manifest['installer'].get('registration_url')


    @property
    def platform(self):
        """The platform we are running on, e.g. "linux-64", "macos-64",
        "macos-M1". This identifier is used to determine which FSL build to
        install.

        Note that this function may report a different platform identifier than
        the actual platform - specifically, if running on a M1 mac, and there
        is no M1 FSL build for the requested FSL version, this function will
        report "macos-64". This is because some older FSL releases do not have
        M1 builds available.
        """
        if self.__platform is None:
            plat = identify_platform()

            # if M1, check that we have a suitable
            # FSL build, falling back to x86 if not.
            if plat == 'macos-M1':
                candidates = self.candidate_builds
                if not any(c['platform'] == 'macos-M1' for c in candidates):
                    plat = 'macos-64'

            self.__platform = plat

        return self.__platform


    @property
    def miniconda_metadata(self):
        """Returns a dict with information about the miniconda installer
        to use as the base of the FSL installation. This must not be called
        until after the download_fsl_environment function has been called.

        The returned dict has `'url'`, `'sha256'` and `'output'` keys.
        """
        # Get information about the miniconda installer
        # from the manifest.
        metadata = self.manifest['miniconda'][self.platform]
        pyver    = 'python{}'.format(self.python_version)

        # From FSL 6.0.7.12 and newer, the manifest
        # contains a separate miniconda installer URL
        # for each Python version that is used in the
        # different FSL versions. Prior to this, the
        # manifest just contained a single miniconda URL
        # for each platform. This code supports both the
        # old and new manifest formats.
        if pyver in metadata:
            metadata = metadata[pyver]

        # if pyver is not in metadata, we either have an
        # old manifest format which contains info for a
        # single miniconda installer, or the manifest
        # does not contain a miniconda installer entry
        # for the python version to be installed.
        elif 'url' not in metadata:
            raise Exception('Manifest does not contain metadata for a Python '
                            '{} miniconda installer!'.format(pyver))

        return metadata


    @property
    def candidate_builds(self):
        """Query the manifest and return a list of available builds for the
        requested FSL release, for all platforms.
        """
        if self.__candidate_builds is not None:
            return self.__candidate_builds

        # defaults to "latest" if
        # not specified by the user
        fslversion = self.args.fslversion
        if fslversion is None:
            fslversion = 'latest'

        if fslversion not in self.manifest['versions']:
            available = ', '.join(self.manifest['versions'].keys())
            raise Exception(
                'FSL version "{}" is not available - available '
                'versions: {}'.format(fslversion, available))

        if fslversion == 'latest':
            fslversion = self.manifest['versions']['latest']

        self.__candidate_builds = list(self.manifest['versions'][fslversion])

        return self.__candidate_builds


    @property
    def build(self):
        """Returns a suitable FSL build (a dictionary entry from the FSL
        installer manifest) for the target platform.

        The returned dictionary has the following elements:
          - 'version'      FSL version.
          - 'platform':    Platform identifier (e.g. 'linux-64')
          - 'environment': Environment file to download
          - 'sha256':      Checksum of environment file
          - 'output':      Number of lines of expected output, for reporting
                           progress
        """

        if self.__build is not None:
            return self.__build

        # Find refs to a suitable build for this
        # platform. We assume that there is only
        # one default build for each platform.
        # in the list of builds for a given FSL
        # version.
        candidates = self.candidate_builds
        build      = None

        for candidate in candidates:
            if candidate['platform'] == self.platform:
                build = candidate
                break
        else:
            raise Exception(
                'Cannot find a version of FSL matching '
                'platform {}'.format(self.platform))

        printmsg('FSL {} selected for installation'.format(build['version']))

        self.__build = build
        return build


    @property
    def destdir(self):
        """Installation directory. If not specified at the command line, the
        user is prompted to enter a directory.
        """

        if self.__destdir is not None:
            return self.__destdir

        fsldir = os.environ.get('FSLDIR', None)

        if fsldir is not None: defdestdir = fsldir
        elif os.getuid() != 0: defdestdir = DEFAULT_INSTALLATION_DIRECTORY
        else:                  defdestdir = DEFAULT_ROOT_INSTALLATION_DIRECTORY

        # The loop below validates the destination directory
        # both when specified at commmand line or
        # interactively.  In either case, if invalid, the
        # user is re-prompted to enter a new destination.
        destdir = None
        if self.args.dest is not None: response = self.args.dest
        else:                          response = None

        while destdir is None:

            if response is None:
                printmsg('\nWhere do you want to install FSL?',
                         IMPORTANT, EMPHASIS)
                printmsg('Press enter to install to the default location '
                         '[{}]\n'.format(defdestdir), INFO)
                response = prompt('FSL installation directory [{}]:'.format(
                    defdestdir), QUESTION, EMPHASIS)
                response = response.rstrip(op.sep)

                if response == '':
                    response = defdestdir

            response  = op.expanduser(op.expandvars(response))
            response  = op.abspath(response)
            parentdir = op.dirname(response)
            if op.exists(parentdir):
                destdir = response
            else:
                printmsg('Destination directory {} does not '
                         'exist!'.format(parentdir), ERROR)
                response = None

        self.__destdir = destdir
        return self.__destdir


    @property
    def conda(self):
        """Return a path to the ``conda`` or ``mamba`` executable. """
        bindir   = op.join(self.basedir, 'bin')
        condabin = op.join(bindir, 'conda')
        mambabin = op.join(bindir, 'mamba')

        # If mamba is present, prefer it over conda, unless
        # the user requestd otherwise via the --conda flag
        if not self.args.conda: candidates = [mambabin, condabin]
        else:                   candidates = [condabin, mambabin]

        for c in candidates:
            if op.exists(c):
                return c

        raise RuntimeError('Cannot find conda/mamba '
                           'executable in {}'.format(bindir))


    @property
    def basedir(self):
        """Return the path to the base conda installation. For normal
        installations this is equivalent to destdir / $FSLDIR, but may be
        different if the fslinstaller was instructed to use an existing
        [mini]conda installation.
        """

        # Either the user gave a path to an existing
        # miniconda installation, or $FSLDIR is the
        # base miniconda installation
        if (self.args.miniconda is not None) and op.isdir(self.args.miniconda):
            return self.args.miniconda
        else:
            return self.destdir


    @property
    def use_existing_base(self):
        """Return True if we have been instructed to use an existing
        [mini]conda installation, as opposed to downloading/installing one.
        """
        return ((self.args.miniconda is not None) and
                op.isdir(self.args.miniconda))


    @property
    def need_admin(self):
        """Returns True if administrator privileges will be needed to install
        FSL.
        """
        if self.__need_admin is not None:
            return self.__need_admin
        parentdir = op.dirname(self.destdir)
        self.__need_admin = check_need_admin(parentdir)
        return self.__need_admin


    @property
    def admin_password(self):
        """Returns the user's administrator password, prompting them if needed.
        """
        # need_admin may be None or False,
        # so don't rely on truthiness.
        if not self.need_admin:
            return None
        if self.__admin_password is None:
            self.__admin_password = get_admin_password(self.__action)
        return self.__admin_password


    @property
    def manifest(self):
        """Returns the FSL installer manifest as a dictionary. """

        if self.__manifest is None:
            if self.devmanifest is not None:
                self.args.manifest = self.devmanifest

            self.__manifest = download_manifest(
                self.args.manifest,
                self.args.workdir,
                ssl_verify=(not self.args.skip_ssl_verify))
        return self.__manifest


    @property
    def devmanifest(self):
        """Returns a URL to a development manifest to use for installation.
        This will only return a value if the --devrelease or --devlatest
        options are active.

        If this is the case, the FSL_DEV_RELEASES file is downloaded - this
        file contains a list of available development manifest URLS. The
        user is then prompted to choose which development manifest to use
        for the installation, unless --devlatest is active, in which case
        the newest manifest is selected.
        """
        if not self.args.devrelease:
            return None
        if self.__devmanifest == 'na':
            return None
        elif self.__devmanifest is not None:
            return self.__devmanifest

        devreleases = download_dev_releases(
            FSL_DEV_RELEASES,
            self.args.workdir,
            ssl_verify=(not self.args.skip_ssl_verify))

        if len(devreleases) == 0:
            self.__devmanifest = 'na'
            return None

        self.__devmanifest = prompt_dev_release(devreleases,
                                                self.args.devlatest)

        return self.__devmanifest


    def run(self, process_func, *args, **kwargs):
        """Run a command via a static Process method.  Handles sudo/
        administrator authentication, and ensures that the shell
        environment in which the command is executed is sanitised.

        Can be used with Process.check_call, Process.check_output, and
        Process.monitor_progress. For example:

            ctx = Context(...)
            ctx.run(Process.check_call, 'my_command')
            ctx.run(Process.monitor_progress, 'my_command', total=100)
        """

        env          = kwargs.pop('env',        {})
        append_env   = kwargs.pop('append_env', {})
        process_func = ft.partial(process_func, *args, **kwargs)

        # Clear any environment variables that refer to
        # existing FSL or conda installations, and ensure
        # that some specific FSL environment variables
        # are set while the command is running.  See
        # clean_environ and install_environ for more
        # details, and see Process.sudo_popen regarding
        # append_env.
        env.update(clean_environ())
        append_env.update(install_environ(self.destdir,
                                          self.args.username,
                                          self.args.password))
        return process_func(admin=self.need_admin,
                            password=self.admin_password,
                            env=env,
                            append_env=append_env)


def agree_to_license(ctx):
    """Prompts the user to agree to the terms of the FSL license."""

    msg = ['Installing FSL implies agreement with the terms of the FSL '
           'license - if you do not agree with these terms, you can '
           'cancel the installation by pressing CTRL+C.', IMPORTANT]

    if ctx.license_url is not None:
        msg = msg + [' You can view the license at ', IMPORTANT,
                     ctx.license_url, IMPORTANT, UNDERLINE]
    printmsg(*msg)
    printmsg('')


def check_rosetta_status(ctx):
    """Called from the main routine, before installation is attempted.  If
    running on a M1 macos machine, and a x86 version of FSL has been selected
    for installation, checks whether rosetta emulation is enabled. If so,
    does nothing further. Otherwise, prints a message and exits.
    """

    if not all((identify_platform() == 'macos-M1',
                ctx.platform        == 'macos-64')):
        return

    # Using the strategy discussed at
    # https://forum.latenightsw.com/t/possible-for-a-script-\
    #   to-test-whether-rosetta-2-is-installed/3207/6
    #
    # The pkgutil command should return 0 if
    # rosetta is installed, non-0 otherwise.
    try:
        Process.check_output('pkgutil --files com.apple.pkg.RosettaUpdateAuto')
    except RuntimeError:
        printmsg('Rosetta emulation does not appear to be enabled!\n', ERROR)
        printmsg('Enable rosetta emulation, and then run this installer '
                 'again. You can enable rosetta emulation by running this '
                 'command:\n', INFO)
        printmsg('  /usr/sbin/softwareupdate --install-rosetta '
                 '--agree-to-license\n', IMPORTANT)
        printmsg('Aborting installation', ERROR)
        sys.exit(1)
    # pkgutil command not found - should
    # never happen, but print a warning
    # just in case
    except Exception as e:
        printmsg('An error occurred calling the pkgutil command - this '
                 'may not be a problem, so I\'ll attempt to proceed '
                 'with the installation. ({}'.format(e), WARNING)


def list_available_versions(manifest):
    """Lists available FSL versions. """
    printmsg('Available FSL versions:', EMPHASIS)
    for version in manifest['versions']:
        if version == 'latest':
            continue
        printmsg(version, IMPORTANT, EMPHASIS)
        for build in manifest['versions'][version]:
            printmsg('  {}'.format(build['platform']), EMPHASIS, end=' ')
            printmsg(build['environment'], INFO)


def prompt_dev_release(devreleases, latest):
    """Prompts the user to select a development release.

    :arg devreleases: List of development releases, as returned by
                      download_dev_releases.
    :arg latest:      If True, the latest develeopment release is returned.
    """

    if len(devreleases) == 0:
        return None

    # automatically choose latest dev manifest?
    if latest:
        return devreleases[0][0]

    # show the user a list, ask them which one they want
    printmsg('Available development releases:', EMPHASIS)
    for i, (url, tag, commit, branch) in enumerate(devreleases):
        # dev release
        if commit is not None:
            printmsg('  [{}]: {} [{} commit {}]'.format(
                i + 1, tag, branch, commit), IMPORTANT)
        # public release
        else:
            printmsg('  [{}]: {}'.format(i + 1, tag), IMPORTANT)

    while True:
        selection = prompt('Which release would you like to '
                           'install? [1]:', PROMPT)
        if selection == '':
            selection = '1'
        try:
            selection = int(selection) - 1
        except Exception:
            continue
        if selection >= 0 and selection < len(devreleases):
            break
    return devreleases[selection][0]


def download_fsl_environment(ctx):
    """Downloads the environment specification file for the selected FSL
    version.

    Internal/development FSL versions may source packages from the internal
    FSL conda channel, which requires a username+password to authenticate.

    These are referred to in the environment file as ${FSLCONDA_USERNAME}
    and ${FSLCONDA_PASSWORD}.

    If the user has not provided a username+password on the command-line, they
    are prompted for them.

    The downloaded environment file may be modified - if the (hidden)
    --exclude_package option has been used.
    """

    build        = ctx.build
    url          = build['environment']
    checksum     = build.get('sha256', None)

    printmsg('Downloading FSL environment specification '
             'from {}...'.format(url))
    fname = url.split('/')[-1]
    download_file(url, fname, ssl_verify=(not ctx.args.skip_ssl_verify))
    ctx.environment_file = op.abspath(fname)
    if (checksum is not None) and (not ctx.args.no_checksum):
        sha256(fname, checksum)

    # Environment files for internal/dev FSL versions
    # will list the internal FSL conda channel with
    # ${FSLCONDA_USERNAME} and ${FSLCONDA_PASSWORD}
    # as placeholders for the username/password.
    with open(fname, 'rt') as f:
        need_auth = '${FSLCONDA_USERNAME}' in f.read()

    # We need a username/password to access the internal
    # FSL conda channel. Prompt the user if they haven't
    # provided credentials.
    if need_auth and (ctx.args.username is None):
        printmsg('A username and password are required to install '
                 'this version of FSL.', WARNING, EMPHASIS)
        ctx.args.username = prompt('Username:').strip()
        ctx.args.password = getpass.getpass('Password: ').strip()

    # Conda expands environment variables within a
    # .condarc file, but *not* within an environment.yml
    # file. So to authenticate to our internal channel
    # without storing credentials anywhere in plain text,
    # we *move* the channel list from the environment.yml
    # file into $FSLDIR/.condarc.
    #
    # Here we extract the channels from the environment
    # file, and save them to ctx.environment_channels.
    # The install_miniconda function will then add the
    # channels to $FSLDIR/.condarc.
    #
    # We also identify the version of Python to be
    # installed, remove any packages that the user has
    # requested to exclude from the installation.
    copy     = '.' + op.basename(ctx.environment_file)
    channels = []
    pyver    = None

    shutil.move(ctx.environment_file, copy)
    with open(copy,                 'rt') as inf, \
         open(ctx.environment_file, 'wt') as outf:

        in_channels_section = False

        for line in inf:

            # start of channels list
            if line.strip() == 'channels:':
                in_channels_section = True
                continue

            if in_channels_section:
                # end of channels list
                if not line.strip().startswith('-'):
                    in_channels_section = False
                else:
                    channels.append(line.split()[-1])
                    continue

            # Include/exclude packages upon user request
            exclude = False
            pkgname = line.strip(' -').split()[0]

            # Also pull out the python version so we
            # know which miniconda installer to use
            if pkgname == 'python' and pyver is None:
                pyver = line.strip(' -').split()[1]
                pyver = '.'.join(pyver.split('.')[:2])
            else:
                exclude = match_any(pkgname, ctx.args.exclude_package)

            if exclude:
                log.debug('Excluding package %s (matched '
                          '--exclude_package %s)', line, exclude)
            else:
                outf.write(line)

    if pyver is None:
        raise Exception('Could not identify Python version in '
                        'FSL environment file ({})'.format(url))

    ctx.environment_channels = channels
    ctx.python_version       = pyver


def download_miniconda(ctx):
    """Downloads the miniconda/miniforge installer and saves it as
    "miniconda.sh".

    This function assumes that it is run within a temporary/scratch directory.
    """

    # The user has specified a path to an
    # existing miniconda installation - we
    # use that rather than downloading/
    # installing a separate one.
    if ctx.use_existing_base:
        return

    # user specified a URL/path to a
    # miniconda installer
    elif ctx.args.miniconda is not None:
        url      = ctx.args.miniconda
        checksum = None

    # Use miniconda installer specified
    # in FSL release manifest
    else:
        metadata = ctx.miniconda_metadata
        url      = metadata['url']
        checksum = metadata['sha256']

    # Download
    printmsg('Downloading miniconda from {}...'.format(url))
    with Progress('MB', transform=Progress.bytes_to_mb,
                  proglabel='download_miniconda',
                  progfile=ctx.args.progress_file) as prog:
        download_file(url, 'miniconda.sh', prog.update,
                      ssl_verify=(not ctx.args.skip_ssl_verify))
    if (not ctx.args.no_checksum) and (checksum is not None):
        sha256('miniconda.sh', checksum)


def install_miniconda(ctx):
    """Downloads the miniconda/miniforge installer, and installs it to the
    destination directory.

    This function assumes that it is run within a temporary/scratch directory.
    """

    # We have been instructed to use an
    # existing miniconda installation
    if ctx.use_existing_base:
        return

    # Get information about the miniconda installer
    # from the manifest.
    metadata = ctx.miniconda_metadata
    output   = metadata.get('output', '').strip()

    if output == '': output = None
    else:            output = int(output)

    # The download_miniconda function saved
    # the installer to <pwd>/miniconda.sh
    printmsg('Installing miniconda at {}...'.format(ctx.basedir))
    cmd = 'bash miniconda.sh -b -p {}'.format(ctx.basedir)
    ctx.run(Process.monitor_progress, cmd, total=output,
            proglabel='install_miniconda',
            progfile=ctx.args.progress_file)

    # Avoid WSL filesystem issue
    # https://github.com/conda/conda/issues/9948
    cmd = 'find {} -type f -exec touch {{}} +'.format(ctx.basedir)
    ctx.run(Process.check_call, cmd)


def generate_condarc(fsldir,
                     channels,
                     skip_ssl_verify=False,
                     throttle_downloads=False,
                     pkgsdir=None):
    """Called by install_miniconda. Generates content for a .condarc file to
    be saved in $FSLDIR/.condarc. This file contains some default values, and
    also enforces some settings so that they cannot be overridden by the
    user. For example. the list of conda channels is configured so that it
    cannot be overridden by a user's ~/.condarc file.

    See the following web pages for more details:
     - https://docs.conda.io/projects/conda/en/latest/user-guide/configuration/use-condarc.html
     - https://www.anaconda.com/blog/conda-configuration-engine-power-users
     - https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-channels.html
    """

    # Create .condarc config file
    condarc = tw.dedent("""
    # FSL conda configuration file, auto-generated by the fslinstaller script.
    #
    # WARNING: This file may be automatically re-generated
    # without warning, so it is recommended that any custom
    # conda settings are stored elsewhere. Refer to the conda
    # documentation for more guidance:
    #
    # https://conda.io/projects/conda/en/latest/user-guide/configuration/use-condarc.html
    # https://www.anaconda.com/blog/conda-configuration-engine-power-users
    # https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-channels.html

    # Try and make package downloads more robust
    remote_read_timeout_secs:    240
    remote_connect_timeout_secs: 20
    remote_max_retries:          10
    remote_backoff_factor:       5
    safety_checks:               warn

    # Disable caching of remote channel repodata.
    # This is a hack which is combined with the
    # WSL1 filesystem hack in the fslinstaller
    # script - because we have modified file
    # timestamps, conda will assume that its
    # channel repodata cache is up to date, and
    # will not bother refreshing it in the
    # commands that we run in the install_fsl
    # function. When we remove the WSL1 hack from
    # the fslinstaller, we can remove this config
    # setting.
    # https://github.com/conda/conda/issues/9948
    local_repodata_ttl: 0

    # Channel priority is important. In older versions
    # of FSL we placed the FSL conda channel at the
    # bottom (lowest priority) for legacy reasons (to
    # ensure that conda-forge versions of e.g. VTK were
    # preferred over legacy FSL conda versions).
    #
    # Use final/top/bottom marks to prevent the channel
    # priority order being modified by user ~/.condarc
    # configuration files.
    channel_priority: strict #!final


    # Prevent conda from updating itself, as conda
    # can sometimes break itself by updating itself
    # in-place (see e.g.
    # https://github.com/conda/conda/issues/13920)
    auto_update_conda: false #!final
    """)

    # Fix the conda package cache
    # if a pkgsdir was provided
    if pkgsdir is not None:
        condarc += tw.dedent("""
        # Fix the package cache at $FSLDIR/pkgs/
        pkgs_dirs: #!final
        - {} #!top #!bottom
        """.format(pkgsdir))

    if skip_ssl_verify:
        printmsg('Configuring conda to skip SSL verification '
                 '- this is not recommended!', WARNING)
        condarc += tw.dedent("""
        # Disable SSL verification when accessing
        # conda channels over https:// (the
        # fslinstaller script was called with
        # --skip_ssl_verify). NOT RECOMMENDED.
        ssl_verify: false
        """)

    if throttle_downloads:
        condarc += tw.dedent("""
        # Limit number of simultaneous package
        # downloads - useful when installing
        # over an unreliable network connection.
        fetch_threads: 1
        """)

    channels = list(channels)
    if len(channels) > 0:
        channels[0]  += ' #!top'
        channels[-1] += ' #!bottom'
    condarc      += '\nchannels: #!final\n'
    for channel in channels:
        condarc += ' - {}\n'.format(channel)

    return condarc


def get_install_fsl_progress_reporting_method(ctx):
    """Figure out which reporting mechansim to use for reporting progress
    whilst FSL is being installed. The mechanism that is used has changed
    a few times.

    Returns a tuple containing values to pass to the Progress.monitor_progress
    function, either of which may be None if progress cannot be reported:

      - an integer value to pass as the total
      - a function to pass as the progfunc.
    """

    # We calculate installation progress in
    # one of a few ways, as we have changed
    # the mechanism a few times.  The
    # 'output/install' field in the manifest
    # gives us information about how to
    # report installation progress.
    progparams = ctx.build.get('output', {}).get('install', None)

    # The first method (version 1) involves
    # progress reporting by monitoring number of
    # lines of standard output produced by
    # "conda env update". This is set to None,
    # as it is the default behaviour of the
    # Progress.monitor_progress function.
    progress_v1 = None

    # The remaining methods involve counting
    # files and sizes in $FSLDIR/pkgs/

    # The second method involves progress
    # reporting by monitoring the number of
    # package files created in $FSLDIR/pkgs/
    # This coarsely reflects download
    # progress - when conda downloads a
    # package, it is saved into this directory.
    #
    # The third method involves progress
    # reporting by monitoring the number of
    # files created in $FSLDIR/pkgs/,
    # $FSLDIR/bin/ and $FSLDIR/lib/. Tracking
    # these three directories will cause the
    # progress to reflect both download and
    # installation
    #
    # The fourth method monitors download
    # progress in a more fine-grained manner,
    # by calculating the size of all .conda
    # and .tar.bz2 files in $FSLDIR/pkgs/.
    # This is combined with the number of
    # files saved to $FSLDIR/bin/ and
    # $FSLDIR/lib/
    pkgdir = op.join(ctx.basedir, 'pkgs')
    pkgdir = op.join(ctx.basedir, 'pkgs')
    bindir = op.join(ctx.destdir, 'bin')
    libdir = op.join(ctx.destdir, 'lib')

    def matchany(name, *filters):
        return any([fnmatch.fnmatch(name, f) for f in filters])

    def contents(dirname, *filters):
        if not op.exists(dirname):
            return []
        contents = os.listdir(dirname)
        contents = [f for f in contents if matchany(f, *filters)]
        return [op.join(dirname, f) for f in contents]

    start_pkgs  = contents(pkgdir, '*.conda', '*.bz2')
    start_sizes = sum([op.getsize(p) for p in start_pkgs])
    start_pkgs  = len(start_pkgs)
    start_bins  = len(contents(bindir))
    start_libs  = len(contents(libdir))

    def progress_v234(v, _):

        pkgs  = contents(pkgdir, '*.conda', '*.bz2')
        bins  = contents(bindir)
        libs  = contents(libdir)
        sizes = [op.getsize(p) for p in pkgs]
        pkgs  = len(pkgs)  - start_pkgs
        bins  = len(bins)  - start_bins
        libs  = len(libs)  - start_libs
        sizes = sum(sizes) - start_sizes

        if   v == 2: return pkgs
        elif v == 3: return pkgs  + bins + libs
        elif v == 4: return sizes + bins + libs
        else:        return None

    progresses    = {}
    progresses[1] =            progress_v1
    progresses[2] = ft.partial(progress_v234, 2)
    progresses[3] = ft.partial(progress_v234, 3)
    progresses[4] = ft.partial(progress_v234, 4)

    progval  = None
    progfunc = None

    # The output field may be either a
    # string, in which case we assume
    # version 2, or a dictionary containing
    # the progress reporting version, and
    # an integer value.
    if isstr(progparams):
        progval  = int(progparams)
        progfunc = progresses[2]

    # output field is a dict - versioned
    # progress reporting
    elif isinstance(progparams, dict):
        progver  = int(progparams['version'])
        progfunc = progresses[progver]
        progval  = progparams['value']

        # unsupported progress reporting version
        if progver > 4:
            progval  = None
            progfunc = None

        # version 4: progval is a dict
        # containing various quantities
        if progver == 4:
            progval = sum(progval.values())

        # older versions: progval is an integer
        elif progver:
            progval = int(progval)

    return progval, progfunc


def install_fsl(ctx):
    """Install FSL into ctx.destdir (which is assumed to be a miniconda
    installation.

    This function assumes that it is run within a temporary/scratch directory.
    """

    progval, progfunc = get_install_fsl_progress_reporting_method(ctx)

    # Generate .condarc which contains some default/
    # fixed conda settings.  We create $FSLDIR in
    # advance, and copy .condarc into it. Conda seems
    # to be ok with the directory already existing,
    # although I am concerned that this behaviour may
    # not be guaranteed.
    #
    # If this is a typical FSL installation (a self-
    # contained base miniconda environment) we fix
    # the package cache directory to isolate it from
    # other conda installations that may be on the
    # system.
    if ctx.destdir == ctx.basedir: pkgsdir = op.join(ctx.destdir, 'pkgs')
    else:                          pkgsdir = None

    condarc_contents = generate_condarc(ctx.destdir,
                                        ctx.environment_channels,
                                        ctx.args.skip_ssl_verify,
                                        ctx.args.throttle_downloads,
                                        pkgsdir)
    with open('.condarc', 'wt') as f:
        f.write(condarc_contents)

    cmds = ['mkdir -p {}'.format(ctx.destdir),
            'cp -f .condarc {}'.format(ctx.destdir)]
    for cmd in cmds:
        ctx.run(Process.check_call, cmd)

    # Are we updating an existing
    # env or creating a new env?
    if ctx.destdir == ctx.basedir: cmd = 'update'
    else:                          cmd = 'create'

    # We install FSL simply by running conda
    # env [update|create] -f env.yml.
    cmd = (ctx.conda + ' env ' + cmd +
           ' -p ' + ctx.destdir      +
           ' -f ' + ctx.environment_file)

    # Make conda/mamba super verbose if the
    # hidden --debug option was specified.
    if ctx.args.debug:
        cmd += ' -v -v -v'

    printmsg('Installing FSL into {}...'.format(ctx.destdir))

    # Temporarily install a logging handler which
    # records any stdout/stderr messages emitted
    # by the conda command that contain phrases
    # indicating that the installation failed due
    # to a network error.
    err_patterns = ['Connection broken',
                    'Download error',
                    'NewConnectionError']

    with LogRecordingHandler(err_patterns) as hd:

        # If the installation fails for what appears
        # to have been a network error, retry it
        # according to --num_retries. Conda>=23.11.0
        # will resume failed package downloads, so
        # we can just re-run e.g. conda command to
        # resume.
        #
        # Tell the retry_on_error function to retry
        # if conda emitted any messages matching the
        # patterns above
        err_message = 'Installation failed!'
        def retry_install(e):
            logmsgs = hd.records()
            hd.clear()
            return len(logmsgs) > 0

        retry_on_error(ctx.run, ctx.args.num_retries, Process.monitor_progress,
                       cmd, timeout=2, total=progval, progfunc=progfunc,
                       proglabel='install_fsl', progfile=ctx.args.progress_file,
                       retry_error_message=err_message,
                       retry_condition=retry_install)


@warn_on_error('WARNING: The installation succeeded, but an error occurred '
               'while creating $FSLDIR/etc/fslversion! There may be more '
               'information in the log file.', WARNING, EMPHASIS)
def finalise_installation(ctx):
    """Performs some finalisation tasks. Includes:
      - Saving the installed version to $FSLDIR/etc/fslversion
      - Saving this installer script and the environment file to
        $FSLDIR/etc/
    """

    with open('fslversion', 'wt') as f:
        f.write(ctx.build['version'])

    etcdir = op.join(ctx.destdir, 'etc')
    cmds   = [
        'cp fslversion {}' .format(etcdir),
        'cp {} {}'         .format(ctx.environment_file, etcdir)]

    for cmd in cmds:
        ctx.run(Process.check_call, cmd)


@warn_on_error('WARNING: The installation succeeded, but an error occurred '
               'while removing intermediate package files! There may be more '
               'information in the log file.', WARNING, EMPHASIS)
def post_install_cleanup(ctx, tmpdir):
    """Cleans up the FSL directory after installation. """

    cmds = [ctx.conda + ' clean -y --all']

    if tmpdir is not None:
        cmds.append('rm -rf ' + tmpdir)

    for cmd in cmds:
        ctx.run(Process.check_call, cmd)


@warn_on_error('WARNING: ', WARNING, EMPHASIS, toscreen=False)
def register_installation(ctx):
    """Gathers and sends some basic system details to the FSL registration
    website.
    """

    if ctx.args.skip_registration:
        return

    regurl = ctx.registration_url
    if regurl is None:
        return

    system = platform.system().lower()
    uname  = Process.check_output('uname -a', check=False)
    osinfo = ''

    # macOS
    if system == 'darwin':
        osinfo = Process.check_output('sw_vers', check=False)

    # Linux
    else:
        for releasefile in glob.glob(op.join('/etc/*-release')):
            with open(releasefile, 'rt') as f:
                osinfo = f.read().strip()
            break

        # WSL
        if 'microsoft' in uname.lower():
            osinfo += '\n\n' + Process.check_output('wsl.exe -v', check=False)

    info = {
        'timestamp'      : timestamp(),
        'architecture'   : platform.machine(),
        'os'             : system,
        'os_info'        : osinfo,
        'uname'          : uname,
        'python_version' : platform.python_version(),
        'python_info'    : sys.version,
        'fsl_version'    : ctx.build['version'],
        'fsl_platform'   : ctx.build['platform'],
    }

    printmsg('Registering installation with {}'.format(regurl))

    post_request(regurl, data=info)


def patch_file(filename, searchline, numlines, content):
    """Used by configure_shell and configure_matlab. Adds to, modifies,
    or creates the specified file.

    If a line matching searchline is found in the file, numlines (starting
    from searchline) are replaced with content.

    Otherwise, content is appended to the end of the file.
    """

    content = content.split('\n')

    if op.isfile(filename):
        with open(filename) as f:
            lines = [l.strip() for l in f.readlines()]
    else:
        lines = []

    # replace block
    try:
        idx   = lines.index(searchline)
        lines = lines[:idx] + content + lines[idx + numlines:]

    # append to end
    except ValueError:
        lines = lines + [''] + content + ['']

    with open(filename, 'wt') as f:
        f.write('\n'.join(lines))


def configure_shell(shell, homedir, fsldir):
    """Configures the user's shell environment (e.g. ~/.bash_profile).

    :arg shell:   User's shell (taken from the $SHELL environment variable
    :arg homedir: User's home directory, presumed to contain shell profile
                  file(s).
    :arg fsldir:  FSL installation directory
    """

    bourne_shells  = ['sh', 'bash', 'zsh', 'dash']
    csh_shells     = ['csh', 'tcsh']

    # we edit the first file that exists in
    # the list of candidate profile files.
    # They are attached as an attribute of
    # this function just for testing purposes
    # (see after function definition)
    shell_profiles = configure_shell.shell_profiles

    # DO NOT CHANGE the format of these configurations -
    # they are kept exactly as-is for compatibility with
    # legacy FSL installations, i.e. so we can modify
    # profiles with an existing configuration from older
    # FSL versions
    bourne_cfg = tw.dedent("""
    # FSL Setup
    FSLDIR={fsldir}
    PATH=${{FSLDIR}}/share/fsl/bin:${{PATH}}
    export FSLDIR PATH
    . ${{FSLDIR}}/etc/fslconf/fsl.sh
    """).format(fsldir=fsldir).strip()

    csh_cfg = tw.dedent("""
    # FSL Setup
    setenv FSLDIR {fsldir}
    setenv PATH ${{FSLDIR}}/share/fsl/bin:${{PATH}}
    source ${{FSLDIR}}/etc/fslconf/fsl.csh
    """).format(fsldir=fsldir).strip()

    if shell not in bourne_shells + csh_shells:
        printmsg('Shell {} not recognised - skipping environment '
                 'setup'.format(shell), WARNING, EMPHASIS)
        return

    if shell in bourne_shells: cfg = bourne_cfg
    else:                      cfg = csh_cfg

    # find the profile file to edit
    profile    = None
    candidates = [op.join(homedir, p)
                  for p in shell_profiles[shell]]
    for candidate in candidates:
        if op.isfile(candidate):
            profile = candidate
            break

    # if no candidate profile files
    # exist, fall back to the first one
    if profile is None:
        profile = candidates[0]

    printmsg('Adding FSL configuration to {}'.format(profile))

    patch_file(profile, '# FSL Setup', len(cfg.split('\n')), cfg)
configure_shell.shell_profiles = {'sh'   : ['.profile'],
                                  'ksh'  : ['.profile'],
                                  'bash' : ['.bash_profile', '.profile'],
                                  'dash' : ['.bash_profile', '.profile'],
                                  'zsh'  : ['.zprofile'],
                                  'csh'  : ['.cshrc'],
                                  'tcsh' : ['.tcshrc']}


def configure_matlab(homedir, fsldir):
    """Creates/appends FSL configuration code to ~/Documents/MATLAB/startup.m.
    """

    # DO NOT CHANGE the format of this configuration -
    # see in-line comments in configure_shell.
    cfg = tw.dedent("""
    % FSL Setup
    setenv( 'FSLDIR', '{fsldir}' );
    setenv('FSLOUTPUTTYPE', 'NIFTI_GZ');
    fsldir = getenv('FSLDIR');
    fsldirmpath = sprintf('%s/etc/matlab',fsldir);
    path(path, fsldirmpath);
    clear fsldir fsldirmpath;
    """).format(fsldir=fsldir).strip()

    matlab_dir = op.expanduser(op.join(homedir, 'Documents', 'MATLAB'))
    startup_m  = op.join(matlab_dir, 'startup.m')

    if not op.exists(matlab_dir):
        os.makedirs(matlab_dir)

    printmsg('Adding FSL configuration to {}'.format(startup_m))

    patch_file(startup_m, '% FSL Setup', len(cfg.split('\n')), cfg)


def self_update(manifest, workdir, checksum, **kwargs):
    """Checks to see if a newer version of the installer (this script) is
    available and if so, downloads it to a temporary file, and runs it in
    place of this script.
    """

    thisver   = Version(__version__)
    latestver = Version(manifest['installer']['version'])

    if latestver <= thisver:
        log.debug('Installer is up to date (this version: %s, '
                  'latest version: %s)', thisver, latestver)
        return

    log.debug('New version of installer is available '
              '(%s) - self-updating', latestver)

    tmpf = tempfile.NamedTemporaryFile(
        prefix='new_fslinstaller', delete=False, dir=workdir)
    tmpf.close()
    tmpf = tmpf.name

    download_file(manifest['installer']['url'], tmpf, **kwargs)

    if checksum:
        try:
            sha256(tmpf, manifest['installer']['sha256'])
        except Exception as e:
            printmsg('New installer file does not match expected '
                     'checksum! Skipping update.', WARNING)
            return

    # Don't try and update again - if for some
    # reason the online manifest reports a newer
    # version than what is available, we would
    # otherwise enter into an infinite loop.
    cmd = [sys.executable, tmpf] + sys.argv[1:] + ['--no_self_update']
    log.debug('Running new installer: %s', cmd)
    os.execv(sys.executable, cmd)


def overwrite_destdir(ctx):
    """Called by main to handle when the destination directory already exists.
    Asks the user if they want to overwrite it. If they do, or if the
    --overwrite option was specified, the directory is moved, and then deleted
    after the installation succeeds.

    This function assumes that it is run within a temporary/scratch directory.
    """

    # there is no existing installation,
    # so there is nothing to worry about
    if not op.exists(ctx.destdir):
        return

    # We have been instructed to install
    # into an existing [mini]conda environment
    if ctx.use_existing_base and (ctx.basedir == ctx.destdir):
        return

    if not ctx.args.overwrite:
        printmsg('\nDestination directory [{}] already exists!\n'
                 .format(ctx.destdir), WARNING, EMPHASIS)
        response = prompt('Do you want to overwrite it [y/N]?',
                          QUESTION, EMPHASIS)
        if response.lower() not in ('y', 'yes'):
            printmsg('Aborting installation', ERROR, EMPHASIS)
            sys.exit(1)

    # generate a unique name for the old
    # destination directory (to avoid
    # collisions if using the same workdir
    # repeatedly)
    i = 0
    while True:
        ctx.old_destdir = op.abspath('old_destdir{}'.format(i))
        i              += 1
        if not op.exists(ctx.old_destdir):
            break

    printmsg('Deleting directory {}'.format(ctx.destdir), IMPORTANT)
    ctx.run(Process.check_call,
            'mv {} {}'.format(ctx.destdir, ctx.old_destdir))


def parse_args(argv=None, include=None, parser=None):
    """Parse command-line arguments, returns an argparse.Namespace object.

    :arg argv:    Command-line arguments.

    :arg include: List of arguments to parse. May be used by other scripts
                  which re-use some of the routines defined in this script.
                  The resulting argparse.Namespace object will contain values
                  of None for all arguments that are not included.

    :arg parser:  `argparse.ArgumentParser` to configure. If not provided,
                  one is created.
    """

    if parser is None:
        parser = argparse.ArgumentParser()

    uid = os.getuid()

    if uid != 0: destdir = DEFAULT_INSTALLATION_DIRECTORY
    else:        destdir = DEFAULT_ROOT_INSTALLATION_DIRECTORY

    # on macOS, when Python is run with sudo,
    # op.expanduser('~') will return the
    # calling user's home directory, and not
    # the root home directory. This doesn't
    # really matter, as homedir is only used
    # for modifying the shell/matlab profile,
    # and this is automatically disabled via
    # the --no_env option when run as root. But
    # in case the user wants the root shell
    # profile modified (via the hidden
    # --root_env option), we use getpwuid to
    # determine the appropriate home directory.
    homedir = pwd.getpwuid(uid).pw_dir

    username = os.environ.get('FSLCONDA_USERNAME', None)
    password = os.environ.get('FSLCONDA_PASSWORD', None)

    options = {
        # regular options
        'version'           : ('-v', {'action'  : 'version',
                                      'version' : __version__}),
        'dest'              : ('-d', {'metavar' : 'DESTDIR'}),
        'overwrite'         : ('-o', {'action'  : 'store_true'}),
        'listversions'      : ('-l', {'action'  : 'store_true'}),
        'no_env'            : ('-n', {'action'  : 'store_true'}),
        'no_shell'          : ('-s', {'action'  : 'store_true'}),
        'no_matlab'         : ('-m', {'action'  : 'store_true'}),
        'skip_registration' : ('-r', {'action'  : 'store_true'}),
        'fslversion'        : ('-V', {'default' : 'latest'}),

        # hidden options
        'skip_ssl_verify'    : (None, {'action'  : 'store_true'}),
        'throttle_downloads' : (None, {'action'  : 'store_true'}),
        'num_retries'        : (None, {'type'    : int,
                                       'default' : 3}),
        'debug'              : (None, {'action'  : 'store_true'}),
        'logfile'            : (None, {}),
        'username'           : (None, {'default' : username}),
        'password'           : (None, {'default' : password}),
        'no_checksum'        : (None, {'action'  : 'store_true'}),
        'workdir'            : (None, {}),
        'homedir'            : (None, {'default' : homedir}),
        'devrelease'         : (None, {'action'  : 'store_true'}),
        'devlatest'          : (None, {'action'  : 'store_true'}),
        'manifest'           : (None, {}),
        'miniconda'          : (None, {}),
        'conda'              : (None, {'action'  : 'store_true'}),
        'no_self_update'     : (None, {'action'  : 'store_true'}),
        'exclude_package'    : (None, {'action'  : 'append'}),
        'root_env'           : (None, {'action'  : 'store_true'}),
        'progress_file'      : (None, {}),
    }

    if include is None:
        include = list(options.keys())

    helps = {
        'version'           : 'Print installer version number and exit.',
        'listversions'      : 'List available FSL versions and exit.',
        'dest'              : 'Install FSL into this folder (default: '
                              '{}).'.format(destdir),
        'overwrite'         : 'Delete existing destination directory if it '
                              'exists, without asking.',
        'no_env'            : 'Do not modify your shell or MATLAB configuration '
                              '(implies --no_shell and --no_matlab). When '
                              'running the installer script as the root user, '
                              'the root shell profile is never modified.',
        'no_shell'          : 'Do not modify your shell configuration.',
        'no_matlab'         : 'Do not modify your MATLAB configuration.',
        'skip_registration' : 'Do not register this installation with the '
                              'FSL development team.',
        'fslversion'        : 'Install this specific version of FSL.',

        # Configure conda to skip SSL verification.
        # Not recommended.
        'skip_ssl_verify' : argparse.SUPPRESS,

        # Limit the number of simultaneous package
        # downloads - may be needed when installing
        # over unreliable network connection.
        'throttle_downloads' : argparse.SUPPRESS,

        # Number of times to re-try a failed
        # installation, if it appears that
        # the installation failed due to a
        # download error.
        'num_retries' : argparse.SUPPRESS,

        # Enable verbose output when calling
        # mamba/conda.
        'debug' : argparse.SUPPRESS,

        # Direct the installer log to this file
        # (default: file in $TMPDIR)
        'logfile' : argparse.SUPPRESS,

        # Username / password for accessing
        # internal FSL conda channel, if an
        # internal/development release is being
        # installed. If not set, will be read from
        # FSLCONDA_USERNAME/FSLCONDA_PASSWORD
        # environment variables.
        'username' : argparse.SUPPRESS,
        'password' : argparse.SUPPRESS,

        # Do not automatically update the installer script,
        'no_self_update' : argparse.SUPPRESS,

        # Install a development release. This
        # option will cause the installer to
        # download the devrelreases.txt file,
        # which contains a list of available
        # internal/development manifests. The
        # user will be prompted to choose one,
        # which will be propagated on to the
        # --manifest option. If --devlatest
        # is used, the most recent developmet
        # release is automatically selected.
        'devrelease' : argparse.SUPPRESS,
        'devlatest' : argparse.SUPPRESS,

        # Path/URL to alternative FSL release
        # manifest.
        'manifest' : argparse.SUPPRESS,

        # Install miniconda from this path/URL,
        # instead of the one specified in the
        # FSL release manifest.
        #
        # For example - to download/install a
        # conda base environment and install FSL
        # packages into the base environment,
        # pass a URL or path to a miniconda
        # installer:
        #
        #   fslinstaller.py --miniconda https://path/to/miniconda.sh
        #   fslinstaller.py --miniconda ~/Downloads/miniconda.sh
        #
        # Alternatively, pass the directory of
        # an existing [mini]conda installation
        # to use that - for example, if a conda
        # base environment has already been
        # created at ~/fsl/, to install FSL into
        # that base environment:
        #
        #   fslinstaller.py --miniconda ~/fsl/
        #
        # Or to use an existing [mini]conda
        # installation, and create FSL as a
        # child environment, just set the
        # destination directory to a
        # different path, e.g.:
        #
        #   fslinstaller.py --miniconda ~/miniconda3/ -d ~/fsl/
        'miniconda' : argparse.SUPPRESS,

        # Use conda and not mamba
        'conda' : argparse.SUPPRESS,

        # Disable SHA256 checksum validation
        # of downloaded files
        'no_checksum' : argparse.SUPPRESS,

        # Store temp files in this directory
        # rather than in a temporary directory
        'workdir' : argparse.SUPPRESS,

        # Treat this directory as user's home
        # directory, for the purposes of shell
        # configuration. Must already exist.
        'homedir' : argparse.SUPPRESS,

        # Do not install packages matching this
        # fnmatch-style wildcard pattern. Can
        # be used multiple times.
        'exclude_package' : argparse.SUPPRESS,

        # If the installer is run as root, the
        # --no_env flag is automatically enabled
        # UNLESS this flag is also provided.
        'root_env' : argparse.SUPPRESS,

        # File to send progress information to.
        'progress_file' : argparse.SUPPRESS,
    }

    # parse args
    for option in include:
        shortflag, kwargs = options[option]
        flags             = ['--{}'.format(option)]
        if shortflag is not None:
            flags.insert(0, shortflag)
        parser.add_argument(*flags, help=helps[option], **kwargs)

    # parse_known_args so that newly added
    # args are ignored by older versions,
    # but will be parsed after self_update
    args = parser.parse_known_args(argv)[0]

    if getattr(args, 'fslversion', 'latest') != 'latest':
        if Version(args.fslversion) < Version('6.0.6'):
            printmsg(
                'This script can only be used to install FSL 6.0.6 or newer. '
                'Visit https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslInstallation '
                'for information on installing older versions.', ERROR,
                EMPHASIS)
            sys.exit(1)

    # add placeholder values for excluded args
    for option in options.keys():
        if option not in include:
            setattr(args, option, None)

    # alternate home dir (for debugging)
    if args.homedir is not None:
        args.homedir = op.abspath(args.homedir)
        if not op.isdir(args.homedir):
            printmsg('Home directory {} does not exist!'.format(args.homedir),
                     ERROR, EMPHASIS)
            sys.exit(1)

    # --no-env is automatically enabled
    #  when installer is run as root
    if os.getuid() == 0 and not (args.root_env):
        args.no_env = True

    # don't modify shell profile
    if args.no_env:
        args.no_shell  = True
        args.no_matlab = True

    # use workdir rather than a tempdir
    if args.workdir is not None:
        args.workdir = op.abspath(args.workdir)
        if not op.exists(args.workdir):
            os.mkdir(args.workdir)

    # manifest takes priority over devrelease/devlatest
    if args.manifest is not None:
        args.devrelease = False
        args.devlatest  = False

    if args.manifest is None:
        args.manifest = FSL_RELEASE_MANIFEST

    if args.devlatest:
        args.devrelease = True

    if args.exclude_package is None:
        args.exclude_package = []

    if args.logfile is not None:
        args.logfile = op.abspath(args.logfile)
    if args.progress_file is not None:
        args.progress_file = op.abspath(args.progress_file)

    # accept local path for manifest and environment
    if args.manifest is not None:
        args.manifest = op.expanduser(args.manifest)
        if op.exists(args.manifest):
            args.manifest = op.abspath(args.manifest)

    # accept local path for miniconda installer, or
    # path to existing miniconda installation
    if args.miniconda is not None:
        args.miniconda = op.expanduser(args.miniconda)
        if op.exists(args.miniconda):
            args.miniconda = op.abspath(args.miniconda)

    return args


def config_logging(prefix='fslinstaller_', logdir=None, logfile=None):
    """Configures logging. If a logfile is not specified, log messages are
    directed to $TMPDIR/fslinstaller_<unique_token>.log, or
    logdir/fslinstaller_<unique_token>.log
    """

    if logfile is None:
        if logdir is None:
            logdir = tempfile.gettempdir()

        # Use a unique name for the log file
        # (important for multi-user systems)
        logfilef, logfile = tempfile.mkstemp(prefix=prefix,
                                             suffix='.log',
                                             dir=logdir)
        os.close(logfilef)

    handler   = logging.FileHandler(logfile)
    formatter = logging.Formatter(
        '%(asctime)s %(filename)s:%(lineno)4d: %(message)s', '%H:%M:%S')
    handler.setFormatter(formatter)
    log.addHandler(handler)
    log.setLevel(logging.DEBUG)

    return logfile


@contextlib.contextmanager
def handle_error(ctx):
    """Used by main as a context manager around the main installation steps.
    If an error occurs, prints some messages, performs some clean-up/
    restoration tasks, and exits.
    """

    try:
        yield

    except Exception as e:
        printmsg('\nERROR occurred during installation!', ERROR, EMPHASIS)
        printmsg('    {}\n'.format(e), INFO)

        # send traceback to log file
        tb = traceback.format_tb(sys.exc_info()[2])
        log.debug(''.join(tb))

        # send env to logfile
        log.debug('Environment variables:')
        for k, v in os.environ.items():
            log.debug('{}={}'.format(k, v))

        if op.exists(ctx.destdir):
            printmsg('Removing failed installation directory '
                     '{}'.format(ctx.destdir), WARNING)
            ctx.run(Process.check_call, 'rm -r ' + ctx.destdir)

        # overwrite_destdir moves the existing
        # destdir to a temp location, so we can
        # restore it if the installation fails
        if not op.exists(ctx.destdir) and (ctx.old_destdir is not None):
            printmsg('Restoring contents of {}'.format(ctx.destdir),
                     WARNING)
            ctx.run(Process.check_call,
                    'mv {} {}'.format(ctx.old_destdir, ctx.destdir))

        # copy log file to ~/ so it is
        # easier for the user to access
        date    = datetime.datetime.today().strftime('%Y%m%d%H%M%S')
        logfile = 'fsl_installation_{}.log'.format(date)
        logfile = op.join(op.expanduser('~'), logfile)
        shutil.copy(ctx.logfile, logfile)

        printmsg('\nFSL installation failed!\n', ERROR, EMPHASIS)
        printmsg('Please check the log file - it may contain some '
                 'more information to help you diagnose the problem: '
                 '{}\n'.format(logfile), WARNING, EMPHASIS)
        sys.exit(1)


def main(argv=None):
    """Installer entry point. Downloads and installs miniconda and FSL, and
    configures the user's environment.
    """

    printmsg('FSL installer version:', EMPHASIS, UNDERLINE, end='')
    printmsg(' {}'.format(__version__))
    printmsg('Press CTRL+C at any time to cancel installation', INFO)

    if os.getuid() == 0:
        printmsg('Running the installer script as root user is discouraged! '
                 'You should run this script as a regular user - you will be '
                 'asked for your administrator password if required.',
                 WARNING, EMPHASIS)

    args    = parse_args(argv)
    logfile = config_logging(logdir=args.workdir, logfile=args.logfile)

    log.debug(' '.join(sys.argv))
    log.debug('Python: %s', sys.executable)
    printmsg('Installation log file: {}\n'.format(logfile), INFO)

    ctx         = Context(args)
    ctx.logfile = logfile

    if not args.no_self_update:
        self_update(ctx.manifest, args.workdir, not args.no_checksum,
                    ssl_verify=(not args.skip_ssl_verify))

    if args.listversions:
        list_available_versions(ctx.manifest)
        sys.exit(0)

    agree_to_license(ctx)

    if (not args.skip_registration) and (ctx.registration_url is not None):
        printmsg('During the installation process, please note that some '
                 'system details will be automatically sent to the FSL '
                 'development team. These details are extremely basic and '
                 'cannot be used in any way to identify individual users. If '
                 'you do not want any information to be sent, please cancel '
                 'this installation by pressing CTRL+C, and re-run the '
                 'installer with the --skip_registration option.\n', INFO)

    try:
        ctx.finalise_settings()
    except Exception as e:
        printmsg('An error has occurred: {}'.format(e), ERROR)
        sys.exit(1)

    check_rosetta_status(ctx)

    # Do everything in a temporary directory,
    # but don't delete it, as some operations
    # may be run as root. The tempdir is
    # deleted within the post_install_cleanup
    # function.
    with tempdir(args.workdir, delete=False) as tmpdir:

        if args.workdir is not None:
            tmpdir = None

        # Ask the user if they want to overwrite
        # an existing installation
        overwrite_destdir(ctx)

        download_fsl_environment(ctx)

        printmsg('\nInstalling FSL in {}\n'.format(ctx.destdir), EMPHASIS)
        with handle_error(ctx):
            download_miniconda(ctx)
            install_miniconda(ctx)
            install_fsl(ctx)
            finalise_installation(ctx)
            post_install_cleanup(ctx, tmpdir)
            register_installation(ctx)

    if not args.no_shell:
        configure_shell(ctx.shell, args.homedir, ctx.destdir)
    if not args.no_matlab:
        configure_matlab(args.homedir, ctx.destdir)

    printmsg('\nFSL successfully installed\n', IMPORTANT)
    if not args.no_shell:
        printmsg('Open a new terminal, or log out and log back in, '
                 'for the environment changes to take effect.', INFO)


if __name__ == '__main__':
    sys.exit(main())
