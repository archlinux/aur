# Maintainer: Nixuge

pkgname=cider-polybar-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='A PolyBar custom script to interact with Cider - An open-source, community-oriented Apple Music'
url=https://github.com/tnguye20/cider-polybar
arch=(x86_64)
license=(GNU3)
provides=('cider-polybar')
conflicts=('cider-polybar')
options=(!strip)
source=("https://github.com/tnguye20/cider-polybar/releases/download/v.${pkgver}/cider-polybar.tar.gz")
sha256sums=('73dfca88fa532df46b390136a77c5937eb3135e9296f265185ead75d062a2629')


package() {
	# Create the folder
	install -dm755 "${pkgdir}/usr/local/bin/"

	# & move the file inside it
	install -Dm755 \
		"${srcdir}/cider-polybar" \
		"${pkgdir}/usr/local/bin/"
}
