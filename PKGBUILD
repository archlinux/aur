# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=flashplayer-projector
pkgver=27.0.0.187
pkgrel=1
pkgdesc="Standalone (a.k.a. projector) version of Adobe's Flash Player"
arch=('x86_64')
url='http://www.adobe.com/support/flashplayer/debug_downloads.html'
license=('LGPL' 'custom:Adobe')
depends=('gtk2' 'nss' 'libgl')
source=("https://fpdownload.macromedia.com/pub/flashplayer/updaters/${pkgver%%.*}/flash_player_sa_linux.x86_64.tar.gz")
sha256sums=('1c026dcd1a1a710c5b0eb7bbb6d6f37c43cf42fdad91c02475302c3cd8e9dc4f')

package() {
	install -Dm644 license.pdf "${pkgdir}/usr/share/licenses/${pkgname}/license.pdf"
	install -Dm755 flashplayer "${pkgdir}/usr/bin/flashplayer"
}
