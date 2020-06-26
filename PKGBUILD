pkgname=kwin-scripts-maxmize-to-new-desktop
_pkgname=kwin-maxmize-to-new-desktop
pkgver=0.2.2
pkgrel=1
pkgdesc="KWin script that moves fullscreened window to a new virtual desktop, emulating macOS like maximize to new desktop."
arch=('any')
url="https://store.kde.org/p/1171196/"
license=('BSD 2-Clause')
depends=('kdesignerplugin' 'kwin')
source=("https://github.com/Aetf/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('9220420878a2e70012786af62c00a791b0fddb38190f2b9eafc30ce1a908652bdf257eec392e16ed0263cf39a686279d3dcd94c8bbfa1c67ea105ac9fa494eab')

package() {
  install -d "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  cp -r "${srcdir}"/${_pkgname}-${pkgver}/{contents,doc,metadata.desktop} "${pkgdir}/usr/share/kwin/scripts/${_pkgname}"
  install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/metadata.desktop "${pkgdir}/usr/share/kservices5/${_pkgname}.desktop"
} 
