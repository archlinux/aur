#!/usr/bin/env python3

import curses as crs
from os.path import exists, expanduser, join, isfile
import json
from music_objects import Song, Artist, Album, Queue
from util import (
    addstr, to_string, leave, measure_fields, trunc, error_msg, initialize, api
)
import warnings

warnings.filterwarnings("ignore")  # Todo: Something better.


def transition(input):
    """
    Route input to the appropriate function.

    Arguments:
    input: User input.
    """
    commands = {
        'h': help,
        'help': help,
        'e': expand,
        'expand': expand,
        's': search,
        'search': search,
        'p': play,
        'play': play,
        'q': enqueue,
        'queue': enqueue,
        'w': write,
        'write': write,
        'r': restore,
        'restore': restore,
    }

    arg = None
    if content is None:
        addstr(infobar, 'Now playing: None')

    try:
        command, arg = input.split(maxsplit=1)

    except ValueError:
        command = input

    if command in commands:
        commands[command](arg)
        if content is not None:
            display()

    else:
        error_msg(outbar, 'Nonexistent command.')


def get_input():
    """Get user input in the bottom bar."""
    addstr(inbar, '> ')
    crs.curs_set(2)  # Show the cursor.

    try:
        input = inbar.getstr()

    except KeyboardInterrupt:
        addstr(outbar, 'Goodbye, thanks for using pmcli!')
        leave(1)

    inbar.deleteln()
    crs.curs_set(0)  # Hide the cursor.

    return input.decode('utf-8')


def get_option(num, limit=-1):
    """
    Select a numbered MusicObject from the main window

    Arguments:
    num: Index of the MusicObject in the main window to be returned.

    Keyword argumnents:
    limit=-1: Number of songs to generate for artists,
      determined by terminal height.

    Returns: The MusicObject at index 'num'.
    """
    if num < 0 or num > sum([len(content[k]) for k in content.keys()]):
        return None  # num out of range.
    i = 1

    for key in ('songs', 'artists', 'albums'):  # Hardcoded to guarantee order.
        for item in content[key]:
            if i == num:
                return item.fill(limit)  # Always return item with all content.
            else:
                i += 1

    return None


def display():
    """Update the main window with some content."""
    main.erase()
    y, i = 0, 1  # y coordinate in main window, current item index.
    (index_chars, name_chars, artist_chars, album_chars, name_start,
     artist_start, album_start) = measure_fields(main.getmaxyx()[1])

    if 'songs' in content and content['songs']:  # Write songs header.
        main.addstr(y, 0, '#', crs.color_pair(2)
                    if colour else crs.A_UNDERLINE)
        main.addstr(y, name_start, trunc('Title', name_chars),
                    crs.color_pair(2) if colour else crs.A_UNDERLINE)
        main.addstr(y, artist_start, trunc('Artist', artist_chars),
                    crs.color_pair(2) if colour else crs.A_UNDERLINE)
        main.addstr(y, album_start, trunc('Album', album_chars),
                    crs.color_pair(2) if colour else crs.A_UNDERLINE)
        y += 1

        for song in content['songs']:  # Write each song.
            main.addstr(y, 0, str(i).zfill(2),
                        crs.color_pair(3 if y % 2 == 0 else 4)
                        if colour else 0)
            main.addstr(y, name_start, trunc(song['name'], name_chars),
                        crs.color_pair(3 if y % 2 == 0 else 4)
                        if colour else 0)
            main.addstr(y, artist_start, trunc(song['artist'], artist_chars),
                        crs.color_pair(3 if y % 2 == 0 else 4)
                        if colour else 0)
            main.addstr(y, album_start, trunc(song['album'], album_chars),
                        crs.color_pair(3 if y % 2 == 0 else 4)
                        if colour else 0)
            y += 1
            i += 1

    if 'artists' in content and content['artists']:  # Write artists header.
        main.addstr(y, 0, '#', crs.color_pair(2)
                    if colour else crs.A_UNDERLINE)
        main.addstr(y, name_start, trunc('Artist', name_chars),
                    crs.color_pair(2) if colour else crs.A_UNDERLINE)
        y += 1

        for artist in content['artists']:  # Write each artist.
            main.addstr(y, 0, str(i).zfill(2),
                        crs.color_pair(3 if y % 2 == 0 else 4)
                        if colour else 0)
            main.addstr(y, name_start, trunc(artist['name'], name_chars),
                        crs.color_pair(3 if y % 2 == 0 else 4)
                        if colour else 0)
            y += 1
            i += 1

    if 'albums' in content and content['albums']:  # Write albums header.
        main.addstr(y, 0, '#', crs.color_pair(2)
                    if colour else crs.A_UNDERLINE)
        main.addstr(y, name_start, trunc('Album', name_chars),
                    crs.color_pair(2) if colour else crs.A_UNDERLINE)
        main.addstr(y, artist_start, trunc('Artist', artist_chars),
                    crs.color_pair(2) if colour else crs.A_UNDERLINE)
        y += 1

        for album in content['albums']:  # Write each album.
            main.addstr(y, 0, str(i).zfill(2),
                        crs.color_pair(3 if y % 2 == 0 else 4)
                        if colour else 0)
            main.addstr(y, name_start, trunc(album['name'], name_chars),
                        crs.color_pair(3 if y % 2 == 0 else 4)
                        if colour else 0)
            main.addstr(y, artist_start, trunc(album['artist'], artist_chars),
                        crs.color_pair(3 if y % 2 == 0 else 4)
                        if colour else 0)
            y += 1
            i += 1

    main.refresh()


