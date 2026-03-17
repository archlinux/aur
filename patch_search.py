import sys

with open('TrailerDownloader.py', 'r') as f:
    content = f.read()

# 1. Remove the sys.exit(1) on Test if API key is missing
old_test_check = """        if os.environ["radarr_eventtype"] == "Test":
            if YOUTUBE_API_KEY == "YOUR_API_KEY":
                log("Please insert your Youtube API key for the script to work")
                sys.exit(1)
            log("Test successful")"""
new_test_check = """        if os.environ["radarr_eventtype"] == "Test":
            log("Test successful (API key check bypassed)")"""
content = content.replace(old_test_check, new_test_check)

old_sonarr_test_check = """        if os.environ["sonarr_eventtype"] == "Test":
            if YOUTUBE_API_KEY == "YOUR_API_KEY":
                log("Please insert your Youtube API key for the script to work")
                sys.exit(1)
            log("Test successful")"""
new_sonarr_test_check = """        if os.environ["sonarr_eventtype"] == "Test":
            log("Test successful (API key check bypassed)")"""
content = content.replace(old_sonarr_test_check, new_sonarr_test_check)

# 2. Replace the search block with the smart fallback
old_search = """    yt_search_url = f"https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&q={yt_query}&type=video&videoDuration=short&key={YOUTUBE_API_KEY}"
    log("Sending Youtube search request...")
    yt_search_results = fetch_json(yt_search_url)

    if not yt_search_results.get("items"):
        log(f"No search results! Skipping trailer download.")
        return 0

    yt_video_id = yt_search_results["items"][0]["id"]["videoId"]"""

new_search = """    if YOUTUBE_API_KEY and YOUTUBE_API_KEY != "YOUR_API_KEY":
        yt_search_url = f"https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&q={yt_query}&type=video&videoDuration=short&key={YOUTUBE_API_KEY}"
        log("Sending Youtube search request...")
        try:
            yt_search_results = fetch_json(yt_search_url)
            if not yt_search_results.get("items"):
                log("No search results! Skipping trailer download.")
                return 0
            yt_video_id = yt_search_results["items"][0]["id"]["videoId"]
            download_url = f"https://www.youtube.com/watch?v={yt_video_id}"
        except Exception as e:
            log(f"API search failed ({e}). Falling back to yt-dlp search...")
            download_url = f"ytsearch1:{yt_query}"
    else:
        log("No API key provided. Using yt-dlp search directly...")
        download_url = f"ytsearch1:{yt_query}\""""
content = content.replace(old_search, new_search)

# 3. Replace the download extraction to handle playlist dicts returned by ytsearch
old_dl = """                info_dict = ydl.extract_info(f"https://www.youtube.com/watch?v={yt_video_id}", download=True)
                temp_filename = ydl.prepare_filename(info_dict)"""

new_dl = """                info_dict = ydl.extract_info(download_url, download=True)
                # If ytsearch1 was used, info_dict is a playlist wrapper; we need the actual video entry
                if 'entries' in info_dict:
                    info_dict = info_dict['entries'][0]
                temp_filename = ydl.prepare_filename(info_dict)"""
content = content.replace(old_dl, new_dl)

with open('TrailerDownloader.py', 'w') as f:
    f.write(content)
