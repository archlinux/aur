# Maintainer: Luc Saccoccio--Le Guennec <lucsaccoccio@disroot.org>
pkgname=zamonia-bin
pkgver=0.1.5.5
pkgrel=1
pkgdesc="Zamonia - Executable only - CLI tool to manage art database"
url="https://github.com/Luc-Saccoccio/zamonia"
license=(custom)
arch=('x86_64')
depends=('gmp')
conflicts=()
provides=()
replaces=()
optdepends=()

source=("$pkgname-$pkgver.tar.gz::https://github.com/Luc-Saccoccio/zamonia/releases/download/v${pkgver}/zamonia-${pkgver}.tar.gz")

sha512sums=('bf200374191e603f81ab051e339e68549be21041ec513dafccecbfc919d4cd5900dd4a19ea4ae76d1d2b8484d286a562de8e2096948139bc52a5c4e7b8b8229b')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
  cp zamonia "${pkgdir}/usr/bin"
}
