from subprocess import call
from util import to_string, addstr, time_from_ms, api
from random import shuffle


class MusicObject(dict):
    """A dict representing a song, artist, or album."""
    def __init__(self, id, name, kind, full):
        """
        MusicObject contstructor.

        Arguments:
        id: Unique item id as determined by gmusicapi.
        name: Title of song/album or name of artist.
        kind: Type of object: song, artist, or album.
        full: Whether or not the item contains all possible information.
          MusicObjects generated from search() results are not full,
          MusicObjects generated from get_{track|artist|album_info}() are full.
        """
        self['id'] = id
        self['name'] = name
        self['kind'] = kind
        self['full'] = full

    @staticmethod
    def play(win, songs):
        """
        Play some songs.

        Arguments:
        win: Window on which to display song information.
        songs: List of songs to play. Songs are tuples following the
          format (song_string, song_id, song_length).

        Returns: None if all items were played, or the index of the
          first unplayed item to be used in restoring the queue.
        """
        conf_path = '~/.config/pmcli/mpv_input.conf'
        i = 1

        for song in songs:
            url = api.get_stream_url(song[0])
            addstr(win, 'Now playing: %s (%s)' %
                   (song[1], song[2]))

            if call(
                    ['mpv', '--really-quiet', '--input-conf', conf_path, url]
            ) is 11:  # 'q' returns this exit code.
                return i if i < len(songs) else None
            i += 1

        return None


class Artist(MusicObject):
    """A dict representing an artist."""
    def __init__(self, artist, full=False):
        """
        Artist constructor.

        Arguments:
        artist: Dict with artist information from gmusicapi.

        Keyword arguments:
        full=False: Whether or not the artist's song list is populated.
        """
        super().__init__(artist['artistId'], artist['name'], 'artist', full)
        self['id'] = artist['artistId']
        self['name'] = artist['name']

        try:
            self['songs'] = [
                {
                    'name': song['title'],
                    'artist': song['artist'],
                    'album': song['album'],
                    'id': song['storeId'],
                    'time': time_from_ms(song['durationMillis']),
                    'kind': 'song'
                } for song in artist['topTracks']
            ]

        except KeyError:
            self['songs'] = []

        try:
            self['albums'] = [
                {
                    'name': album['name'],
                    'artist': album['artist'],
                    'id': album['albumId'],
                    'kind': 'album'
                } for album in artist['albums']
            ]

        except KeyError:
            self['albums'] = []

    def collect(self, limit=20):
        """
        Collect all of an Artist's information: songs, artist, and albums.

        Keyword arguments:
        limit=20: Upper limit of each element to collect,
          determined by terminal height.

        Returns: A dict of lists with keys 'songs, 'artists', and 'albums'.
        """
        aggregate = {
            'songs': [],
            'artists': [self],
            'albums': []
        }

        songs = iter(self['songs'])
        albums = iter(self['albums'])

        # Create 'limit' of each type.
        for i in range(limit):
            try:
                aggregate['songs'].append(
                    Song(api.get_track_info(next(songs)['id']))
                )

            except StopIteration:
                pass

            try:
                aggregate['albums'].append(
                    Album(api.get_album_info(next(albums)['id']))
                )

            except StopIteration:
                pass

        return aggregate

    def fill(self, limit):
        """
        If an Artist is not full, fill in its song list.

        Arguments:
        limit: The number of songs to generate, determined by terminal height.

        Returns: A new, full, Artist.
        """
        if self['full']:
            return self

        # Create a new Artist with more information from get_artist_info.
        self = Artist(api.get_artist_info(
            self['id'], max_top_tracks=limit), full=True)
        return self

    def play(self, win):
        """
        Play an Artist's song list.

        Arguments:
        win: Window on which to display song information.
        """
        MusicObject.play(
            win, [(song['id'], to_string(song), song['time'])
                  for song in self['songs']]
        )


class Album(MusicObject):
    """A dict representing an album."""
    def __init__(self, album, full=False):
        """
        Album constructor.

        Arguments:
        artist: Dict with album information from gmusicapi.

        Keyword arguments:
        full=False: Whether or not the album's song list is populated.
        """
        super().__init__(album['albumId'], album['name'], 'album', full)
        self['artist'] = album['artist']
        self['artist_ids'] = album['artistId']
        try:
            self['songs'] = [
                {
                    'name': song['title'],
                    'artist': song['artist'],
                    'artist_id': song['artistId'][0],
                    'album': song['album'],
                    'id': song['storeId'],
                    'time': time_from_ms(song['durationMillis']),
                    'kind': 'song'
                } for song in album['tracks']
            ]

        except KeyError:
            self['songs'] = []

    def collect(self, limit=20):
        """
        Collect all of an Album's information: songs, artist, and albums.

        Keyword arguments:
        limit=20: Upper limit of each element to collect,
          determined by terminal height.

        Returns: A dict of lists with keys 'songs, 'artists', and 'albums'.
        """
        aggregate = {
            'songs': [],
            'artists': [
                Artist(api.get_artist_info(id)) for id in self['artist_ids']
            ],
            'albums': [self],
        }

        songs = iter(self['songs'])

        # Create 'limit' of each type.
        for i in range(limit):
            try:
                aggregate['songs'].append(
                    Song(api.get_track_info(next(songs)['id']))
                )

            except StopIteration:
                pass

        return aggregate

    def fill(self, limit=0):
        """
        If an Album is not full, fill in its song list.

        Arguments:
        limit: Irrelevant, we always generate all songs.

        Returns: A new, full, Album.
        """
        if self['full']:
            return self

        # Create a new Album with more information from get_album_info.
        self = Album(api.get_album_info(self['id']), full=True)
        return self

    def play(self, win):
        """
        Play an Album's song list.

        Arguments:
        win: Window on which to display song information.
        """
        MusicObject.play(
            win, [(song['id'], to_string(song), song['time'])
                  for song in self['songs']]
        )


