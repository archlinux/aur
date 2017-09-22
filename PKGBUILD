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
validpgpkeys=('2AAD360C4E62BF09D814B4B5E5CB73CCC1ACB118')   # Mattéo Rossillol-Laruelle
source=("https://github.com/CompFile/My_AUR_PKG/raw/master/$pkgname/$pkgname-$pkgver.r$pkgrel.tar.gz"{,.sig})
md5sums=('8998c97b0841341ae42b40cda26af6a0'
         'SKIP')

package()
{
    install -d $pkgdir/usr/share/icons
    cd "$srcdir"
    cp -r $pkgname-$pkgver.r$pkgrel $pkgdir/usr/share/icons/
}
