# Maintainer: robertfoster

pkgname=autoindex
pkgver=2.2.4 # renovate: datasource=git-tags depName=https://git.code.sf.net/p/idjc/code
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

sha256sums=('3b54ae9b56c33d9724aaa8bb0fe4677e2e9e37cf036d01da7bb5fb70a035e1ec')
