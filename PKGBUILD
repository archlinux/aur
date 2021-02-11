# Maintainer: lod <aur@cyber-anlage.de>

pkgname=kwin-scripts-maxmize-to-new-desktop
_pkgname=kwin-maxmize-to-new-desktop
pkgver=0.2.3
pkgrel=1
pkgdesc="KWin script that moves fullscreened window to a new virtual desktop, emulating macOS like maximize to new desktop."
arch=('any')
url="https://store.kde.org/p/1171196/"
license=('BSD 2-Clause')
depends=('kdesignerplugin' 'kwin')
source=("https://github.com/Aetf/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('5f9c22595db7cca059bd2f973838f64e86de272b2bb3b709d5936606bf0c751c4a270d594d29230c82c5fc6739630991f54dee6b2c185844d77206a1523d907c')

package() {
  install -d "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  cp -r "${srcdir}"/${_pkgname}-${pkgver}/{contents,doc,metadata.desktop} "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/metadata.desktop "${pkgdir}/usr/share/kservices5/${_pkgname}.desktop"
} 
