# Maintainer: Brian Clemens <brian@teknik.io>
# Maintainer: Mahor Foruzesh <mahorforuzesh at pm dot me>

pkgname=dict-freedict-jpn-eng
pkgver=0.1
pkgrel=1
pkgdesc="Japanese -> English dictionary for dictd et al. from Freedict.org"
arch=('any')
url="http://www.freedict.org/"
license=('GPL')
optdepends=('dictd: dict client and server')
install=$pkgname.install
source=("https://sourceforge.net/projects/freedict/files/jpn-eng/$pkgver/freedict-jpn-eng-$pkgver.dictd.tar.xz")
md5sums=('9b19c068c6a112e42c188962494969cd')

package()
{
    mkdir -p "$pkgdir/usr/share/dictd"
    cp jpn-eng/jpn-eng.{dict.dz,index} "$pkgdir/usr/share/dictd/"
}
