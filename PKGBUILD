# $Id: PKGBUILD 117115 2014-08-10 19:55:02Z jelle $
# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Simon Lipp <aur@simon.lipp.name>
# Contributor: Daniel Grana <dangra@gmail.com>

pkgname=s3cmd-git
pkgver=1.5.0rc1
_pkgver=1.5.0-rc1
pkgrel=2
pkgdesc="A command line client for Amazon S3"
arch=('any')
url='http://s3tools.org/s3cmd'
license=('GPL')
depends=('python2' 'python2-dateutil')
optdepends=('gnupg: encrypted file storage')
source=("http://downloads.sourceforge.net/sourceforge/s3tools/$pkgname-$_pkgver.tar.gz")
md5sums=('eb5b461154b72890791c186ccdde13f0')

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  python2 setup.py install --root="$pkgdir"
}
