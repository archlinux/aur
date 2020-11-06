# Maintainer: Liang Wei <weiliang1503@yandex.com>
pkgname=gwm-git
pkgver=0.8
pkgrel=1
epoch=
pkgdesc="A modern tilling windows manager for X11"
arch=('x86_64')
url="https://sourceforge.net/projects/gsmwm/"
license=('GPL')
depends=('bash' 'libx11')
makedepends=('git')
source=("gwm-git::git+https://git.code.sf.net/p/gsmwm/code")
noextract=("${source[@]##*/}")
md5sums=('SKIP')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make prefix="$pkgdir/usr/" install
}
