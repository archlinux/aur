# Maintainer: whriedplanck

pkgname=powdertoy-bin
pkgver=96.2
pkgrel=1
pkgdesc="Desktop version of the classic falling sand physics sandbox, simulates air
    pressure, velocity & heat!"
arch=('x86_64')
url="https://powdertoy.co.uk/"
license=('GPL3')
depends=('openssl')
source=("https://powdertoy.co.uk/Download/powder-lin64.zip"
        powdertoy-tpt.desktop)
sha1sums=('1209697e762fffba5b50ba988709bf00d3bedf21'
          'SKIP')

package() {
  cd "${srcdir}"
  install -Dm 755 -t "${pkgdir}/usr/bin" powder
  install -Dm 644 -t "${pkgdir}/usr/share/applications" powdertoy-tpt.desktop
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
