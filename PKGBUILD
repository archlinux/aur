# Maintainer: Mikele <mikele@gmail.com>
# Contributor: Mikele <mikele@gmail.com>

pkgname=multiringstrobodiscgen-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A handy tool for creating custom stroboscopic discs"
arch=('x86_64')
url="https://github.com/mikelexp/multiringstrobodiscgen"
license=('custom:CC BY-NC 4.0')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/multiringstrobodiscgen-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('4ef639a700b2bdff6827697686df893f83aa954d080da80d8871b97a713fdbbf')

package() {
  cd "${srcdir}"

  install -Dm755 multiringstrobodiscgen "${pkgdir}/usr/bin/multiringstrobodiscgen"
  install -Dm644 icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/mikelexp.multiringstrobodiscgen.png"
  install -Dm644 mikelexp.multiringstrobodiscgen.desktop "${pkgdir}/usr/share/applications/mikelexp.multiringstrobodiscgen.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
