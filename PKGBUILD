# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-client-tools-bin'
pkgdesc='ScaleFT(TM) client tools'
pkgver=1.60.0
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
depends=('glibc')
source=("https://pkg.scaleft.com/rpm/${pkgname%-*}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('9c571364fa63b390bb2b42eaef1175414b0485b520e2c497b2b51164f9fb5bb9')

package() {
  install -Dm0755 usr/bin/sft ${pkgdir}/usr/bin/sft
  install -Dm0644 usr/share/doc/scaleft-client-tools/LICENSE.txt \
                  ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
