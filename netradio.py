#!/usr/bin/env python
import subprocess
import os
import sys
import atexit
import signal
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
    return [(result["title"], result["id"]) for result in results]

def show_mpv_shortcuts():
    print("\033[91m" + "Player kısayolları:" + "\033[0m")
    print("\033[91m" + "=====(m) Mute (Space) Duraklat (Ok Tuşları) İleri-geri sarma (q) Playeri durdurup ana menüye dönme=====" + "\033[0m")

def play_media(url, media_type, quality):
    global mpv_process
    show_mpv_shortcuts()
    if media_type == "audio":
        format_option = "bestaudio"
        if quality == "1":  # Yüksek kalite
            audio_quality = "0"
        elif quality == "2":  # Orta kalite
            audio_quality = "5"
        elif quality == "3":  # Düşük kalite
            audio_quality = "9"
        command = f'yt-dlp -f {format_option} --audio-quality {audio_quality} -o - {url} | mpv -'
    elif media_type == "video":
        format_option = "best" if quality == "1" else "worst"
        command = f'yt-dlp -f {format_option} -o - {url} | mpv -'
    
    if mpv_process:
        mpv_process.terminate()
    
    mpv_process = subprocess.Popen(command, shell=True, preexec_fn=os.setsid)
    
def download_media(video_id, media_type, quality):
    # Kullanıcı ev dizininde netradio klasörünü oluştur
    home_dir = os.path.expanduser("~")
    download_dir = os.path.join(home_dir, "netradio")
    os.makedirs(download_dir, exist_ok=True)

    # İndirme URL'si
    url = f"https://www.youtube.com/watch?v={video_id}"

    # İndirme komutları
    if media_type == "audio":
        format_option = "bestaudio"
        if quality == "1":
            audio_quality = "0"
        elif quality == "2":
            audio_quality = "5"
        elif quality == "3":
            audio_quality = "9"
        command = ['yt-dlp', '-f', format_option, '--audio-quality', audio_quality, '-o', os.path.join(download_dir, '%(title)s.%(ext)s'), url]
    elif media_type == "video":
        if quality == "1":
            format_option = "bestvideo+bestaudio"
        elif quality == "2":
            format_option = "worstvideo+bestaudio"
        elif quality == "3":
            format_option = "worstvideo+worstaudio"
        command = ['yt-dlp', '-f', format_option, '-o', os.path.join(download_dir, '%(title)s.%(ext)s'), url]

    subprocess.run(command)

def cleanup():
    if mpv_process:
        os.killpg(os.getpgid(mpv_process.pid), signal.SIGTERM)

def main():
    atexit.register(cleanup)

    while True:
        print("Seçenekler:")
        print("1) İnternet Radyosu")
        print("2) YouTube Podcast")
        print("3) Çıkış")
        choice = input("Seçiminizi yapın: ")

        if choice == "1":
            for idx, (name, _) in enumerate(RADIO_STATIONS):
                print(f"{idx + 1}) {name}")
            station_choice = int(input("Çalmak için bir radyo istasyonu seçin: "))
            station_url = RADIO_STATIONS[station_choice - 1][1]
            play_media(station_url, "audio", "1")
        
        elif choice == "2":
            term = input("Aranacak kanal veya terimi girin: ")
            results = search_youtube(term)
            for idx, (title, _) in enumerate(results):
                print(f"{idx + 1}) {title}")
            podcast_choice = int(input("Oynatmak veya indirmek için bir podcast seçin: "))
            video_id = results[podcast_choice - 1][1]
            print("Seçenekler:")
            print("1) Oynat (ses)")
            print("2) Oynat (video)")
            print("3) İndir (ses)")
            print("4) İndir (video)")
            action_choice = int(input("Seçiminizi yapın: "))
            print("Kalite seçenekleri: 1) Yüksek, 2) Orta, 3) Düşük")
            quality_choice = input("Kalite seçimini yapın (1/2/3): ")

            if action_choice == 1:
                play_media(video_id, "audio", quality_choice)
            elif action_choice == 2:
                play_media(video_id, "video", quality_choice)
            elif action_choice == 3:
                download_media(video_id, "audio", quality_choice)
            elif action_choice == 4:
                download_media(video_id, "video", quality_choice)
        
        elif choice == "3":
            break

if __name__ == "__main__":
    main()
