# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-dbxfs
_pkgname=dbxfs
pkgver=1.0.19
pkgrel=1
pkgdesc="User-space file system for Dropbox"
arch=('i686' 'x86_64')
url="https://github.com/rianhunter/dbxfs"
license=('GPL3')
depends=('fuse2' 'python-appdirs' 'python-block_tracing' 'python-dropbox' 'python-keyring' 'python-privy' 'python-sentry_sdk' 'python-userspacefs')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('0a8f65ab42372544c56c63c5285e1ce4')

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/"
}
