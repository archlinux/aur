# By MBC (Matteo's Basic Computing)
# Maintainer : Matteo Rossillol <mbasiccomputing(at)gmail(dot)com>


_GitName=Breath-MBC
pkgname=breath-icon-theme-mbc
pkgver=0.3.0    
pkgrel=2
arch=('any')
url="https://github.com/MBasicComputing/$_GitName"
pkgdesc="It's breath icon theme revisited by MBC" 
license=('LGPL')
groups=('MBC')
replaces=('breath-icon-theme')
source=("git://github.com/MBasicComputing/$_GitName#tag=v$pkgver-$pkgrel")
sha256sums=('SKIP')

package()
{
    install -d $pkgdir/usr/share/icons
    cd "$srcdir"
    rm -r $_GitName/.git
    cp -r $_GitName $pkgdir/usr/share/icons/
}
