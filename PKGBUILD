# Maintainer: scsnow54@gmail.com 

pkgname=mopidy-podcast-itunes
_pypiname=Mopidy-Podcast-iTunes
pkgver=2.0.0
pkgrel=1
pkgdesc="Mopidy-Podcast extension for searching and browsing podcasts on the iTunes Store"
arch=('any')
url="https://github.com/tkem/mopidy-podcast-itunes"
license=('APACHE')
depends=(
	'python2-setuptools'
	'mopidy>=1.1'
	'mopidy-podcast>=2.0'
	'python2-pykka>=1.1'
	'python2-requests>=2.0'
)
makedepends=('python2' 'git')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('48e1d489010f52329a044d951460ec34')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
