# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
[Unreleased]: https://github.com/steganogram/stegano-rs/compare/v0.5.3...HEAD

## [0.5.3] - 2023-04-11
[0.5.3]: https://github.com/steganogram/stegano-rs/compare/v0.5.2...v0.5.3

### 🛠️ Maintenance
- build(deps): bump dependencies [#115](https://github.com/steganogram/stegano-rs/pull/115)

### Contributors
- [sassman](https://github.com/sassman)

## [0.5.2] - 2022-10-07
[0.5.2]: https://github.com/steganogram/stegano-rs/compare/v0.5.1...v0.5.2

### 🛠️ Maintenance
- chore(clippy): make clippy happy and bump dependencies [#90](https://github.com/steganogram/stegano-rs/pull/90)

### Contributors
- [sassman](https://github.com/sassman)

## [0.5.1] - 2022-04-18
[0.5.1]: https://github.com/steganogram/stegano-rs/compare/v0.5.0...v0.5.1
### 🛠️ Maintenance
- chore(clippy): make clippy happy [#69](https://github.com/steganogram/stegano-rs/pull/69)
- build(deps): bump clap from 2.34.0 to 3.1.8 [#69](https://github.com/steganogram/stegano-rs/pull/69)
- build(deps): bump bitstream-io from 1.2.0 to 1.3.0 [#69](https://github.com/steganogram/stegano-rs/pull/69) 
- build(deps): bump zip from 0.5.13 to 0.6.0 [#69](https://github.com/steganogram/stegano-rs/pull/69)
- build(deps): bump image from 0.23.14 to 0.24.1 [#69](https://github.com/steganogram/stegano-rs/pull/69)
- build(deps): bump tempfile from 3.2.0 to 3.3.0 [#69](https://github.com/steganogram/stegano-rs/pull/69)

### Contributors
- [sassman](https://github.com/sassman)

## [0.5.0] - 2021-12-09
[0.5.0]: https://github.com/steganogram/stegano-rs/compare/v0.4.10...v0.5.0
### ✨ Features
- [image color channel step customization](https://github.com/steganogram/stegano-rs/pull/50)
  introducing a new experimental cli argument `--x-color-step-increment <number>` that allows for custom increments
  that decide which color channels to take.
  For example ``--x-color-step-increment 2` would take the 0, the 2nc, the 4th, the 6th and so on color channel 
  when iterating over pixels. Note that > 4 is the 2nd pixel, > 8 the 3rd pixel and so on.

### Contributors
- [sassman](https://github.com/sassman)

## [0.4.10] - 2021-11-15
[0.4.10]: https://github.com/steganogram/stegano-rs/compare/v0.4.9...v0.4.10

### 🛠️ Maintenance
- [chore(deps): bump versions](7f4aba395002a2c5beaba3ba8b58548e4f7c9723)

### Contributors
- [sassman](https://github.com/sassman)

## [0.4.9] - 2021-05-07
[0.4.9]: https://github.com/steganogram/stegano-rs/compare/v0.4.8...v0.4.9
### 🛠️ Maintenance
- [chore(deps): strip unused deps](https://github.com/steganogram/stegano-rs/pull/35)

### Contributors
- [sassman](https://github.com/sassman)

## [0.4.8] - 2021-05-01
### 🛠️ Maintenance
- [build(deps): bump block-modes from 0.7.0 to 0.8.1](https://github.com/steganogram/stegano-rs/pull/32)
- [Upgrade to GitHub-native Dependabot](https://github.com/steganogram/stegano-rs/pull/30)
- [build(deps): bump zip from 0.5.11 to 0.5.12](https://github.com/steganogram/stegano-rs/pull/29)
- [build(deps): bump deflate from 0.9.0 to 0.9.1](https://github.com/steganogram/stegano-rs/pull/28)
- [release(v0.4.7): add date+version+changes to the changelog](https://github.com/steganogram/stegano-rs/pull/27)
- [build(deps): bump byteorder from 1.4.2 to 1.4.3](https://github.com/steganogram/stegano-rs/pull/26)

### Contributors
- [dependabot-preview[bot]](https://github.com/apps/dependabot-preview)
- [sassman](https://github.com/sassman)

## [0.4.7] - 2021-03-14
### 🛠️ Maintenance
- [build(deps): bump byteorder from 1.4.2 to 1.4.3](https://github.com/steganogram/stegano-rs/pull/26)

## [0.4.6] - 2021-03-05
### 🛠️ Maintenance
- [build(deps): bump image from 0.23.13 to 0.23.14](https://github.com/steganogram/stegano-rs/pull/24)
- [build(deps): bump zip from 0.5.10 to 0.5.11](https://github.com/steganogram/stegano-rs/pull/23)
- [build(deps): bump bzip2 from 0.4.1 to 0.4.2](https://github.com/steganogram/stegano-rs/pull/22)
- [build(deps): bump thiserror from 1.0.23 to 1.0.24](https://github.com/steganogram/stegano-rs/pull/21)
- [build(deps): bump image from 0.23.12 to 0.23.13](https://github.com/steganogram/stegano-rs/pull/20)
- [build(deps): bump zip from 0.5.9 to 0.5.10](https://github.com/steganogram/stegano-rs/pull/19)
- [build(deps): bump image from 0.23.12 to 0.23.13](https://github.com/steganogram/stegano-rs/pull/18)
- [build(deps): bump deflate from 0.8.6 to 0.9.0](https://github.com/steganogram/stegano-rs/pull/17)
- [build(deps): bump criterion from 0.3.3 to 0.3.4](https://github.com/steganogram/stegano-rs/pull/16)
- [build(deps): bump tempfile from 3.1.0 to 3.2.0](https://github.com/steganogram/stegano-rs/pull/14)

## [0.4.5] - 2021-01-09
### 🛠️ Maintenance
- CHANGELOG.md follows now a [new format](https://keepachangelog.com/en/1.0.0/)
- Refactored CI Pipeline for efficiency
### Fixed
- broken link in the CHANGELOG.md
- outdated dependencies are now up2date

## [0.4.1] - 2020-09-23
### ✨ Features
- **Add WAV Audio media file support - by [sassman], [pull/6]**
  `stegano` has now support for input and output wav audio files (*.wav). This means that hiding secret messages and files are now **not** only possible for png image media files but also wav audio files in the same way. For example like this:

  ```sh
  ❯ stegano hide \
    -i resources/plain/carrier-audio.wav \
    -d resources/secrets/Blah.txt \
       resources/secrets/Blah-2.txt \
    -o secret.wav
  ``` 

  [sassman]: https://github.com/sassman
  [pull/6]: https://github.com/steganogram/stegano-rs/pull/6
    
- **Add Arch Linux packages - by [orhun], [pull/10]**
  `stegano` can now be installed from available [AUR packages](https://aur.archlinux.org/packages/?O=0&SeB=b&K=stegano&outdated=&SB=n&SO=a&PP=50&do_Search=Go) using an [AUR helper](https://wiki.archlinux.org/index.php/AUR_helpers). For example like this:

  ```sh
  ❯ yay -S stegano
  ```

  [orhun]: https://github.com/orhun
  [pull/10]: https://github.com/steganogram/stegano-rs/pull/10

### 🛠️ Maintenance
- **Update `stegano-core` to latest dependencies - by [sassman], [pull/2]**
  [sassman]: https://github.com/sassman
  [pull/6]: https://github.com/steganogram/stegano-rs/pull/6

## [0.4.0] - 2020-09-23
### Added
- **WAV Audio media file support - by [sassman], [pull/6]** 
    `stegano` has now support for input and output wav audio files (*.wav). This means that hiding secret messages and files are now **not** only possible for png image media files but also wav audio files in the same way. For example like this: 
    ```sh
    ❯ stegano hide \
        -i resources/plain/carrier-audio.wav \
        -d resources/secrets/Blah.txt \
           resources/secrets/Blah-2.txt \
        -o secret.wav
    ```
- **Arch Linux packages - by [orhun], [pull/10]**
    `stegano` can now be installed from available [AUR packages](https://aur.archlinux.org/packages/?O=0&SeB=b&K=stegano&outdated=&SB=n&SO=a&PP=50&do_Search=Go) using an [AUR helper](https://wiki.archlinux.org/index.php/AUR_helpers). For example like this:
    ```sh
    ❯ yay -S stegano
    ```

### Changed 
- **Update `stegano-core` to latest dependencies - by [sassman], [pull/2]**

[sassman]: https://github.com/sassman
[orhun]: https://github.com/orhun
[pull/6]: https://github.com/steganogram/stegano-rs/pull/6
[pull/10]: https://github.com/steganogram/stegano-rs/pull/10
[pull/2]: https://github.com/steganogram/stegano-rs/pull/2

## [0.3.2] - 2020-07-10
### Added 
- Changelog based on conventional-commits

## [0.3.1] - 2020-07-07
### Added
- Support for the legacy content version 2
- Support for hiding multiple files at once
- Benchmarks for image en/de-coding see `cargo bench`
- More end to end test cases
- Badges to README.md

### Changed
- Documentation of README.md is now better and more explicit
- Reduce redundancies of properties that can be extracted from `Cargo.toml`

### Fixed
- Typos in cli output and descriptions

[0.4.8]: https://github.com/steganogram/stegano-rs/compare/v0.4.7...v0.4.8
[0.4.7]: https://github.com/steganogram/stegano-rs/compare/v0.4.6...v0.4.7
[0.4.6]: https://github.com/steganogram/stegano-rs/compare/v0.4.5...v0.4.6
[0.4.5]: https://github.com/steganogram/stegano-rs/compare/v0.4.1...v0.4.5
[0.4.1]: https://github.com/steganogram/stegano-rs/compare/v0.4.0...v0.4.1
