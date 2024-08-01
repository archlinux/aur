# Maintainer: Mike Simpson <zsa-kontroll-bin.xpgrc@aleeas.com>
pkgname=zsa-kontroll-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Helper cli tool for the ZSA Keymapp API"
arch=('x86_64')
url="https://github.com/zsa/kontroll"
license=('MIT')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
source=("https://github.com/zsa/kontroll/releases/download/${pkgver}/kontroll-${pkgver}-linux-x64.tar.gz")
sha256sums=('3de6a6020070bde669ecab976759c1014a723d95fb1bf1f66b803173f1b332c9')

package() {
  install -Dm755 "${srcdir}/kontroll" "${pkgdir}/usr/bin/kontroll"
}
