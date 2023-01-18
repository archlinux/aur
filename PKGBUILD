# Maintainer: Nixuge

pkgname=cider-polybar-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='A PolyBar custom script to interact with Cider - An open-source, community-oriented Apple Music'
url=https://github.com/tnguye20/cider-polybar
arch=(x86_64)
license=(GNU3)
options=(!strip)
source=("https://github.com/tnguye20/cider-polybar/releases/download/v.${pkgver}/cider-polybar.tar.gz")
noextract=("cider-polybar.tar.gz")
sha256sums=('73dfca88fa532df46b390136a77c5937eb3135e9296f265185ead75d062a2629')


package() {
	install -d "${pkgdir}/usr/local/bin/"
	tar -C "${pkgdir}/usr/local/bin/" -xvf cider-polybar.tar.gz
}
