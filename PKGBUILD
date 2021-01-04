# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=smbmap
pkgver=1.8.2
pkgrel=1
pkgdesc='SMB enumeration tool'
arch=('any')
url='https://github.com/ShawnDEvans/smbmap'
license=('GPL')
depends=('impacket')
checkdepends=('python')
source=("https://github.com/ShawnDEvans/smbmap/archive/v${pkgver}.tar.gz")
sha256sums=('023d218cce9a064c0edcaa8894e2fd3e9a0f3ae33fecdef523e6178228a4290d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -v -m755 -d "${pkgdir}/usr/bin"
  install -v -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -v -m644 {README.md,LICENSE} "${pkgdir}/usr/share/doc/${pkgname}/"
  install -v -m755 "${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}.py"
}

# vim:set ts=2 sw=2 et:
