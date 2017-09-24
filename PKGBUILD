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
sha256sums=('d04bb5fbd81ff17d5c70a415b8150f35573aaf49d30383e1b46587124c953996'
            'SKIP')

package()
{
    install -d $pkgdir/usr/share/icons
    cd "$srcdir"
    cp -r $pkgname $pkgdir/usr/share/icons/
}
