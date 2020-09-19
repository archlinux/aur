# Maintainer: Stanisław Jasiewicz <stjasiewicz@gmail.com>
pkgname=nwnsc-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="A Neverwinter Nights script compiler (binary version)"
arch=('any')
url="https://github.com/nwneetools/nwnsc"
license=('MIT')
conflicts=('nwnsc-git')
source=("https://github.com/nwneetools/nwnsc/releases/download/v1.1.2/nwnsc-linux-v1.1.2.zip")
md5sums=('898869a925d1f6f9a5eced980383246a')

package() {
    install -Dm 755 "nwnsc" -t "$pkgdir/usr/bin"
}
