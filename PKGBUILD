# Maintainer: M0Rf30

pkgname=blindelephant-svn
pkgver=7
pkgrel=1
pkgdesc="The BlindElephant Web Application Fingerprinter attempts to discover the version of a (known) web application by comparing static files at known locations "
url="http://blindelephant.sourceforge.net/"
arch=('i686' 'x86_64')   
makedepends=('subversion')
depends=('python2')
license=(LGPL)
source=("blindelephant::svn+https://svn.code.sf.net/p/blindelephant/code/trunk")

package() {
  cd blindelephant/src
  python2 setup.py install --root=$pkgdir

}

pkgver() {
  cd blindelephant
  svnversion | tr -d [A-z]
}

md5sums=('SKIP')
