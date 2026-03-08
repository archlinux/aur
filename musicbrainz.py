import musicbrainzngs

musicbrainzngs.set_useragent("MusicTagsApp", "0.1", "https://example.com")


def fetch_missing(current_tags, log=print):
    """Search MusicBrainz for missing tags. Returns dict of {label: value}."""
    title  = current_tags.get("Title", "")
    artist = current_tags.get("Artist", "")
    album  = current_tags.get("Album", "")

    if not title and not artist:
        log("MB: not enough info to search")
        return {}

    try:
        query = {}
        if title:
            query["recording"] = title
        if artist:
            query["artist"] = artist
        if album:
            query["release"] = album

        result = musicbrainzngs.search_recordings(limit=1, **query)
        recordings = result.get("recording-list", [])
        if not recordings:
            log("MB: no results found")
            return {}

        rec = recordings[0]
        log(f"MB: matched '{rec.get('title')}' (score {rec.get('ext:score')})")

        filled = {}
        if not title:
            filled["Title"] = rec.get("title", "")

        artist_credits = rec.get("artist-credit", [])
        if not artist and artist_credits:
            filled["Artist"] = artist_credits[0].get("artist", {}).get("name", "")

        releases = rec.get("release-list", [])
        if releases:
            rel = releases[0]
            if not album:
                filled["Album"] = rel.get("title", "")
            if not current_tags.get("Year"):
                filled["Year"] = rel.get("date", "")[:4] if rel.get("date") else ""
            if not current_tags.get("Track"):
                media = rel.get("medium-list", [{}])
                track_list = media[0].get("track-list", [{}]) if media else [{}]
                filled["Track"] = track_list[0].get("number", "") if track_list else ""

        return filled

    except Exception as e:
        log(f"MB: error — {e}")
        return {}
