# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=flashplayer-projector
pkgver=28.0.0.126
pkgrel=1
pkgdesc="Standalone (a.k.a. projector) version of Adobe's Flash Player"
arch=('x86_64')
url='http://www.adobe.com/support/flashplayer/debug_downloads.html'
license=('LGPL' 'custom:Adobe')
depends=('gtk2' 'nss' 'libgl')
source=("https://fpdownload.macromedia.com/pub/flashplayer/updaters/${pkgver%%.*}/flash_player_sa_linux.x86_64.tar.gz")
sha256sums=('93557d22ceff2287b01c113b4f08eb995d382b5f992f6403a85ba62b7929b293')

package() {
	install -Dm644 license.pdf "${pkgdir}/usr/share/licenses/${pkgname}/license.pdf"
	install -Dm755 flashplayer "${pkgdir}/usr/bin/flashplayer"
}