class Song(MusicObject):
    """A dict representing a song."""
    def __init__(self, song, full=True, json=False):
        """
        Song constructor.

        Arguments:
        song: Dict with song information from gmusicapi.

        Keyword arguments:
        full=True: A song is always considered full.
        json=False: Whether or not the song is being initialized from JSON.
        """
        if not json:
            super().__init__(song['storeId'], song['title'], 'song', full)
            self['artist'] = song['artist']
            self['artist_ids'] = song['artistId']
            self['album'] = song['album']
            self['album_id'] = song['albumId']
            self['time'] = time_from_ms(song['durationMillis'])
        else:
            super().__init__(song['id'], song['name'], 'song', full)
            self['artist'] = song['artist']
            self['artist_ids'] = song['artist_ids']
            self['album'] = song['album']
            self['album_id'] = song['album_id']
            self['time'] = song['time']

    @staticmethod
    def verify(item):
        """
        Make sure a dict contains all necessary song data.

        Arguments:
        item: The dict being checked.

        Returns: Whether or not the item contains all necessary data.
        """
        return ('id' in item and 'name' in item and 'kind' in item and
                'full' in item and 'artist' in item and 'artist_ids' in item
                and 'album' in item and 'album_id' in item and 'time' in item)

    def collect(self, limit=None):
        """
        Collect all of a Song's information: songs, artist, and albums.

        Keyword arguments:
        limit=None: Irrelevant.

        Returns: A dict of lists with keys 'songs, 'artists', and 'albums'.
        """
        return {
            'songs': [self],
            'artists': [
                Artist(api.get_artist_info(id)) for id in self['artist_ids']
            ],
            'albums': [Album(api.get_album_info(self['album_id']))]
        }

    def fill(self, limit=0):
        """
        All songs are already 'full'.

        Keyword arguments:
        limit=0: Irrelevant.

        Returns: self.
        """
        return self

    def play(self, win):
        """
        Play a Song.

        Arguments:
        win: Window on which to display song information.
        """
        MusicObject.play(win, [(self['id'], to_string(self), self['time'])])


class Queue(list):
    """A queue of songs to be played."""
    def __init__(self):
        """Queue constructor."""
        super().__init__(self)
        self.ids = []

    def append(self, item):
        """
        Add an element to the queue.

        Arguments:
        item: item to be added. This can be a song or album.
          In the case of albums, each song is appended one by one.
        """
        if item['kind'] == 'album':
            for song in item['songs']:
                super().append(Song(api.get_track_info(song['id'])))
                self.ids.append(song['id'])
            # Todo: deal with properly removing album ids.
            self.ids.append(item['id'])

        else:
            super().append(item.fill())
            self.ids.append(item['id'])

    def extend(self, items):
        """
        Add all elements in some iterable to the queue.

        Arguments:
        items: iterable of songs and/or albums to be added one after another.
        """
        for item in items:
            self.append(item)

    def clear(self):
        """Empty the queue."""
        del self[:]
        del self.ids[:]

    def shuffle(self):
        """Shuffle the queue."""
        del self.ids[:]
        songs = [self.pop(0) for i in range(len(self))]
        del self[:]
        shuffle(songs)
        self.extend(songs)

    def collect(self, s=False):
        """
        Collect all of a Queue's information: songs, artist, and albums.

        Keyword arguments:
        s=False: Whether or not the queue is shuffled..

        Returns: A dict with key 'songs'.
        """
        songs = {'songs': [item for item in self]} if len(self) > 0 else None
        if s and songs is not None:
            shuffle(songs['songs'])
        return songs

    def play(self, win):
        """
        Play the queue.

        Arguments:
        win: Window on which to display song information.
        """
        songs = [(song['id'], to_string(song), song['time']) for song in self]

        # Save the queue contents to restore unplayed items.
        cache = []
        for i in range(len(songs)):
            cache.append(self.pop(0))
        del self.ids[:]

        index = MusicObject.play(win, songs)
        addstr(win, 'Now playing: None')

        for item in cache[index:]:
            self.append(item)
            self.ids.append(item['id'])
