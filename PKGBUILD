# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=scala-scala3-symlink
pkgver=1
pkgrel=1
pkgdesc='Replace scala with scala3'
arch=('any')
url='https://scala-lang.org'
license=('Apache')
depends=('scala3')
conflicts=('scala')

package() {
    install -d "$pkgdir/usr/bin"

    local _file
    for _file in scala; do
        ln -s scala3 "$pkgdir/usr/bin/$_file"
    done
}

