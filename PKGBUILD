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
validpgpkeys=('CCA838293E0445BEB825D428B5A1B707E9FCFB7E')   # Mattéo Rossillol-Laruelle
source=("https://github.com/CompFile/My_AUR_PKG/raw/master/$pkgname/$pkgname-$pkgver.r$pkgrel.tar.gz"{,.sig})
md5sums=('8998c97b0841341ae42b40cda26af6a0'
         'SKIP')

package()
{
    install -d $pkgdir/usr/share/icons
    cd "$srcdir"
    cp -r $pkgname $pkgdir/usr/share/icons/
}
