# Name: v1.5.0 
### URL: https://github.com/ollm/OpenComic/releases/tag/v1.5.0
### published at '2025-06-19T17:08:53Z' by ollm
---
##### 🚀 New Features

- Improve chapter detection in tracking [`ad05a23`](https://github.com/ollm/OpenComic/commit/ad05a2364882227688cccfa2fdf58a21f8e9615c)
- Support for `JP2` image format [`e11046b`](https://github.com/ollm/OpenComic/commit/e11046b4eca758f8b15c1caeb831a235a5f3d62c)
- Support for `JXR` image format [`0e24922`](https://github.com/ollm/OpenComic/commit/0e2492264e1dbc94126c7d79e3e3c50fc426846c)
- Support for `JXL` image format [`bd6fb0a`](https://github.com/ollm/OpenComic/commit/bd6fb0a8c8be3685b48c88fa21bbe2d3c384a491)
- Thumbnail generation speed has been improved [`155f064`](https://github.com/ollm/OpenComic/commit/155f064b4c9716c050a6231e44323169686997ea)
- Support for `HEIC` image format [`4f4b5a1`](https://github.com/ollm/OpenComic/commit/4f4b5a16572ea2bd5aff2e519d473b42d80312fb)
- Option to apply configuration profile based on folder/file label [`71d9ff5`](https://github.com/ollm/OpenComic/commit/71d9ff5655f934e4d710e1833b081e4fddf8d428)
- Option to disable `Align with next horizontal` when reading on double page [`97d8ecd`](https://github.com/ollm/OpenComic/commit/97d8ecdde04c2a5c418440d8fbbf06496b16c8ba)
- Option in setting to adjust gamepad sensitivity [`f309c27`](https://github.com/ollm/OpenComic/commit/f309c27195ccf91b0d20600c06f1af03deee5611)
- Copy image to clipboard [`bb96cef`](https://github.com/ollm/OpenComic/commit/bb96cef97ee1783fc27f3600548a91bb37a96045)
- OPDS support [`b72f32f`](https://github.com/ollm/OpenComic/commit/b72f32f2445b90f13f5e2cc45865c2c17a72af82)
- Button to enable/disable full screen from the more options menu [`5d2ac36`](https://github.com/ollm/OpenComic/commit/5d2ac367c61da97d04cd67526470fb7885c1b3bf)
- Show package versions in About OpenComic [`888d9ba`](https://github.com/ollm/OpenComic/commit/888d9ba2e23241b1868b6a360e7bca1a0bef9586)
- Custom mouse wheel shortcuts [`1db0fc7`](https://github.com/ollm/OpenComic/commit/1db0fc7721e33e0e423f0b57590fd65b80cd5df7)
- Option to configure mouse wheel sensitivity when zooming [`8a80d0a`](https://github.com/ollm/OpenComic/commit/8a80d0acee57daa693ae7029c3f48127958b6a79)
- Option to ignore files and folders that match Regex or File pattern [`670bced`](https://github.com/ollm/OpenComic/commit/670bced3ed7413145119b401f974e15ea482ddf5)
- Authentication support for OPDS (Basic and Digest) [`11c3aa8`](https://github.com/ollm/OpenComic/commit/11c3aa88efbff8adcc3fabbf4b066dcb7120b10a)
- Use safeStorage for passwords and tokens [`6178ded`](https://github.com/ollm/OpenComic/commit/6178dedf1afe13c56b68bd3bd68010d80d30fdc6)
- Change extraction of `RAR` and `TAR` to 7zip to improve performance [`c0c2d6d`](https://github.com/ollm/OpenComic/commit/c0c2d6d61016241e70d4ee475e8d19567b8e71db)
- Add suport for compressed `LZH`, `ACE`, `TAR.GZ`, `TAR.XZ`, `TAR.BZIP2` and `TAR.ZSTD` [`e7e7815`](https://github.com/ollm/OpenComic/commit/e7e7815d7a841c02354f9b5219fcdf348c10543b)
- Support compressed files with password [`9a6ef8e`](https://github.com/ollm/OpenComic/commit/9a6ef8e0a363e72e98634e827c50189bb2841047)
- Show release notes in new version dialog [`e572128`](https://github.com/ollm/OpenComic/commit/e572128aecad5811fb2f1a7b1690bbfe1ebabe82)
- Improved extract performance of big files [`5c50739`](https://github.com/ollm/OpenComic/commit/5c507391939c9e56cb1d304df9b3824116de67f4)
- Support MyAnimeList tracking [`5f40b4a`](https://github.com/ollm/OpenComic/commit/5f40b4af1b70e8cfaad0beb79fec676c9c1c83fe)
- Multi-layer folder labeling/favoriting and header bar filter options [`652a6a5`](https://github.com/ollm/OpenComic/commit/652a6a522b32fb9bf77a8dbfebafc0496050c634)
- Option to disable tap zones [`aa7bb3c`](https://github.com/ollm/OpenComic/commit/aa7bb3cc4350616bc527c622be5ed7ddf2d5d611)
- Refactored navigation history logic (`goBack`, `goForward`, etc.) [`a4b6c3d`](https://github.com/ollm/OpenComic/commit/a4b6c3db4fbd447f6c129da1329d05d16b891074)
- Count images/pages in file info if they are not in the metadata [`fdf8eaf`](https://github.com/ollm/OpenComic/commit/fdf8eaf4cb12d6b6b826b12dbe16bd58d7571142)

##### 🐛 Bug Fixes

- Hide toolbar in full screen [`7dbc3c2`](https://github.com/ollm/OpenComic/commit/7dbc3c297f7d92aa209ca8bf901368e47b63e3a3)
- Gamepad menus do not work correctly [`b997d6b`](https://github.com/ollm/OpenComic/commit/b997d6bb6e05c597306169cb4fbbe035a4ab12d1)
- Sharp crashes on Arch Linux and other distributions [`d60620a`](https://github.com/ollm/OpenComic/commit/d60620a2d3a446fef51cd86eff2dc80b22ccf6ba)
- Add cMap support for PDF.js [`3da7b8e`](https://github.com/ollm/OpenComic/commit/3da7b8ec651964209d1df04248dad2bb8ab693bd)
- Page jumps during zoom animation in vertical reading [`d9f94e7`](https://github.com/ollm/OpenComic/commit/d9f94e7eb5e757a28c6b92f0c3a791fc3be61282)
- Stuttering when decode big images (From sync decode to async when possible) [`d320aad`](https://github.com/ollm/OpenComic/commit/d320aad1d95e886d531dcab5721dc44c125cf028)
- Move zoom using cursor after turning a pages not working property [`3012715`](https://github.com/ollm/OpenComic/commit/30127150751b1de611f95069e748eab68fcd2f51)
- Turn page forward in manga mode (Only on non-arrow keys) [`bdbc0dc`](https://github.com/ollm/OpenComic/commit/bdbc0dc31ab37bdfcef570bf8f2130e39c08861e)
- Check if the file is written to disk when extracting using 7zip [`66d4897`](https://github.com/ollm/OpenComic/commit/66d48977b4ef33b320676d39656d48ea41aff653)
- Wrong size detection for animated AVIF images [`b741e52`](https://github.com/ollm/OpenComic/commit/b741e52c1fffac842a782fc45536eada123edeba)
- Compressed files with unsupported chars in Windows are not correct displayed [`120c86b`](https://github.com/ollm/OpenComic/commit/120c86b847259e4a6d8c1302f6691edd75fcae21)
- Error `Failed to retrieve track metadata` in some images [`1439b9b`](https://github.com/ollm/OpenComic/commit/1439b9b584aa4a3e1703b641c1e7f36f890dff07)

You can see changes made in other versions in the [Changelog 📝](https://github.com/ollm/OpenComic/blob/master/CHANGELOG.md)
