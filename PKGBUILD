# Maintainer: Nathan Monfils <nathan.monfils@destiny.be>
_pkgname=connect-me-desktop
pkgname=${_pkgname}-bin
pkgver=3.0.0
pkgrel=3
epoch=
pkgdesc="Connect Me Desktop Linux"
arch=('x86_64')
url="https://store.connectme.io"
license=('unknown')
depends=()
makedepends=()

_zipfile="${_pkgname}_${pkgver}_linux_x64.zip"
source=("$_pkgname-$pkgver::https://store.connectme.io/app/$_zipfile" "ConnectMeDesktop.desktop" "ConnectMeDesktop")
noextract=()
md5sums=(d577d22bb7ca01505420608b5ff221d9 76bc4af92f4886fab2db0a818c0f717e 307ba78b421a0344114df85b5f711341)
validpgpkeys=()

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
	mkdir -p "$pkgdir"/opt/ConnectMeDesktop
	mkdir -p "$pkgdir"/usr/share/applications
	mkdir -p "$pkgdir"/usr/bin

	cp -r ./{*.nw,nwjs-*} "$pkgdir"/opt/ConnectMeDesktop
	cp "$srcdir"/ConnectMeDesktop.desktop "$pkgdir"/usr/share/applications
	cp "$srcdir"/ConnectMeDesktop "$pkgdir"/usr/bin
	chmod +x "$pkgdir"/usr/bin/ConnectMeDesktop
}
