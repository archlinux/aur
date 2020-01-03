# Maintainer: Tony Finn <aur at tonyfinn dot com>
# Contributor: scsnow54@gmail.co

pkgname=mopidy-podcast-itunes
_pypiname=Mopidy-Podcast-iTunes
pkgver=3.0.0
pkgrel=1
pkgdesc="Mopidy-Podcast extension for searching and browsing podcasts on the iTunes Store"
arch=('any')
url="https://github.com/tkem/mopidy-podcast-itunes"
license=('APACHE')
depends=(
	'python-setuptools'
    'python>=3.0',
	'mopidy>=3.0'
	'mopidy-podcast>=3.0'
	'python-pykka>=2.0.1'
	'python-requests>=2.0'
)
makedepends=('python' 'git')
source=("https://pypi.python.org/packages/source/M/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('d6fc73c113eb462b2f81b816a8695b0b')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
