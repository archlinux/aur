# Maintainer: Josh Cheatum <cheatumj@protonmail.com>
pkgname=cproj-git
pkgver=r20.7b2514b
pkgrel=1
pkgdesc="A simple cli tool for creating and managing C projects"
arch=(any)
url="https://gitlab.com/jcheatum/cproj"
license=('MPL')
groups=()
depends=('python' 'git')
makedepends=('python-pip') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://gitlab.com/jcheatum/cproj.git")
noextract=("${source[@]%%::*/}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	:
}

build() {
	:
}

check() {
	:
}

package() {
	cd "$srcdir/${pkgname}"
	pip install --root "$pkgdir/" .
}
