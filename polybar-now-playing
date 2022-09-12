#!/usr/bin/env python3
import dbus
import signal
import time
from unicodedata import east_asian_width

# Config options

# (int) : Length of media info string. If length of string exceedes this value, the text will scroll. Default value is 20
message_display_len = 20

# (int) : Font index of polybar. this value should be 1 more than the font value specified in polybar config.
font_index = 1

# (float) : Update speed of the text in seconds.
update_delay = 0.3

# (list) : list of chars containing previous, play, pause, next glyphs for media controls in respective order
control_chars = ['','','','']

# (dict) : dict of char icons to display as prefix.
# If player name is available as key, then use the corressponding icon,
# else default key value.
# example:
display_player_prefix = {
    "spotify":  '',
    "firefox":  '',
    "default":  ''
}

# (list) : list of metadata fields based on mpris sepecification.
# For more details/ field names, refer [mpris sepecification](https://www.freedesktop.org/wiki/Specifications/mpris-spec/metadata/)
metadata_fields = ["xesam:title", "xesam:artist"]

# (char) : separator for metadata fields
metadata_separator = "-"

# (bool) : Hide text when no player is available? True disables the output for no players.
hide_output = False

# Defult initialization
current_player = None
player_names = None
players = None
message = None
display_text = ""
display_prefix = ""
display_suffix = ""
last_player_name = None

session_bus = dbus.SessionBus()

def get_name(player_name ):
    if player_name not in player_names:
        return
    name = ".".join(player_name.split(".")[3:])
    return name

def get_name_by_index(index):
    if index >= len(player_names):
        return
    return get_name(player_names[index])

def get_status(player):
    status = ""
    try:
        status = player.Get('org.mpris.MediaPlayer2.Player', 'PlaybackStatus', dbus_interface='org.freedesktop.DBus.Properties')
    except Exception as e:
        pass
    return status

def get_metadata(player):
    metadata = {}
    try:
        metadata = player.Get('org.mpris.MediaPlayer2.Player', 'Metadata', dbus_interface='org.freedesktop.DBus.Properties')
    except Exception as e:
        pass
    return metadata

def update_prefix_suffix(player_name="", status=""):
    global display_prefix, display_suffix, status_paused

    player_option = ""
    if player_name != "":
        player_option = "-p " + player_name

    prev_button = "%%{A:playerctl %s previous :}%c%%{A}"    %(player_option,control_chars[0])
    play_button = "%%{A:playerctl %s play :}%c%%{A}"        %(player_option,control_chars[1])
    pause_button = "%%{A:playerctl %s pause :}%c%%{A}"      %(player_option,control_chars[2])
    next_button = "%%{A:playerctl %s next :}%c%%{A}"        %(player_option,control_chars[3])

    suffix = "| " + prev_button
    if status == "Playing":
        suffix += " "+pause_button
        status_paused = False
    else:
        suffix += " "+play_button
        status_paused = True
    suffix += " "+next_button
    # print(suffix)
    display_suffix = suffix

    for key in display_player_prefix.keys():
        if key in player_name:
            display_prefix = display_player_prefix[key]
            break
    else:
        display_prefix = display_player_prefix["default"]

def update_players():
    global player_names, players, session_bus, current_player, last_player_name
    player_names = [service  for service in session_bus.list_names() if service.startswith('org.mpris.MediaPlayer2.')]
    players = [session_bus.get_object(service, '/org/mpris/MediaPlayer2') for service in player_names]
    if last_player_name != get_name(current_player):
        for index, player in enumerate(player_names):
            if get_name(player) == last_player_name:
                current_player = index

def handle_event(*args):
    global current_player, players, last_player_name
    update_players()
    if len(players) == 0:
        return
    current_player += 1
    current_player %= len(players)
    last_player_name = get_name_by_index(current_player)
#    print("SIGUSR1: updated values - current_player = %d  players len = %d"%(current_player,len(players)))

def update_message():
    global players, current_player,player_names, message, display_text, message_display_len, display_suffix, last_player_name
    if len(players) == 0:
        tmp_message = "No player available"
        update_prefix_suffix()
    else:
        name = get_name_by_index(current_player)
        status = get_status(players[current_player])
        metadata_obj = get_metadata(players[current_player])
        metadata_string_list = []
        for field in metadata_fields:
            result = metadata_obj.get(field)
            if type(result) == dbus.Array:
                result = result[0]
            if not result:
                result = "No "+field.split(":")[1]
            metadata_string_list.append(str(result))
        metadata_string = (" "+metadata_separator+" ").join(metadata_string_list)
        if visual_len(metadata_string) > message_display_len:
            metadata_string = " " + metadata_string + " |"
        update_prefix_suffix(name,status)
        tmp_message = ""
        if metadata_string:
            tmp_message += str(metadata_string)
        last_player_name = name
    if message != tmp_message:
        message = tmp_message
        display_text = message

def scroll():
    global display_text, message_display_len, status_paused
    if not status_paused:
        if visual_len(display_text) > message_display_len:
            display_text = display_text[1:] + display_text[0]
        elif visual_len(display_text) < message_display_len:
            display_text += " "*(message_display_len - len(display_text))

def visual_len(text):
    visual_length = 0
    for ch in text:
        width = east_asian_width(ch)
        if width == 'W' or width == 'F':
            visual_length += 2
        visual_length += 1
    return visual_length

def make_visual_len(text, visual_desired_length):
    visual_length = 0
    altered_text = ''
    for char in text:
        if visual_length < visual_desired_length:
            width = east_asian_width(char)
            if width == 'W' or width == 'F':
                visual_length += 2
            else:
                visual_length += 1
            altered_text += char
        else:
            break
    if visual_length == visual_desired_length + 1:
        altered_text = altered_text[:-1] + ' '
    elif visual_length < visual_desired_length:
        altered_text += ' ' * (visual_desired_length - visual_length)
    return altered_text

def print_text():
    global display_text, message_display_len, players, player_names, display_prefix, display_suffix
    if hide_output and len(players)==0:
        print("", flush = True)
        return
    scroll()
    print(display_prefix + " " +
        "%%{T%d}" % (font_index) +
        make_visual_len(display_text, message_display_len) +
        "%{T-}" + display_suffix, flush=True)

def main():
    global current_player, players
    update_players()
    current_player = 0
    while True:
        time.sleep(update_delay)
        update_players()
        update_message()
        print_text()

if __name__ == '__main__':
    signal.signal(signal.SIGUSR1, handle_event)
    main()
