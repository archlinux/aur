# Maintainer: Mikele <mikele@gmail.com>
# Contributor: Mikele <mikele@gmail.com>

pkgname=multiringstrobodiscgen-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A handy tool for creating custom stroboscopic discs"
arch=('x86_64')
url="https://github.com/mikelexp/multiringstrobodiscgen"
license=('custom:CC BY-NC 4.0')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/multiringstrobodiscgen-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('d9164e03e2e31c48ed320a2ab1583a18cad0949bb5078dc96d27f4a6a37c5990')

package() {
  cd "${srcdir}"

  install -Dm755 multiringstrobodiscgen "${pkgdir}/usr/bin/multiringstrobodiscgen"
  install -Dm644 icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/mikelexp.multiringstrobodiscgen.png"
  install -Dm644 mikelexp.multiringstrobodiscgen.desktop "${pkgdir}/usr/share/applications/mikelexp.multiringstrobodiscgen.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
