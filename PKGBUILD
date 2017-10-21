# By MBC (Matteo's Basic Computing)
# Maintainer : Matteo Rossillol <mbasiccomputing(at)gmail(dot)com>


pkgname=breath-icon-theme-mbc
pkgver=0.3.0    
pkgrel=2
arch=('any')
url="https://github.com/CompFile/My_AUR_PKG/tree/master/PKG/$pkgname/"
pkgdesc="It's breath icon theme revisited by MBC" 
license=('LGPL')
groups=('MBC')
replaces=('breath-icon-theme')
source=("git://github.com/CompFile/Breath-MBC#tag=v$pkgver-$pkgrel")
sha256sums=('SKIP')

package()
{
    install -d $pkgdir/usr/share/icons
    cd "$srcdir"
    rm -r Breath-MBC/.git
    cp -r Breath-MBC $pkgdir/usr/share/icons/
}
