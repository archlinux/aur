# Contributor: giga300 <giga300[at]protonmail[dot]com>
# Maintainer: giga300 <giga300[at]protonmail[dot]com>

pkgname=4nxci-bin
pkgver=v4.03
pkgrel=1
pkgdesc='4NXCI is a tool for converting XCI(NX Card Image) files to NSP'
arch=('any')
url="https://github.com/The-4n/4NXCI"
license=('ISC')
provides=("4nxci-git")
conflicts=("4nxci-git")
source=("https://github.com/giga300/4NXCI-linux/releases/download/${pkgver}/${pkgname%-bin}")
sha256sums=('76cc86cd5f264a1a936605db7b54b870b15e1add0086e4976dffa92ff1f45fa7')

package() {
    cd "$srcdir"
    install -Dm755 "$srcdir/${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}