def enqueue(arg=None):
    """
    Display the current queue, or add an item to the queue.

    Keyword arguments:
    arg=None: Index of the MusicObject in the main window to add to
      the queue, 'c' to clear the queue, None to display the queue, or
      a space-delimited list of indices to add to the queue, i.e. '1 2 3'.

    Returns: True if an element was successfully inserted. To be used
      when inserting multiple elements.
    """
    global content

    if arg is None:
        if not queue:  # Nothing to display.
            error_msg(outbar, 'The queue is empty.')

        else:  # Display the queue.
            content = queue.collect()

    elif content is None:  # Nothing to queue.
        error_msg(outbar, 'Wrong context for queue.')

    else:
        if arg is 'c':  # Clear the queue.
            addstr(outbar, 'Cleared queue.')
            queue.clear()

        else:
            try:
                num = int(arg)

            except ValueError:
                # Check for multi-option argument.
                try:
                    nums = [int(i) for i in arg.split()]
                except ValueError:
                    error_msg(outbar, 'Invalid argument to queue.')
                else:  # Add all arguments to the queue.
                    count = 0
                    for num in nums:
                        count = count + 1 if enqueue(num) else count
                    addstr(outbar, 'Added %d item%s to the queue.' %
                           (count, '' if count == 1 else 's'))

            else:
                opt = get_option(num)
                if opt is not None:
                    if opt['kind'] == 'artist':  # Artists can't be queued.
                        error_msg(outbar,
                                  'Can only add songs or albums to the queue.')

                    elif opt['id'] in queue.ids:  # Duplicate entry.
                        error_msg(outbar, '\'%s\' is already in the queue.' %
                                  to_string(opt))

                    else:  # Valid  input.
                        addstr(outbar, 'Adding \'%s\' to the queue...' %
                               to_string(opt))
                        queue.append(opt)
                        addstr(outbar, 'Added \'%s\' to the queue.' %
                               to_string(opt))
                        return True

                else:  # num out of range.
                    error_msg(outbar, 'Invalid number. Valid between 1-%d.' %
                              sum([len(content[k]) for k in content.keys()]))


def expand(num=None):
    """
    Display all of a MusicObject's information: songs, artists, and albums.

    Keyword arguments:
    num=None: Index of the MusicObject in the main window to be expanded.
    """
    global content

    if num is None:  # No argument.
        error_msg(outbar, 'Missing argument to play.')

    elif content is None:  # Nothing to expand.
        error_msg(outbar, 'Wrong context for expand.')

    else:
        try:
            num = int(num)

        except ValueError:  # num needs to be an int.
            error_msg(outbar, 'Invalid argument to play.')

        else:
            limit = int((main.getmaxyx()[0] - 6)/3)
            opt = get_option(num, limit)

            if opt is not None:  # Valid input.
                addstr(outbar, 'Loading \'%s\'...' % to_string(opt))
                content = opt.collect(limit=limit)
                outbar.erase()
                outbar.refresh()

            else:  # num out of range.
                error_msg(outbar, 'Invalid number. Valid between 1-%d.' %
                          sum([len(content[k]) for k in content.keys()]))


def help(arg=0):
    """
    Display basic pmcli commands.

    Keyword arguments:
    arg=0: Irrelevant.
    """
    global content
    # Don't use generic addstr() because we don't want to call trunc() here.
    main.erase()
    main.addstr(
        """
        Commands:
        s/search search-term: Search for search-term
        e/expand 123: Expand item number 123
        p/play: Play current queue
        p/play s: Shuffle and play current queue
        p/play 123: Play item number 123
        q/queue: Show current queue
        q/queue 123:  Add item number 123 to queue
        q/queue 1 2 3:  Add items 1, 2, 3 to queue
        q/queue c:  Clear the current queue
        w/write file-name: Write current queue to file file-name
        r/restore file-name: Replace current queue with playlist from file-name
        h/help: Show this help message
        Ctrl-C: Exit pmcli
        """
    )
    main.refresh()
    content = None


