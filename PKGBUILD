pkgname=awmtt
pkgver=0.5
pkgrel=1
pkgdesc="Test and preview your AwesomeWM configuration with Xephyr"
arch=("any")
url="https://github.com/mikar/awmtt"
license=("MIT")
depends=("xorg-server-xephyr")
source=("${pkgname}::git+https://github.com/mikar/${pkgname}.git#tag=${pkgver}")
sha256sums=('SKIP')

package() {
  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
