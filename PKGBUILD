# Maintainer: weilinfox <weilinfox at inuyasha dot love>
pkgname=debspawn
pkgver=0.6.0
pkgrel=2
epoch=
pkgdesc='Debspawn is a tool to build Debian packages in an isolated environment, using systemd-nspawn containers'
arch=('any')
url="https://github.com/lkhq/debspawn"
license=('LGPL3')
depends=('libxslt' 'docbook-xsl' 'python' 'zstd' 'debootstrap' 'python-tomlkit')
makedepends=('python-setuptools' 'python-pkgconfig')
source=("https://github.com/lkhq/debspawn/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('2c9a055791d128bfa0aa14e155054e42')

prepare() {
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root=$pkgdir
}

