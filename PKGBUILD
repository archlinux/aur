# Maintainer: M0Rf30

pkgname=autoindex
pkgver=2.2.4
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A Website Directory Indexer and File Manager"
url="http://autoindex.sourceforge.net/"
license=('GPL')
depends=('php' 'php-apache')
source=("http://prdownloads.sourceforge.net/autoindex/AutoIndex-${pkgver}.tar.gz")


package() {

    cd $srcdir/AutoIndex-${pkgver}
    mkdir -p $pkgdir/srv/http/autoindex
    cp -r * ${pkgdir}/srv/http/autoindex
  
    
}

md5sums=('3c8b88c595f39d05ab9e048258b7ee20')
