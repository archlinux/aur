# Maintainer: Stanisław Jasiewicz <stjasiewicz@gmail.com>
pkgname=nwnsc-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="A Neverwinter Nights script compiler (binary version)"
arch=('any')
url="https://github.com/nwneetools/nwnsc"
license=('MIT')
conflicts=('nwnsc-git')
source=("https://github.com/nwneetools/nwnsc/releases/download/v1.1.3/nwnsc-linux-v1.1.3.zip")
md5sums=('8d857181597e124f35c34f9bf7f844be')

package() {
    install -Dm 755 "nwnsc" -t "$pkgdir/usr/bin"
}
