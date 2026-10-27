# Maintainer: Pranay Kanwar <pranay.kanwar@gmail.com>
# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=smbmap
pkgver=1.10.8
pkgrel=1
pkgdesc='SMB enumeration tool'
arch=('any')
url='https://github.com/ShawnDEvans/smbmap'
license=('GPL')
depends=('impacket' 'python-termcolor' 'python-pyasn1' 'python-pycryptodome' 'python-configparser')
checkdepends=('python')
source=("https://github.com/ShawnDEvans/smbmap/archive/v${pkgver}.tar.gz")
sha256sums=('c7a84c74920ebedae6b7230acd47daae461906bda9a7965aa0d996fae17f867d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -v -m755 -d "${pkgdir}/usr/bin"
  install -v -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -v -m644 {README.md,LICENSE} "${pkgdir}/usr/share/doc/${pkgname}/"
  install -v -m755 "${pkgname}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}.py"
}

# vim:set ts=2 sw=2 et:
