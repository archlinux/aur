#By MBC (Matteo's Basic Computing)
#Maintainer : Matteo Rossillol <mbasiccomputing@gmail.com>

pkgname=breath-icon-theme-mbc
pkgver=0.3.0    
pkgrel=1
arch=("any")
pkgdesc="It's breath con theme revisited by MBC" 
url="https://github.com/CompFile/My_AUR_PKG/tree/master/PKG/$pkgname/"
license=("custom")
groups=("MBC")
makedepends=("tar" "gcc")
source=("https://github.com/CompFile/My_AUR_PKG/raw/master/PKG/$pkgname/$pkgname-$pkgver.r$pkgrel.tar.gz")
md5sums=('992a3a82c501b3dd4f5e3589feb3cbdb')


prepare() 
{
    cd "$srcdir"
    echo "#Decompressing $pkgname-$pkgver.r$pkgrel.tar.gz"
    tar -xzvf "$pkgname-$pkgver.r$pkgrel.tar.gz"
    echo "#Removing $pkgname-$pkgver.r$pkgrel.tar.gz"
    rm -v "$pkgname-$pkgver.r$pkgrel.tar.gz"
}

package()
{
    mkdir -p $pkgdir/usr/share/icons
    cd "$srcdir"
    cp -rv $pkgname-$pkgver.r$pkgrel $pkgdir/usr/share/icons/
}
