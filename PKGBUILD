# Maintainer: Matthew Gamble

pkgname=fipolate-custom
pkgver=2015.4
pkgrel=1
pkgdesc='Interpolate text files with variables through a fifo via user prompts.'
arch=(any)
license=(GPL)
url="https://github.com/djmattyg007/fipolate-custom"
depends=(python3 python-pyinotify)
provides=('fipolate')
conflicts=('fipolate')
source=("https://github.com/djmattyg007/fipolate-custom/archive/$pkgver.tar.gz")
sha256sums=("88eec9be64e396aee974a1a7ec79f7f61d62186bdb190eb3d42a974a506e3bec")

package () {
    install -Dm755 "$srcdir/fipolate-custom-$pkgver/fipolate" "$pkgdir/usr/bin/fipolate"
}
