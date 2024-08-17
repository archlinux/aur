#!/usr/bin/env python
import curses
import subprocess
import os
import signal
import atexit
from youtubesearchpython import VideosSearch

RADIO_STATIONS = [
    ("KRAL Pop", "http://46.20.3.201:80/;"),
    ("Power Türk", "https://live.powerapp.com.tr/powerturk/abr/playlist.m3u8"),
    ("Alem", "https://turkmedya.radyotvonline.com/turkmedya/alemfm.stream/playlist.m3u8"),
    ("Joy", "http://provisioning.streamtheworld.com/pls/JOY_FMAAC.pls"),
    ("Power", "http://icast.powergroup.com.tr/PowerTurk/mpeg/128/home"),
    ("Slow Turk", "https://radyo.duhnet.tv/slowturk"),
    ("Pal", "http://shoutcast.radyogrup.com:1030/;"),
    ("Powerturk", "http://mpegpowerturk.listenpowerapp.com/powerturk/mpeg/icecast.audio")
]

mpv_process = None

def search_youtube(term):
    videos_search = VideosSearch(term, limit=10)
    results = videos_search.result()["result"]
    return [(result["title"], result["link"]) for result in results]

def play_media(url, media_type, quality):
    global mpv_process
    
    if media_type == "audio":
        format_option = "bestaudio"
        audio_quality = {"1": "0", "2": "5", "3": "9"}.get(quality, "5")
        command = f'yt-dlp -f {format_option} --audio-quality {audio_quality} -o - {url} | mpv -'
    elif media_type == "video":
        if quality == "1":
            command = f'mpv {url}'
        else:
            format_option = "best" if quality == "2" else "worst"
            command = f'yt-dlp -f {format_option} -o - {url} | mpv -'
    
    if mpv_process:
        mpv_process.terminate()
        mpv_process.wait()  # Ensure the previous process has ended
    
    mpv_process = subprocess.Popen(command, shell=True, preexec_fn=os.setsid)

def download_media(video_url, media_type, quality):
    if media_type == "audio":
        format_option = "bestaudio"
        audio_quality = {"1": "0", "2": "5", "3": "9"}.get(quality, "5")
        command = ['yt-dlp', '-f', format_option, '--audio-quality', audio_quality, '-o', '%(title)s.%(ext)s', video_url]
    elif media_type == "video":
        format_option = {"1": "bestvideo+bestaudio", "2": "worstvideo+bestaudio", "3": "worstvideo+worstaudio"}.get(quality, "worstvideo+bestaudio")
        command = ['yt-dlp', '-f', format_option, '-o', '%(title)s.%(ext)s', video_url]
    
    subprocess.run(command)

def cleanup():
    global mpv_process
    if mpv_process:
        os.killpg(os.getpgid(mpv_process.pid), signal.SIGTERM)
        mpv_process.wait()  # Ensure the process has ended

def draw_menu(stdscr, selected_row_idx, menu_items):
    stdscr.clear()
    h, w = stdscr.getmaxyx()
    
    for idx, row in enumerate(menu_items):
        x = w//2 - len(row)//2
        y = h//2 - len(menu_items)//2 + idx
        if idx == selected_row_idx:
            stdscr.attron(curses.color_pair(1))
            stdscr.addstr(y, x, row)
            stdscr.attroff(curses.color_pair(1))
        else:
            stdscr.addstr(y, x, row)
    
    stdscr.refresh()

def menu(stdscr, menu_items):
    curses.curs_set(0)
    curses.init_pair(1, curses.COLOR_BLACK, curses.COLOR_WHITE)

    current_row = 0
    draw_menu(stdscr, current_row, menu_items)

    global mpv_process

    while True:
        key = stdscr.getch()

        if key == curses.KEY_UP and current_row > 0:
            current_row -= 1
        elif key == curses.KEY_DOWN and current_row < len(menu_items) - 1:
            current_row += 1
        elif key == curses.KEY_ENTER or key in [10, 13]:
            return current_row
        elif key == ord('q'):
            if mpv_process:
                os.killpg(os.getpgid(mpv_process.pid), signal.SIGTERM)
                mpv_process = None
            return None
        
        draw_menu(stdscr, current_row, menu_items)

def main(stdscr):
    atexit.register(cleanup)

    while True:
        main_menu = ["1) İnternet Radyosu", "2) YouTube Podcast", "3) Çıkış"]
        selected_option = menu(stdscr, main_menu)
        
        if selected_option is None:
            continue
        
        if selected_option == 0:
            radio_menu = [station[0] for station in RADIO_STATIONS]
            selected_station = menu(stdscr, radio_menu)
            if selected_station != -1:
                play_media(RADIO_STATIONS[selected_station][1], "audio", "1")
        
        elif selected_option == 1:
            stdscr.clear()
            curses.echo()
            stdscr.addstr(0, 0, "Aranacak kanal veya terimi girin: ")
            term = stdscr.getstr().decode("utf-8")
            curses.noecho()

            results = search_youtube(term)
            podcast_menu = [result[0] for result in results]
            selected_podcast = menu(stdscr, podcast_menu)
            
            if selected_podcast != -1:
                video_url = results[selected_podcast][1]
                action_menu = ["1) Oynat (ses)", "2) Oynat (video)", "3) İndir (ses)", "4) İndir (video)"]
                selected_action = menu(stdscr, action_menu)
                
                if selected_action != -1:
                    quality_menu = ["1) Yüksek", "2) Orta", "3) Düşük"]
                    selected_quality = menu(stdscr, quality_menu) + 1
                    
                    if selected_action == 0:
                        play_media(video_url, "audio", str(selected_quality))
                    elif selected_action == 1:
                        play_media(video_url, "video", str(selected_quality))
                    elif selected_action == 2:
                        download_media(video_url, "audio", str(selected_quality))
                    elif selected_action == 3:
                        download_media(video_url, "video", str(selected_quality))
        
        elif selected_option == 2:
            break

if __name__ == "__main__":
    curses.wrapper(main)
