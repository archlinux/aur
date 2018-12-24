# Maintainer: robertfoster
# Contributor: Robert Booster > booster.devel@gmail.com

pkgbase=python-gmusicapi
pkgname=(python-gmusicapi python2-gmusicapi)
pkgver="11.1.1"
pkgrel=1
pkgdesc="An unofficial client library for Google Music"
arch=('any')
url="https://github.com/simon-weber/gmusicapi"
license=('BSD')
depends=('mutagen')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/simon-weber/gmusicapi/archive/$pkgver.tar.gz")

package_python2-gmusicapi() {
	depends=('python2-validictory' 'python2-decorator' 'python2-requests' 'python2-dateutil'
		'python2-proboscis' 'python2-protobuf' 'python2-oauth2client' 'python2-mock'
	'python2-appdirs' 'python2-gpsoauth' 'python2-mechanicalsoup' 'python2-six' 'python2-future')
	cd "${pkgname##python2-}-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-gmusicapi() {
	depends=('python-validictory' 'python-decorator' 'python-requests' 'python-dateutil'
		'python-proboscis' 'python-protobuf' 'python-oauth2client' 'python-mock'
	'python-appdirs' 'python-gpsoauth' 'python-mechanicalsoup' 'python-six' 'python-future')
	cd "${pkgname##python2-}-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

md5sums=('0414c5361e4317a5e126372d1a22d9f6')
