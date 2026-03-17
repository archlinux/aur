# Maintainer: aloy555 <hltss1347@gmail.com>
pkgname=music-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="A small tool to download youtube music."
arch=('any')
url="https://aur.archlinux.org/packages/music-cli"
license=('MIT')
depends=(
    'python'
    'yt-dlp'
    'ffmpeg'
    'python-requests'
)
optdepends=(
    'python-ua-generator: random user agent support'
)
source=("music-cli.py")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/music-cli.py" "$pkgdir/usr/bin/music-cli"
}
