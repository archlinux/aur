# Maintainer: Stanisław Jasiewicz <stjasiewicz@gmail.com>
pkgname=nwnsc-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A Neverwinter Nights script compiler (binary version)"
arch=('any')
url="https://github.com/nwneetools/nwnsc"
license=('MIT')
source=("https://github.com/nwneetools/nwnsc/releases/download/v1.1.1/nwnsc-linux-v1.1.1.zip")
md5sums=('bdc3ad95b70c420d6998ea39900a80ac')

package() {
    install -Dm 755 "nwnsc" -t "$pkgdir/usr/bin"
}
