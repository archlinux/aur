# Maintainer: Márton Szabó <notramo@vipmail.hu}

pkgname="arch-anywhere-lang-tool-git"
pkgver="0.1"
pkgrel=1
pkgdesc="A simple tool for maintain Arch Linux Anywhere translation files."
arch=('i686' 'x86_64')
url="git+https://github.com/notramo/arch-anywhere-lang-tool"
license=('WTFPL')
depends=()
makedepends=('gcc')
provides=('arch-anywhere-lang-tool')
conflicts=('arch-anywhere-lang-tool')
source=("$url.git")
md5sums=('SKIP')

build() {
	cd $srcdir/arch-anywhere-lang-tool
	g++ -o arch-anywhere-lang-tool arch-anywhere-lang-tool.cpp
}

package() {
	cd "arch-anywhere-lang-tool"
	install -D arch-anywhere-lang-tool $pkgdir/usr/bin/arch-anywhere-lang-tool
}
