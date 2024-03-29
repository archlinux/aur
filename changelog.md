# Name: v1.2.0 
### URL: https://github.com/ollm/OpenComic/releases/tag/v1.2.0
### published at '2024-03-29T16:32:37Z' by ollm
---
##### 🚀 New Features

- Show error message if continue reading file does not exist [`7aee55c`](https://github.com/ollm/OpenComic/commit/7aee55ca5dac6b937824728b7ded116dc00c28df)
- Support background music from folder: MP3, M4A, WEBM, WEBA, OGG, OPUS, WAV, FLAC [`26947a2`](https://github.com/ollm/OpenComic/commit/26947a297868e86069cc6daca77e1a3f016d0705)
- Now when applying Webtoon mode the vertical margin is 0 [`683a08a`](https://github.com/ollm/OpenComic/commit/683a08aad3a6d947004ad77476184d613718b098)
- Show the current reading title in app window [`9520faa`](https://github.com/ollm/OpenComic/commit/9520faa7486e4494bb878ffe2430e9fd198ee33a)
- Option to open file location of current reading from the file menu [`c9215dc`](https://github.com/ollm/OpenComic/commit/c9215dc5cb29a3b5a759d80d21f7ff734053f23c)
- Setting to enable/disable go next/previous chapter with mouse scroll (Vertical reading) [`37612bf`](https://github.com/ollm/OpenComic/commit/37612bfdce13ce73348bda997bf3aeb32b8915af)
- About this file dialog [`38f72f3`](https://github.com/ollm/OpenComic/commit/38f72f3c573aaa2a1923f3e6704261a9b600b3ab)
- Delete downloaded compressed files for thumbnail generation if they exceed 50% of the maximum tmp size [`2a50079`](https://github.com/ollm/OpenComic/commit/2a500790d2251f0a447aae2f08050af56c4a6659)
- Change extraction of zip to 7z to improve performance and support partial extraction of corrupted files [`d07feac`](https://github.com/ollm/OpenComic/commit/d07feac608903ef7ba582273bca06abaded4f4df)
- S3 server support [`ae8c133`](https://github.com/ollm/OpenComic/commit/ae8c13323a1edf618923c40b600fc5dd43c61276)

##### 🐛 Bug Fixes

- node-zstd not have native dependencies in arm64 build (Linux and macOS) [`e906f21`](https://github.com/ollm/OpenComic/commit/e906f212dae36c43d514beda44fba62e5ca26be5)
- Manga mode not working in epub [`a901754`](https://github.com/ollm/OpenComic/commit/a901754a4274687cddbfa3820ca3667b8b80e6ee)
- eBook not working with decimal device pixel ratio (1.5, 2.5, etc) [`4962724`](https://github.com/ollm/OpenComic/commit/496272442747e466638e890a187f84b100deda14)
- Blurry cover/poster images [`23ae46d`](https://github.com/ollm/OpenComic/commit/23ae46d3d77847f5262f10799a21d7ee0141b226)
- Using the first image as a poster does not work [`fd6c748`](https://github.com/ollm/OpenComic/commit/dfd6c748090088109416b847a5e7581d80e36ea7)
- Some errors in scroll reading [`a4887c3`](https://github.com/ollm/OpenComic/commit/a4887c3bfe3f0ec8b75d3cdceedfaae8684fe6df)
- Stuck in a loop trying to read an epub file when the epub or zip is corrupt [`6388a9e`](https://github.com/ollm/OpenComic/commit/6388a9ef8eb118e1d337fb6becd68ec64b5defc3)
- Next chapter button not work inscroll mode if last page is smaller than the window and "Adjust to width" is enabled [`2bbd49e`](https://github.com/ollm/OpenComic/commit/2bbd49e43f9bb96c2dc00f21494acd7a92820331)
- PDF.js does not load files that have a hash (#) in the name [`5691073`](https://github.com/ollm/OpenComic/commit/56910730d1b0241370565bce787508ba0811b9a9)
- Context menu does not appear in the inputs (Can't copy or paste) [`91cf4c8`](https://github.com/ollm/OpenComic/commit/91cf4c8fb4d4ca357e21041d6d761029638fb817)

You can see changes made in other versions in the [Changelog 📝](https://github.com/ollm/OpenComic/blob/master/CHANGELOG.md)
