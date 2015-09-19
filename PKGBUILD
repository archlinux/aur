# Maintainer: Pad Ster <padspambox at gmail dot com>

pkgname=hostblock-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple terminal interface for blocking websites via the /etc/hosts file. Binary package."
arch=('x86_64')
url="https://github.com/cgag/hostblock"
license=('AGPL')

source=("https://github.com/cgag/hostblock/releases/download/v$pkgver/hostblock")
noextract=("${source[@]%%::*}")
sha256sums=(4c1cff8d565f29d872859013788a4c253cb4e9ad1fe1a1dc7db22fb47c97f483)

package() {
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	install hostblock $pkgdir/usr/bin/
}
