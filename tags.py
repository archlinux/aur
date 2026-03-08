from mutagen import File
from mutagen.id3 import ID3
from mutagen.flac import FLAC
from PIL import Image
import io

TAG_KEYS = {
    "Title":        ["title", "TIT2"],
    "Artist":       ["artist", "TPE1"],
    "Album":        ["album", "TALB"],
    "Album Artist": ["albumartist", "TPE2"],
    "Track":        ["tracknumber", "TRCK"],
    "Disc":         ["discnumber", "TPOS"],
    "Year":         ["date", "TDRC"],
    "Genre":        ["genre", "TCON"],
    "Composer":     ["composer", "TCOM"],
    "Comment":      ["comment", "COMM::eng"],
}


def get_tag(tags, keys):
    for key in keys:
        val = tags.get(key)
        if val:
            return str(val[0]) if isinstance(val, list) else str(val)
    return ""


def read_tags(path):
    """Returns dict of {label: value} for all TAG_KEYS, or None if unreadable."""
    af = File(path, easy=True)
    if af is None:
        return None
    return {label: get_tag(af, keys) for label, keys in TAG_KEYS.items()}


def save_tags(path, tags_dict):
    """Write tags_dict {label: value} back to the file. Returns (ok, error_msg)."""
    af = File(path, easy=True)
    if af is None:
        return False, "Could not open file"
    if af.tags is None:
        af.add_tags()
    for label, keys in TAG_KEYS.items():
        easy_key = keys[0]
        val = tags_dict.get(label, "").strip()
        try:
            if val:
                af[easy_key] = val
            elif easy_key in af:
                del af[easy_key]
        except Exception:
            pass
    try:
        af.save()
        return True, None
    except Exception as e:
        return False, str(e)


def get_cover(path):
    """Returns a PIL Image of the embedded cover art, or None."""
    try:
        af = ID3(path)
        for tag in af.values():
            if tag.FrameID == "APIC":
                return Image.open(io.BytesIO(tag.data))
    except Exception:
        pass
    try:
        af = FLAC(path)
        if af.pictures:
            return Image.open(io.BytesIO(af.pictures[0].data))
    except Exception:
        pass
    return None
