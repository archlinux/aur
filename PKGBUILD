# By MBC (Matteo's Basic Computing)
# Maintainer : Matteo Rossillol <mbasiccomputing@gmail.com>


pkgname=breath-icon-theme-mbc
pkgver=0.3.0    
pkgrel=1
arch=("any")
url="https://github.com/CompFile/My_AUR_PKG/tree/master/PKG/$pkgname/"
pkgdesc="It's breath icon theme revisited by MBC" 
license=("LGPL")
groups=("MBC")
makedepends=("tar")
source=("https://github.com/CompFile/My_AUR_PKG/raw/master/PKG/$pkgname/$pkgname-$pkgver.r$pkgrel.tar.gz")
md5sums=('992a3a82c501b3dd4f5e3589feb3cbdb')

package()
{
    install -d $pkgdir/usr/share/icons
    cd "$srcdir"
    install -m644 $pkgname-$pkgver.r$pkgrel $pkgdir/usr/share/icons/
}
