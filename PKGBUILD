# Maintainer: Rafael Silva <silvagracarafael@gmail.com>

pkgname="plasma-splash-arch-moe"
_theme="ArchlinuxMoe"
pkgver=1.0
pkgrel=1
pkgdesc="A Moe themed arch splash screen for KDE Plasma."
arch=("any")
url="https://github.com/perigoso/$pkgname"
license=("GPL")
depends=("plasma-desktop")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/perigoso/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('636fe2136e4a6437aefad5ae8691def5e0c80ddb7beab8573a51ac56da597c17')


package() {
    cd "${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/share/plasma/look-and-feel/"
	cp -dr --no-preserve=ownership "$_theme" "${pkgdir}/usr/share/plasma/look-and-feel/"
}
