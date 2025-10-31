# m2m

A minimal bash tool to convert YouTube video files to any other supported media files.

"m2m" stands for **Media to Media**.
## How it works:
- Fetches the video from the URL using yt-dlp
- Saves it in your `$YTDIR` directory (`$YTDIR=$HOME/Music/ytdownloads` by default)
- Or in your `$MULTI_DIR` directory for batch downloads (`$MULTI_DIR=$HOME/Music/ytdownloads/multi_mode` by default)
- Uses ffmpeg to convert the video to another file format
- Deletes the original video file and saves the converted file to `$YTDIR`

## Dependencies
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [ffmpeg](https://ffmpeg.org/)

## Usage:
### For single downloads:
 ```bash
m2m "https://www.youtube.com/watch?v=EYI489Dc4Sc" outputfile.mp3
```
Change the extension form `.mp3` to anything you like.

### For batch downloads:
```bash
m2m -m 5
```
You can change the **5** to the number of files you want to download.
(Or you can set is as **n** if you want it to run infinitely until you type `done` as the url.)
It would prompt you for the *URL* and then for the name you want to save the file as
```bash
m2m -m 2
Enter the URL: https://youtu.be/3JZ_D3ELwOQ
Enter the name to save it as: song_one.wav
Enter the URL: https://youtu.be/L_jWHffIx5E
Enter the name to save it as: song_two.mkv
[*] Initiating download for stream 1
[✓] Stream 1 downloaded
[*] Converting stream 1
[✓] Stream 1 saved to filesystem

[*] Initiating download for stream 2
[✓] Stream 2 downloaded
[*] Converting stream 2
[✓] Stream 2 saved to filesystem

... #And so on
```

## Notes
- By default, downloads are saved in `$HOME/Music/ytdownloads` for single downloads,and `$HOME/Music/ytdownloads/multi_mode` for batch downloads.
- You can change both `$YTDIR` and `$MULTI_DIR` as per your convenience.
- You can convert to any media format supported by `ffmpeg` just don't forget to put the extension after the file name.
- I have used `-f best` option for `yt-dlp` to fetch the highest quality stream available, however if you want to optimize `m2m` for less data usage, you can change that to any other stream you like.
