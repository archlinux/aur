# Maintainer: Felipe Facundes

pkgname=preview
pre_ver=1.0
pkgver=1.0.5
pkgrel=1
pkgdesc='A simple file manager written in Bash with file preview capabilities, inspired by fff, lesspipe, and ranger.'
arch=('any')
url='https://github.com/felipefacundes/preview'
license=('GPL')
depends=(
    'bash'
    'mediainfo'
    'viu'
    'poppler'
    'imagemagick'
    'ffmpeg'
    'libarchive'
    'tar'
    '7zip'
    'bat'
)
optdepends=(
    'atool: for previews and extraction of various archives (e.g., zip, tar, rar)'
    'elinks: for previews of HTML pages'
    'source-highlight: for syntax highlighting of code in text previews'
    'highlight: for syntax highlighting of code in text previews'
    'imagemagick: for video previews and auto-rotating image previews based on EXIF data'
    'lynx: for previews of HTML pages'
    'w3m: for previews of HTML pages and images in terminal'
    'mediainfo: for viewing detailed information about media files'
    'odt2txt: for previews of OpenDocument text files (.odt)'
    'pandoc: for converting and previewing various document formats (e.g., .docx, .md)'
    'antiword: for previews of Microsoft Word documents (.doc)'
    'catdoc: for previews of Microsoft Word documents (.doc) and RTF files'
    'unrtf: for previews of Rich Text Format files (.rtf)'
    'perl-image-exiftool: for viewing metadata of media files (e.g., EXIF, ID3)'
    'poppler: for previews of PDF files (provides pdftotext)'
    'transmission-cli: for viewing BitTorrent file information'
    'libsixel: for previews of images using img2sixel'
    'viu: for previews of images in the terminal'
    'catimg: for previews of images in the terminal'
    'chafa: for previews of images in the terminal'
    'glow: for enhanced Markdown previews with styling'
    'bat: for syntax-highlighted previews of text and code files'
    'mdless: for Markdown previews in the terminal'
    'mdcat: for Markdown previews with formatting in the terminal'
    'less: for paginated previews of text files'
    'unzip: for extracting and previewing zip archives'
    'tar: for extracting and previewing tar archives'
    'libarchive: for extracting and previewing tar archives'
    '7zip: for extracting and previewing various archive formats (e.g., .7z, .rar)'
    'unrar: for extracting and previewing RAR archives'
    'bzip2: for handling bzip2-compressed archives'
    'gzip: for handling gzip-compressed archives'
    'xz: for handling xz-compressed archives'
    'unzip: for creating and previewing zip archives'
    'ffmpeg: for extracting metadata or thumbnails from video/audio files'
    'file: for identifying file types in previews'
    'stat: for detailed file statistics in previews'
    'strings: for extracting readable text from binary files'
    'jq: for parsing and previewing JSON files'
    'csvtable: for previews of CSV files'
    'csvlook: for previews of CSV files'
)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname" || true
  echo "${pre_ver}.$(git rev-list --count HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname" || true
}

build() {
    cd "$srcdir/$pkgname" || true
}

check() {
    cd "$srcdir/$pkgname" || true
}

package() {
    cd "$srcdir/$pkgname" || true
    install -Dm755 "preview" "$pkgdir/usr/bin/preview"
    install -Dm644 "preview.desktop" "$pkgdir/usr/share/applications/preview.desktop"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "preview.1.gz" "$pkgdir/usr/share/man/man1/preview.1.gz"
}
