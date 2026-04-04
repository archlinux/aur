# Maintainer: aloy555 <hltss1347@gmail.com>
pkgname=music-cli
pkgver=1.0.0
pkgrel=4
pkgdesc="A small tool to download youtube music."
arch=('any')
url="https://aur.archlinux.org/packages/music-cli"
license=('MIT')
depends=(
    'python'
    'yt-dlp'
    'ffmpeg'
    'flac'
    'python-requests'
)
optdepends=(
    'python-ua-generator: random user agent support'
)
source=("music-cli.py")
sha256sums=('e0d94fe7191d1bf7a08fda865b957d827bef7cc0abdcdcc69e2b2185516615f8')

package() {
    install -Dm755 "$srcdir/music-cli.py" "$pkgdir/usr/bin/music-cli"
}
