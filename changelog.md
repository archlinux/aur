# Name: v1.6.3 
### URL: https://github.com/ollm/OpenComic/releases/tag/v1.6.3
### published at '2025-10-07T16:18:18Z' by ollm
---
##### 🐛 Bug Fixes

- Add error handling for reading progress in comic context menu [`b3a6bbf`](https://github.com/ollm/OpenComic/commit/b3a6bbf012beaca669839594675c8faac55d8085)
- Error handling for corrupted JSON/ZSTD files in cache and remove them [`978e281`](https://github.com/ollm/OpenComic/commit/978e281cca7c6b7e6aff78357a15275ea7fc746b)
- Header bar buttons don't register start/end of chapter if scrolled with scrollbar [`b9cb5ea`](https://github.com/ollm/OpenComic/commit/b9cb5ea8d034fbca72c53212bc5faf9f144a879d)
- Asynchronous progress check in the context menu (Mark as read/unread) [`ca51b12`](https://github.com/ollm/OpenComic/commit/ca51b122372c89b4414572b31f7bf05ac7800c22)
- The application loops and freezes when opening files on the network (UNC paths) [`7ca4d20`](https://github.com/ollm/OpenComic/commit/7ca4d200730d5b2814e24cad4b34969ab38a2857)
- Prevent concurrent reads of the same file [`cefa1c5`](https://github.com/ollm/OpenComic/commit/cefa1c552309a27e04ec6c6c5b7d2549028eeed5)
- Memory leak in blob files when browsing extremely quickly while reading [`ccdcdbc`](https://github.com/ollm/OpenComic/commit/ccdcdbc7194e3703c16f0ae5c979f1947d3b7517)
- TypeError by ensuring countries is an array [`4fb987d`](https://github.com/ollm/OpenComic/commit/4fb987d50d299d8b5c58a979f35eaef11e4c3be0)
- High memory usage on Linux due to a compatibility issue between Sharp and Electron [`2bf74ee`](https://github.com/ollm/OpenComic/commit/2bf74ee89ad68fcbd4ca8855b9f80a1be45cdf0f)
- Incorrect page is being set as a poster in manga mode [`3e90c82`](https://github.com/ollm/OpenComic/commit/3e90c82b47f80d0e804987f43d60c6a1d08fa0eb)
- Image breaks sometimes in PDF render [`a184b0c`](https://github.com/ollm/OpenComic/commit/a184b0c54376d0f5bc8b95265e71a9c3aeed41c8)

You can see changes made in other versions in the [Changelog 📝](https://github.com/ollm/OpenComic/blob/master/CHANGELOG.md)

