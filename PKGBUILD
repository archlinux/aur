# Maintainer: amphetam1n
pkgname="libreoffice-sdk"
pkgver="7.5.1"
pkgrel="1"
pkgdesc="LibreOffice SDK"
arch=("x86_64")
url="https://www.libreoffice.org"
license=('MPL2')
source=("https://download.documentfoundation.org/libreoffice/stable/7.5.1/rpm/x86_64/LibreOffice_7.5.1_Linux_x86-64_rpm_sdk.tar.gz")
sha256sums=("a44ca05be4a67c2cfc1edd3d4ef0b5620e6bdf6510b1d77fa8a12f7f29cb4e94")
package() {
	find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}
