# Contributor: Tom < reztho at archlinux dot us >
pkgname=libpkcs11-dnie
pkgver=1.5.1
pkgrel=1
pkgdesc="PKCS11 library for DNIe"
arch=('x86_64')
url="https://www.dnielectronico.es/"
depends=('pcsclite' 'pcsc-tools' 'ccid')
license=('custom')
install=${pkgname}.install
source=("https://www.dnielectronico.es/descargas/distribuciones_linux/Ubuntu_libpkcs11-dnie_1.5.1_amd64.deb")

package() {
  cd "${srcdir}/"
  tar -xJf data.tar.xz
  mv usr "${pkgdir}/"
}

md5sums=('d1a56fd534a7c58e622fea9eb9140fea')
