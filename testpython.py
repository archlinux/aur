import os
import re
import json
import random
import requests
import asyncio
import subprocess
from dotenv import load_dotenv
from bs4 import BeautifulSoup
from ytmusicapi import YTMusic
from rich.console import Console
from rich.table import Table
from rich.panel import Panel

# Load environment variables
load_dotenv()
GENIUS_API_TOKEN = os.getenv("GENIUS_API_TOKEN")

# Setup
console = Console()
yt = YTMusic()
favorites = []
queue = []
repeat = False
shuffle = False

# File paths
FAV_FILE = "favorites.json"
QUEUE_FILE = "queue.json"

def display_logo():
    # Text art logo
    logo = """
    ______ _____  ________  ____      
    |  _  \  _  ||  _  |  \/  ( )     
    | | | | | | || | | | .  . |/ ___  
    | | | | | | || | | | |\/| | / __| 
    | |/ /\ \_/ /\ \_/ / |  | | \__ \ 
    |___/  \___/  \___/\_|  |_/ |___/ 
    """
    print(logo)

if __name__ == "__main__":
    display_logo()
    # Your app's code continues here...


# Clean song title for better matching
def clean_title(title):
    return re.sub(r"[\(\[].*?[\)\]]", "", title).strip()

def search_music(query):
    results = yt.search(query, filter="songs", limit=10)
    return results

def print_search_results(results):
    table = Table(title="Search Results")
    table.add_column("No.", justify="right")
    table.add_column("Title", style="cyan")
    table.add_column("Artists", style="magenta")

    for i, song in enumerate(results, 1):
        artists = ", ".join(artist.get("name", "") for artist in song.get("artists", []))
        table.add_row(str(i), song.get("title", "Unknown"), artists)
    console.print(table)

def print_recommendations(recs):
    table = Table(title="🎵 Recommendations")
    table.add_column("No.", justify="right")
    table.add_column("Title", style="cyan")
    table.add_column("Artists", style="magenta")
    for i, song in enumerate(recs, 1):
        title = song.get("title", "Unknown")
        artists = ", ".join(artist.get("name", "") for artist in song.get("artists", []))
        table.add_row(str(i), title, artists)
    console.print(table)

def play_song(video_id):
    url = f"https://www.youtube.com/watch?v={video_id}"
    try:
        subprocess.run(["mpv", "--no-video", url])
    except KeyboardInterrupt:
        console.print("\n⏹️ Playback interrupted by user.")

def download_song(video_id):
    url = f"https://www.youtube.com/watch?v={video_id}"
    subprocess.run(["yt-dlp", "-x", "--audio-format", "mp3", url])

def fetch_lyrics_from_genius(title, artist):
    query = f"{clean_title(title)} {artist}"
    headers = {"Authorization": f"Bearer {GENIUS_API_TOKEN}"}
    search_url = "https://api.genius.com/search"

    res = requests.get(search_url, params={"q": query}, headers=headers)
    if res.status_code != 200:
        return "⚠️ Genius API error."

    hits = res.json().get("response", {}).get("hits", [])
    if not hits:
        return "⚠️ Lyrics not found."

    song_url = hits[0]["result"]["url"]
    html = requests.get(song_url).text
    soup = BeautifulSoup(html, "html.parser")

    containers = soup.select("div[data-lyrics-container='true']")
    lyrics = "\n".join([el.get_text(separator="\n").strip() for el in containers])
    return lyrics or "⚠️ Lyrics could not be extracted."

def print_lyrics(lyrics):
    console.print(Panel(lyrics, title="🎤 Lyrics", border_style="green"))

def export_data():
    with open(FAV_FILE, "w") as f:
        json.dump(favorites, f, indent=2)
    with open(QUEUE_FILE, "w") as f:
        json.dump(queue, f, indent=2)
    console.print("💾 Data exported.")

def import_data():
    global favorites, queue
    if os.path.exists(FAV_FILE):
        with open(FAV_FILE) as f:
            favorites = json.load(f)
    if os.path.exists(QUEUE_FILE):
        with open(QUEUE_FILE) as f:
            queue = json.load(f)
    console.print("📥 Data imported.")

async def autoplay_queue():
    while queue:
        if shuffle:
            next_track = random.choice(queue)
        else:
            next_track = queue.pop(0)
        console.print(f"🎧 Now playing: {next_track['title']} by {next_track['artists']}")
        play_song(next_track["videoId"])
        if repeat:
            queue.append(next_track)

async def main():
    import_data()
    while True:
        console.print("\n[bold green]Enter search (or 'q'=quit, 'f'=favorites, 'qf'=queue, 'exp'=export, 'imp'=import, 'auto'=autoplay, 'shuf'=shuffle toggle, 'rep'=repeat toggle):[/bold green]")
        try:
            query = input(" > ").strip()
        except KeyboardInterrupt:
            break

        if query.lower() == 'q':
            export_data()
            break
        elif query == 'f':
            console.print("\n❤️ Favorites List")
            for i, fav in enumerate(favorites, 1):
                console.print(f"{i}. {fav['title']} by {fav['artists']}")
            continue
        elif query == 'qf':
            console.print("\n📂 Queue List")
            for i, item in enumerate(queue, 1):
                console.print(f"{i}. {item['title']} by {item['artists']}")
            continue
        elif query == 'exp':
            export_data()
            continue
        elif query == 'imp':
            import_data()
            continue
        elif query == 'shuf':
            global shuffle
            shuffle = not shuffle
            console.print(f"🔀 Shuffle {'enabled' if shuffle else 'disabled'}")
            continue
        elif query == 'rep':
            global repeat
            repeat = not repeat
            console.print(f"🔁 Repeat {'enabled' if repeat else 'disabled'}")
            continue
        elif query == 'auto':
            await autoplay_queue()
            continue

        results = search_music(query)
        if not results:
            console.print("No results found.", style="bold red")
            continue

        print_search_results(results)

        console.print("\n[yellow]Enter track number to select (or 'b' to go back):[/yellow]")
        choice = input(" > ").strip()
        if choice.lower() == 'b':
            continue
        if not choice.isdigit() or not (1 <= int(choice) <= len(results)):
            console.print("Invalid choice.", style="bold red")
            continue

        selected = results[int(choice) - 1]
        title = selected.get("title", "Unknown")
        artists = ", ".join(artist.get("name", "") for artist in selected.get("artists", []))
        video_id = selected["videoId"]
        browse_id = selected.get("browseId")

        console.print(f"\nSelected: [bold green]{title}[/bold green] by [bold magenta]{artists}[/bold magenta]")

        while True:
            console.print("Choose: [p]lay, [v]iew, [f]av, [d]l, [a]dd, [l]yrics, [rec]ommend, [b]ack", markup=False)
            try:
                action = input(" > ").strip().lower()
            except KeyboardInterrupt:
                console.print("\n👋 Exiting...")
                export_data()
                return

            if action == 'p':
                console.print(f"🎧 Playing: {title} by {artists}")
                play_song(video_id)
            elif action == 'v':
                console.print(selected)
            elif action == 'f':
                favorites.append({"title": title, "artists": artists})
                console.print("❤️ Added to favorites.")
            elif action == 'd':
                console.print("⬇️ Downloading...")
                download_song(video_id)
                console.print("✅ Done.")
            elif action == 'a':
                queue.append({"title": title, "artists": artists, "videoId": video_id})
                console.print("📥 Queued.")
            elif action == 'l':
                console.print("🔍 Lyrics...")
                lyrics = fetch_lyrics_from_genius(title, artists.split(",")[0])
                print_lyrics(lyrics)
            elif action == 'rec':
                console.print("🔁 Getting recommendations...")
                try:
                    if browse_id:
                        related = yt.get_song_related(browse_id)
                    else:
                        related = yt.get_watch_playlist(video_id).get("tracks", [])
                    if not related:
                        console.print("No recommendations found.", style="bold red")
                        continue
                    print_recommendations(related[:5])

                    console.print("\n[yellow]Enter track number to add to queue, or 'b' to go back:[/yellow]")
                    rec_choice = input(" > ").strip()
                    if rec_choice.lower() == 'b':
                        continue
                    if not rec_choice.isdigit() or not (1 <= int(rec_choice) <= len(related[:5])):
                        console.print("Invalid choice.", style="bold red")
                        continue
                    rec_selected = related[int(rec_choice) - 1]
                    rec_title = rec_selected.get("title", "Unknown")
                    rec_artists = ", ".join(artist.get("name", "") for artist in rec_selected.get("artists", []))
                    rec_video_id = rec_selected.get("videoId")
                    queue.append({"title": rec_title, "artists": rec_artists, "videoId": rec_video_id})
                    console.print(f"✅ Added '{rec_title}' to queue.")
                except Exception as e:
                    console.print(f"❌ Failed to get recommendations: {e}", style="bold red")
            elif action == 'b':
                break
            else:
                console.print("❌ Invalid.")

if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        console.print("\n👋 Exiting...")
        export_data()
