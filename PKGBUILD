# Maintainer: Cod3rw <youremail@domain.com>
pkgname=musiccli
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple CLI tool for music playback using Python"
arch=('any')
url="https://github.com/C0d3RW/musicCLI"
license=('MIT')
depends=('python' 'python-requests' 'python-dotenv' 'python-beautifulsoup4' 'python-ytmusicapi' 'python-rich')
source=("musiccli.py")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/musiccli.py" "$pkgdir/usr/bin/musiccli"
}


