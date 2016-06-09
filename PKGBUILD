# Maintainer: Israel Herraiz <isra@herraiz.org>
pkgname=geobases
pkgver=5.0.16
pkgrel=2
pkgdesc="Tool and Python module to play with geographical and travel data, and some\
 non-geographical data too."
arch=('any')
url="http://opentraveldata.github.com/geobases/"
license=('CCPL:by-sa-3.0.txt')
groups=()
depends=('python2' 'python2-colorama' 'python2-termcolor' 'python2-yaml' 'python2-levenshtein' 'python2-geohash' 'python2-argparse')
makedepends=()
provides=('geobases')
conflicts=('geobases-git')
replaces=()
backup=()
options=(!emptydirs)
install=
source=('https://pypi.python.org/packages/26/4a/099b2e360e9419b14121b5b549a678ac7a56690ac29e195810bc8bbb0ef5/GeoBases-5.0.16.tar.gz#md5=0bf92b694280d6d4575ea042947327ed')
md5sums=('0bf92b694280d6d4575ea042947327ed')

package() {
  cd "$srcdir/GeoBases-$pkgver"
  /usr/bin/python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
