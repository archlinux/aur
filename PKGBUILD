# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=flashplayer-projector
pkgver=27.0.0.183
pkgrel=1
pkgdesc="Standalone (a.k.a. projector) version of Adobe's Flash Player"
arch=('x86_64')
url='http://www.adobe.com/support/flashplayer/debug_downloads.html'
license=('LGPL' 'custom:Adobe')
depends=('gtk2' 'nss' 'libgl')
source=("https://fpdownload.macromedia.com/pub/flashplayer/updaters/${pkgver%%.*}/flash_player_sa_linux.x86_64.tar.gz")
sha256sums=('4833bb49cce06efdbcfa305c0d2dab78eb2f11237b81a8ac14b0d7dceeb20b4b')

package() {
	install -Dm644 license.pdf "${pkgdir}/usr/share/licenses/${pkgname}/license.pdf"
	install -Dm755 flashplayer "${pkgdir}/usr/bin/flashplayer"
}
