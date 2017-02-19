from gmusicapi import Mobileclient
import curses as crs
from configparser import ConfigParser
from os.path import expanduser, isfile, join
from time import sleep


api = Mobileclient()  # Our interface to Google Music.


def addstr(win, string):
    """
    Replace the contents of a window with a new string.
      Not for anything where position matters.

    Arguments:
    win: Window on which to display the string.
    string: String to be displayed.
    """
    win.erase()
    win.addstr(trunc(string, win.getmaxyx()[1]))
    win.refresh()


def error_msg(win, msg):
    """
    Displays an error message.

    Arguments:
    win: Window on which to display the message.
    msg: Message to be displayed.
    """
    addstr(win, 'Error: ' + msg + ' Enter \'h\' or \'help\' for help.')


def hex_to_rgb(hex):
    """
    Convert a hex colour to (r, g, b).
23
    Arguments:
    hex: hexidecimal colour code.

    Returns: (r, g, b) tuple with values 0-1000.
    """
    scalar = 3.9215  # 255 * 3.9215 ~= 1000.
    r = int(int(hex[1:3], 16) * scalar)
    g = int(int(hex[3:5], 16) * scalar)
    b = int(int(hex[5:7], 16) * scalar)

    return r, g, b


def initialize():
    """
    Initialize the windows, read the config, login, and set colours.

    Returns: Whether or not colours are enabled, and curses windows.
    """
    main = crs.initscr()  # Forthe bulk of output.
    main.resize(crs.LINES-3, crs.COLS)
    inbar = crs.newwin(1, crs.COLS, crs.LINES-1, 0)  # For user input.
    infobar = crs.newwin(1, crs.COLS, crs.LINES-2, 0)  # For 'now playing'.
    outbar = crs.newwin(1, crs.COLS, crs.LINES-3, 0)  # For hints and notices.
    crs.curs_set(0)  # Hide the cursor.

    config = read_config(outbar)

    # Set colours.
    if 'colour' in config:
        crs.start_color()
        init_colours(outbar, config['colour'])
        main.bkgdset(' ', crs.color_pair(1))
        inbar.bkgdset(' ', crs.color_pair(1))
        infobar.bkgdset(' ', crs.color_pair(2))
        outbar.bkgdset(' ', crs.color_pair(4))

    main.addstr(5, int(crs.COLS/2) - 9, 'Welcome to pmcli!')
    main.refresh()

    # Log in to Google Play Music.
    addstr(outbar, 'Logging in...')
    login(outbar, config['user'])

    return 'colour' in config, main, inbar, infobar, outbar


def init_colours(win, colours):
    """Set curses colours."""
    try:
        crs.init_color(0, *hex_to_rgb(colours['background']))
        crs.init_color(1, *hex_to_rgb(colours['foreground']))
        crs.init_color(2, *hex_to_rgb(colours['highlight']))
        crs.init_color(3, *hex_to_rgb(colours['content1']))
        crs.init_color(4, *hex_to_rgb(colours['content2']))

    except KeyError:
        addstr(win, 'Config file is missing one or more colours: Exiting.')
        leave(2)

    crs.init_pair(1, 1, 0)
    crs.init_pair(2, 2, 0)
    crs.init_pair(3, 3, 0)
    crs.init_pair(4, 4, 0)


def leave(s):
    """
    Exit gracefully.

    Arguments:
    s: Quit after s seconds.
    """
    sleep(s)
    crs.curs_set(1)
    crs.endwin()
    quit()


def login(win, user):
    """
    Log in to Google Play Music.

    Arguments:
    win: Window on which to display output.
    """
    try:
        if not api.login(
                user['email'], user['password'], user['deviceid']
        ):  # Login failed;
            addstr(win, 'Login failed: Exiting.')
            leave(2)

    except KeyError:  # Invalid config file.
        addstr(win, 'Config file is missing one or more fields: Exiting.')
        leave(2)

    addstr(win, 'Logged in as %s.' % user['email'])  # Login succeeded.


def measure_fields(width):
    """
    Determine max number of  characters and starting point for category fields.

    Arguments:
    width: Width of the window being divided.

    Returns: A tuple containing character allocations and start positions.
    """
    padding = 1  # Space between fields.
    index_chars = 3  # Characters to allocate for index..
    # Width of each field.
    name_chars = artist_chars = album_chars = int(
        (width - index_chars - 3*padding)/3
    )

    total = sum([index_chars, name_chars, artist_chars,
                 album_chars, 3*padding])

    if total != width:  # Allocate any leftover space to name.
        name_chars += width - total

    # Field starting x positions.
    name_start = 0 + index_chars + padding
    artist_start = name_start + name_chars + padding
    album_start = artist_start + artist_chars + padding

    return (index_chars, name_chars, artist_chars, album_chars,
            name_start, artist_start, album_start)


def read_config(win):
    """
    Parses a config file for login information.
      Config file should be located at '~/.config/pmcli/config'
      with a section called [auth] containing email, password, and deviceid.

    Arguments:
    win: Window on which to display output.

    Returns: A dict containing keys 'email', 'password', and 'deviceid'.
    """
    parser = ConfigParser()
    config = join(expanduser('~'), '.config', 'pmcli', 'config')

    if not isfile(config):
        addstr(win, 'Config file not found at %s: Exiting.' % config)
        leave(2)

    parser.read(config)
    config = {}

    config['user'] = {}
    try:
        for key in parser['auth']:  # Read login information.
            config['user'][key] = parser['auth'][key]

    except KeyError:  # Invalid config file.
        addstr(win, 'Config file is missing [auth] section: Exiting.')
        leave(2)

    try:
        colour = parser['colour']['enable'] == 'yes'

    except KeyError:
        colour = False

    if colour:
        config['colour'] = {}
        for key in parser['colour']:  # Read colour information.
            if key != 'enable':
                config['colour'][key] = parser['colour'][key]

    return config


def to_string(item):
    """
    Formats a MusicObject's information into a string.

    Arguments:
    item: MusicObject to be formatted.

    Returns: Formatted string.
    """
    if item['kind'] == 'song':
        return ' - '.join((item['name'], item['artist']))
    if item['kind'] == 'artist':
        return item['name']
    if item['kind'] == 'album':
        return ' - '.join((item['name'], item['artist']))

    return str(item)


def time_from_ms(ms):
    """
    Converts milliseconds into mm:ss formatted string.

    Arguments:
    ms: Number of milliseconds.

    Returns: ms in mm:ss.
    """
    ms = int(ms)
    minutes = str(ms // 60000).zfill(2)
    seconds = str(ms // 1000 % 60).zfill(2)
    return "%s:%s" % (minutes, seconds)


def trunc(string, chars):
    """
    Pads a string with '...' if it is too long to fit in a window.

    Arguments:
    string: String to be truncated.
    chars: Max length for the string.

    Returns: The original string if it is short enough to be displayed,
      otherwise the string truncated and padded with '...'.
    """
    if chars < 0 or len(string) <= chars:
        return string
    else:
        return string[:-((len(string) - chars) + 3)] + '...'
