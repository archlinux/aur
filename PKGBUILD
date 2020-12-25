# Maintainer: j605

pkgname=paperboy-bin
_pkgname=pboy
pkgver=1.4
pkgrel=1
pkgdesc='A small .pdf management utility'
url='https://github.com/2mol/pboy'
license=('BSD')
arch=('x86_64')
provides=(paperboy)
conflicts=(paperboy)
source=($pkgname-$pkgver.tar.gz::"https://github.com/2mol/pboy/releases/download/$pkgver/pboy-linux.tar.gz")
sha512sums=('967aa909341506aab36296a24b749d4c1e464a32d96d2cd7ff9ce16b46159e0222445bb8ff3aef0f7dcd7db3d0e4ffadbff6898795bdc0a0a03e00990afb851e')
options=(!strip)

package() {
    install -Dm 755 pboy "${pkgdir}/usr/bin/pboy"
}
