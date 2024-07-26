# Maintainer: Mike Simpson <zsa-kontroll-bin.xpgrc@aleeas.com>
pkgname=zsa-kontroll-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Helper cli tool for the ZSA Keymapp API"
arch=('x86_64')
url="https://github.com/zsa/kontroll"
license=('MIT')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
source=("https://github.com/zsa/kontroll/releases/download/${pkgver}/kontroll-${pkgver}-linux-x64.tar.gz")
sha256sums=('9be3fe9ff180e0c9166bbe70af7fd7e7e58528c72ee04af4eb92eb9513538b02')

package() {
  install -Dm755 "${srcdir}/kontroll" "${pkgdir}/usr/bin/kontroll"
}
