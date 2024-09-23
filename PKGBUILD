# Maintainer: Trumpetrespas (Please comment on the package to contact me)
_pkgname=todo-or-not
pkgname=python-todo-or-not
pkgver=0.14.4
pkgrel=1
epoch=
pkgdesc="A simple tool that checks your project for TODOs and FIXMEs"
arch=(any)
url="https://github.com/Start-Out/todo-or-not"
license=('GPL3')
groups=()
depends=(python python-typer python-tqdm python-ply)
makedepends=(python-build)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Start-Out/todo-or-not/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('d843132ab710e5d9ffe7f52ee2ff77c4ba89a724dc23c3b49c1e14825838b305')
validpgpkeys=()

prepare() {
	cd "$_pkgname-$pkgver"
}

build() {
	cd "$_pkgname-$pkgver"
	python -m build
}

check() {
	cd "$_pkgname-$pkgver"
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
