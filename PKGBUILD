# Maintainer: Stanisław Jasiewicz <stjasiewicz@gmail.com>
pkgname=nwnsc-bin
pkgver=1.1.5
pkgrel=1
pkgdesc="A Neverwinter Nights script compiler (binary version)"
arch=('any')
url="https://github.com/nwneetools/nwnsc"
license=('MIT')
conflicts=('nwnsc-git')
source=("https://github.com/nwneetools/nwnsc/releases/download/v1.1.5/nwnsc-linux-v1.1.5.zip")
md5sums=('aa2f3db6b92220029c9b662e876efe65')

package() {
    install -Dm 755 "nwnsc" -t "$pkgdir/usr/bin"
}
