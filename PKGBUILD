# Maintainer: aloy555 <hltss1347@gmail.com>
pkgname=music-cli
pkgver=1.0.0
pkgrel=2
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
sha256sums=('2f172a03c64bde2f38fd7956920a5f425f23653e15b874c6bd03270ec3dfe9cc')

package() {
    install -Dm755 "$srcdir/music-cli.py" "$pkgdir/usr/bin/music-cli"
}
