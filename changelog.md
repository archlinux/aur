# Name: v4.2.1 
### URL: https://github.com/spotDL/spotify-downloader/releases/tag/v4.2.1
### published at '2023-09-01T22:44:30Z' by xnetcat
---
## What's Changed

Web:
- Playlist, artist and album download from web app by @oscarvx00 in #1865

Bugfixes:
- check if track is a song when downloading playlists by @xnetcat in 8949b9a692c8fabac266f95f2a2a5895daaf7769
- Support for manual Bandcamp and Soundcloud download. (Using like manual Youtube download in the format MusicURL|SpotifyURL) by @Piripe in #1897
- Fix crash when filtering results with the --dont-filter-results argument when a provider has 0 result by @Piripe in #1897
- Fixed a crash with the cache by @Piripe in #1897
- Fixed matching error when downloading an album caused by track duration by @Piripe in #1897
- Fixed bandcamp audio provider by @xnetcat in b1a48debc573924d100a91a47f2bc0ab741a51cc a4c6e8dcb80ab99cd62f84b80dcba0ec7a1dadde

Improvements:
- use downloader settings when parsing query by @xnetcat in 0a692c7b0b0610204908c7823cd14ce078df1b6d
- added more checks for sync file by @xnetcat in 5e34b216287b84daecf5b26afb6c99b57d4572ab
- respect detect-formats option when using m3u option by @xnetcat in 8a8891e097480caccbda74b75f5ed1d62bb05f81
- fixed/improved search term matching by @xnetcat in db11f719d7ba76451e3a7d628909277cab8ac38d

New features:
- added option to save errors by @xnetcat in 920442e134292e892b762b4fdf7f69aeafc3c972
- added more checks for sync file
- added ability to print to stdout when using save by @xnetcat in ce2bce651d46810621ae8eb729bb816ccdd115dc
- added `all-user-followed-artists` shortcut by @xnetcat in f9f110f61dd7bb388546bd6791da81fbb5d2077f

Misc:
- updated packages by @xnetcat in f8d749048537239085d7335e24f2f87ed24402ab

**Full Changelog**: https://github.com/spotDL/spotify-downloader/compare/v4.2.0...v4.2.1

## New Contributors
* @oscarvx00 made their first contribution in https://github.com/spotDL/spotify-downloader/pull/1865
* @Piripe made their first contribution in https://github.com/spotDL/spotify-downloader/pull/1897

## Donate

help support the development and maintenance of the software ❤️ 

[![paypal](https://img.shields.io/badge/paypal-%2300457C.svg?&style=for-the-badge&logo=paypal&logoColor=white)](https://paypal.me/kko7)
[![kofi](https://img.shields.io/badge/kofi-%23F16061.svg?&style=for-the-badge&logo=ko-fi&logoColor=white)](https://ko-fi.com/xnetcat)


