# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=smbmap
pkgver=1.1.0
pkgrel=1
pkgdesc='SMB enumeration tool'
arch=('any')
url='https://github.com/ShawnDEvans/smbmap'
license=('GPL')
depends=('impacket')
checkdepends=('python')
source=("https://github.com/ShawnDEvans/smbmap/archive/${pkgver}.tar.gz")
sha256sums=('277d922baea97734c86950cf8363d00c9e01af06f275b34ed9153959a6651b07')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -v -m755 -d "${pkgdir}/usr/bin"
  install -v -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -v -m644 {README.md,LICENSE} "${pkgdir}/usr/share/doc/${pkgname}/"
  install -v -m755 "${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}.py"
}

# vim:set ts=2 sw=2 et:
