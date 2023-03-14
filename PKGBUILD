# Maintainer: Deltara <boided420 at gmail dot com>
pkgname="spwn-bin"
pkgver=0.8
pkgrel=3
pkgdesc="A language for Geometry Dash triggers."
arch=('x86_64')
url="https://www.github.com/Spu7Nix/SPWN-language"
license=('MIT')
provides=('spwn')
conflicts=('spwn')
depends('openssl-1.1')
source=('https://github.com/Spu7Nix/SPWN-language/releases/download/v0.8-beta/spwn-0.0.8-x86_64.tar.gz')
sha256sums=('36aeeb2e59480be6e2a238e10cc75c67b994a68c0c5e26592f39c0db47eaba34')
install=spwn-bin.install

package() {
	install -Dm755 spwn/spwn ${pkgdir}/usr/bin/spwn-bin/spwn
	cp -r spwn/libraries/ ${pkgdir}/usr/bin/spwn-bin/libraries/
	chmod -R 644 ${pkgdir}/usr/bin/spwn-bin/libraries/
}
