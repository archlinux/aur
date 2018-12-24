# Maintainer: robertfoster
# Contributor: Robert Booster > booster.devel@gmail.com

pkgname=python-gmusicapi
pkgver="11.1.1"
pkgrel=1
pkgdesc="An unofficial client library for Google Music"
arch=('any')
url="https://github.com/simon-weber/gmusicapi"
license=('BSD')
depends=('python-validictory' 'python-decorator' 'python-requests' 'python-dateutil'
	'python-proboscis' 'python-protobuf' 'python-oauth2client' 'python-mock'
'python-appdirs' 'python-gpsoauth' 'python-mechanicalsoup' 'python-six' 'python-future' 'mutagen')
makedepends=('python-setuptools')
source=("https://github.com/simon-weber/gmusicapi/archive/$pkgver.tar.gz")

package() {
	cd "${pkgname##python-}-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('0414c5361e4317a5e126372d1a22d9f6')
