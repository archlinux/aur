# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=scala-scala3-symlink
pkgver=1
pkgrel=2
pkgdesc='Replace scala with scala3 and scalac with scalac3'
arch=('any')
url='https://scala-lang.org'
license=('Apache')
depends=('scala3')
conflicts=('scala')

package() {
    install -d "$pkgdir/usr/bin"

    ln -s scala3 "$pkgdir/usr/bin/scala3"
    ln -s scalac3 "$pkgdir/usr/bin/scalac3"
}

