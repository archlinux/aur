# Maintainer: whriedplanck

pkgname=powdertoy-bin
pkgver=95.0
pkgrel=1
pkgdesc="Desktop version of the classic falling sand physics sandbox, simulates air
    pressure, velocity & heat!"
arch=('x86_64')
url="https://powdertoy.co.uk/"
license=('GPL3')
depends=('openssl')
source=("https://powdertoy.co.uk/Download/powder-lin64.zip"
        powdertoy-tpt.desktop)
sha1sums=('fbabc189bd26622c5c80d53a638dfc9f06075b4d'
          'SKIP')

package() {
  cd "${srcdir}"
  install -Dm 755 -t "${pkgdir}/usr/bin/powdertoy" powder64
  install -Dm 644 -t "${pkgdir}/usr/share/applications" powdertoy-tpt.desktop
}
