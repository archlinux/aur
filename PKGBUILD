# Maintainer: Eray Erdin <eraygezer.94@gmail.com>
pkgname='tgcli'
pkgver='0.3.1'
pkgrel=1
epoch=
pkgdesc='A terminal client for Telegram.'
arch=('any')
url="https://github.com/erayerdin/tgcli"
license=('Apache')
groups=()
depends=()
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/erayerdin/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('96b695e07734c145e9a87308e78ee8e2')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	sudo python setup.py install
}
