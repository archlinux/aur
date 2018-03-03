# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
pkgname=python2-internetarchive
pkgver=1.7.6
pkgrel=2
pkgdesc="A python interface to archive.org"
arch=('any')
url="https://github.com/jjjake/internetarchive"
license=('AGPL3')
depends=('python2' 'python2-requests' 'python2-jsonpatch' 'python2-docopt' 'python2-clint' 'python2-six' 'python2-schema' 'python2-backports.csv')
makedepends=('python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jjjake/internetarchive/archive/v${pkgver}.tar.gz")
md5sums=('d6caa2038d2347329bf78e5e30a21582')

package() {
  cd "internetarchive-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}
