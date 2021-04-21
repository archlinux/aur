# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=discord_db
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Helpful db writen on sqlite3, already has channel vars, global user vars, server user vars and server vars"
arch=(x86_64)
url="https://pypi.org/project/discord-db"
license=('GPL')
groups=()
depends=(python)
makedepends=(python python-setuptools)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://files.pythonhosted.org/packages/fd/e3/67d0b18a06fa55d7bb2d2ee4345638e5450eab43a67bedf732a3a4bc3b87/discord_db-0.1.0.tar.gz")
noextract=()
md5sums=(3e514dfe16f92016e9bf0b1f606beeee)
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	echo "Nothing"
}

build() {
	cd "$pkgname-$pkgver"
	python3 setup.py build
}

check() {
	cd "$pkgname-$pkgver"
	echo "Nothing"
}

package() {
	cd "$pkgname-$pkgver"
	python3 setup.py install --root="$pkgdir"
}
