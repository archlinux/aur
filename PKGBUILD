# Maintainer: RamazanBerk20 <ramazanberksirin@protonmail.com>
pkgname=mini-downloader-bin
pkgver=3.3.0
pkgrel=2
pkgdesc="Lightweight native download manager (aria2 + yt-dlp, browser capture) — binary release"
arch=('x86_64')
options=('!strip' '!debug')
url="https://github.com/RamazanBerk20/mini-downloader"
license=('GPL-3.0-or-later')
depends=('aria2' 'fontconfig' 'libx11' 'libxcb' 'libxcursor' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'libxrandr' 'wayland' 'xdg-utils')
optdepends=('yt-dlp: video, HLS, and DASH downloads'
            'ffmpeg: merge media streams, embed subtitles/thumbnails, and convert audio')
provides=('mini-downloader')
conflicts=('mini-downloader' 'mini-downloader-git')
source=("$url/releases/download/v$pkgver/Mini.Downloader_${pkgver}_linux-x86_64.tar.gz")
noextract=("Mini.Downloader_${pkgver}_linux-x86_64.tar.gz")
# Replace with updpkgsums after the release asset is published.
sha256sums=('95b1d5bd43bdc8200beac170242c147fb3df6fbd35c44db04ff8dcd2b99be920')

package() {
  bsdtar -xf "$srcdir/Mini.Downloader_${pkgver}_linux-x86_64.tar.gz" \
    -C "$pkgdir"
}
