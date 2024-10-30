# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=icesimple-icewm-theme
pkgver=1.0.1
pkgrel=3
pkgdesc="IceSimple is an IceWM port of the 'Simple' Metacity theme."
arch=('any')
url="https://www.box-look.org/p/1018247/"
license=('GPLv2+')
depends=('icewm')
source=('59839-IceSimple.tar.gz::https://files.catbox.moe/p9n1uv.gz')
sha512sums=('561c3ebfd6b0f1518319c917a29eac975271f069d1db63fbfc07095f10822e1ca5df34e4e4dd6543353267341fdf657ba679a82621b088470ac079e6e5731a65')

package() {
	mkdir -p "${pkgdir}/usr/share/icewm/themes"
	cp -r "${srcdir}/IceSimple" "${pkgdir}/usr/share/icewm/themes/"
}
