# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=smbmap
pkgver=1.0.5
pkgrel=1
pkgdesc='SMB enumeration tool'
arch=('any')
url='https://github.com/ShawnDEvans/smbmap'
license=('GPL')
depends=('impacket')
checkdepends=('python2')
source=("https://github.com/ShawnDEvans/smbmap/archive/${pkgver}.tar.gz")
sha256sums=('b1f5145a3dde44c5dc32aa7ed7a6517f37def216b15ef1b5a68b5074b1491f4d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -v -m755 -d "${pkgdir}/usr/bin"
  install -v -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -v -m644 {README.md,LICENSE} "${pkgdir}/usr/share/doc/${pkgname}/"
  install -v -m755 "${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}.py"
}

# vim:set ts=2 sw=2 et:
