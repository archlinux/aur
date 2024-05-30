# Maintainer: Pranay Kanwar <pranay.kanwar@gmail.com>
# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=smbmap
pkgver=1.10.4
pkgrel=1
pkgdesc='SMB enumeration tool'
arch=('any')
url='https://github.com/ShawnDEvans/smbmap'
license=('GPL')
depends=('impacket')
checkdepends=('python')
source=("https://github.com/ShawnDEvans/smbmap/archive/v${pkgver}.tar.gz")
sha256sums=('c42f83a71fc006ebfe3bb9f2a368c619d90732361a10e656bdb5028a9b0cd731')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -v -m755 -d "${pkgdir}/usr/bin"
  install -v -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -v -m644 {README.md,LICENSE} "${pkgdir}/usr/share/doc/${pkgname}/"
  install -v -m755 "${pkgname}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}.py"
}

# vim:set ts=2 sw=2 et:
