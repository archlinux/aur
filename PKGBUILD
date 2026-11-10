# Maintainer: RamazanBerk20 <ramazanberksirin@protonmail.com>
pkgname=mini-downloader-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Lightweight native download manager (aria2 + yt-dlp, browser capture) — binary release"
arch=('x86_64')
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
sha256sums=('45f80dd0999074997c1f63c0bcf4940f3b5bf35bc70ffed63cda67377488b61d')

package() {
  bsdtar -xf "$srcdir/Mini.Downloader_${pkgver}_linux-x86_64.tar.gz" \
    -C "$pkgdir"
}
