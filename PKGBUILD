# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-client-tools-bin'
pkgdesc='ScaleFT(TM) client tools'
pkgver=1.64.3
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
depends=('glibc')
source=("https://pkg.scaleft.com/rpm/${pkgname%-*}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('253548d7d5b0c6f2afa32026c2a125928f44da94875f4721c31fff03c5668e62')

package() {
  install -Dm0755 usr/bin/sft ${pkgdir}/usr/bin/sft
  install -Dm0644 usr/share/doc/scaleft-client-tools/LICENSE.txt \
                  ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
