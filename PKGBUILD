# Maintainer: M0Rf30 <morf3089@gmail.com>

pkgname=mediadownloader
pkgver=1.5.2
pkgrel=2
pkgdesc="Watch, preview, slideshow, download from YouTube and Google Image"
arch=('i686' 'x86_64')
url="http://mediadownloader.cz.cc/"
license=('GPL')
depends=('qt4' 'phonon')

source=(http://prdownloads.sourceforge.net/googleimagedown/${pkgname}_${pkgver}-src.tar.gz
        $pkgname.desktop)

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  qmake-qt4
  make
  make INSTALL_ROOT=$pkgdir install
 
}

md5sums=('b25f7748d30a0c2286e2dfc39c33db18'
         'f1ea77cda5e96091fbfc944e7142eb5b')
