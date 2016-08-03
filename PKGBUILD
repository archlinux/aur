# Maintainer: juantascon <juantascon.aur@horlux.org>
# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>

pkgname=kedpm
pkgver=0.4.0
pkgrel=6
pkgdesc="A password manager that helps to manage large numbers of passwords."
arch=('i686' 'x86_64')              
url="http://kedpm.sourceforge.net"
license=("GPL")
depends=('python2' 'pygtk' 'pycrypto' 'libglade')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('f1dfb44a990110fddf132c9841f40aa2b9848ade4be56957a8a572574dc2fc28')

package() {
    cd $srcdir/$pkgname-$pkgver/
    python2 setup.py install --prefix $pkgdir/usr
}