def play(arg=None):
    """
    Play a MusicObject or the current queue.

    Keyword arguments:
    arg=None: A number n to play item n, 's' to play the queue in shuffle mode,
      or None to play the current queue in order.
    """
    global content

    if arg is None or arg is 's':
        if not queue:  # Can't play an empty queue.
            error_msg(outbar, 'The queue is empty.')

        else:  # Play the queue.
            if arg is 's':  # Shuffle.
                queue.shuffle()
            content = queue.collect()
            display()
            addstr(outbar, '[spc] pause [q] stop [n] next [9-0] volume')
            queue.play(infobar)
            outbar.erase()  # Remove trailing output.
            outbar.refresh()

    elif content is None:  # Nothing to play.
        error_msg(outbar, 'Wrong context for play.')

    else:
        try:
            num = int(arg)

        except ValueError:  # arg needs to be an int if it isn't 's'.
            error_msg(outbar, 'Invalid argument to play.')

        else:
            opt = get_option(num)

            if opt is not None:  # Valid input.
                addstr(outbar, '[spc] pause [q] stop [n] next [9-0] volume')
                opt.play(infobar)
                addstr(infobar, 'Now playing: None')
                outbar.erase()
                outbar.refresh()

            else:  # num out of range.
                error_msg(outbar, 'Invalid number. Valid between 1-%d' %
                          sum([len(content[k]) for k in content.keys()]))


def restore(fn=None):
    """
    Restore queue from a file.

    Keyword arguments:
    fn=None: Name of the file containing the playlist.
      File should be at ~/.local/share/pmcli/playlists/.
    """
    if fn is None:  # No argument.
        error_msg(outbar, 'Missing argument to restore.')
        return

    path = join(expanduser('~'), '.local', 'share', 'pmcli', 'playlists')
    if not isfile(join(path, fn)):  # Playlist file doesn't exist.
        error_msg(outbar, '%s does not exist.' % fn)
        return

    addstr(outbar, 'Restoring queue from %s...' % fn)
    try:  # Read the playlist.
        json_songs = json.loads(open(join(path, fn)).read())
    except json.decoder.JSONDecodeError:  # Bad file.
        error_msg(outbar, '%s is not a valid playlist file.' % fn)
        return

    songs = []
    for song in json_songs:
        if Song.verify(song):  # Make sure all the data is there.
            songs.append(Song(song, json=True))

    # Replace the current queue with the playlist.
    del queue[:]
    del queue.ids[:]
    queue.extend(songs)
    addstr(outbar, 'Restored %d/%d songs from playlist %s.' %
           (len(songs), len(json_songs), fn))


def search(query=None):
    """
    Search Google Play Music for a given query.

    Keyword arguments:
    query=None: The search query.

    Returns: A dict of lists with keys 'songs', 'artists', and 'albums'.
    """
    global content

    if query is None:  # No argument.
        error_msg(outbar, 'Missing search query.')
        return

    # Fetch as many results as we can display depending on terminal height.
    limit = int((main.getmaxyx()[0] - 3)/3)
    addstr(outbar, 'Searching for \'%s\'...' % query)
    result = api.search(query, max_results=limit)

    outbar.erase()  # Remove trailing output.
    outbar.refresh()

    # 'class' => class of MusicObject
    # 'hits' => key in search result
    # 'key' => per-entry key in search result
    mapping = {
        'songs': {
            'class': Song,
            'hits': 'song_hits',
            'key': 'track',
        },
        'artists': {
            'class': Artist,
            'hits': 'artist_hits',
            'key': 'artist',
        },
        'albums': {
            'class': Album,
            'hits': 'album_hits',
            'key': 'album',
        }
    }
    content = {'songs': [], 'artists': [], 'albums': []}
    for k in content.keys():
        result[k] = iter(result[mapping[k]['hits']])

    # Create 'limit' of each type.
    for i in range(limit):
        for k in content.keys():
            try:
                content[k].append(
                    mapping[k]['class'](next(result[k])[mapping[k]['key']])
                )

            except StopIteration:
                pass

    return content


def write(fn=None):
    """
    Write the current queue to a file.

    Keyword arguments:
    fn=None: File to be written to.
      File is stored at ~/.local/share/pmcli/playlists/.
    """
    if not queue:  # Can't save an empty queue.
        error_msg(outbar, 'Queue is empty.')
        return

    if fn is None:  # No argument.
        error_msg(outbar, 'Missing argument to write.')
        return

    path = join(expanduser('~'), '.local', 'share', 'pmcli', 'playlists')
    if not exists(path):  # No playlists directory.
        error_msg(outbar, 'Path to playlists does not exist.')

    elif exists(join(path, fn)):
        error_msg(outbar, 'Playist %s already exists.' % fn)

    else:  # Write the playlist.
        with open(join(path, fn), 'a') as f:
            json.dump(queue, f)
        addstr(outbar, 'Wrote queue to %s.' % fn)


if __name__ == '__main__':
    colour, main, inbar, infobar, outbar = initialize()
    addstr(infobar, 'Enter \'h\' or \'help\' if you need help.')
    queue = Queue()
    global content
    content = None

    while True:
        transition(get_input())
