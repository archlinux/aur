# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=icesimple-icewm-theme
pkgver=1.0.1
pkgrel=1
pkgdesc="IceSimple is an IceWM port of the 'Simple' Metacity theme."
arch=('any')
url="https://www.box-look.org/p/1018247/"
license=('GPLv2+')
depends=('icewm')
source=("https://dl.opendesktop.org/api/files/download/id/1460770096/59839-IceSimple.tar.gz")
sha256sums=('041f02b07d3e788d357a6800b48678976dec9671ff54f55840643522a5775975')

package() {
	mkdir -p "${pkgdir}/usr/share/icewm/themes"
	cp -r "${srcdir}/IceSimple" "${pkgdir}/usr/share/icewm/themes/"
}
