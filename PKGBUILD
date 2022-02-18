# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-client-tools-bin'
pkgdesc='ScaleFT(TM) client tools'
pkgver=1.57.0
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
depends=('glibc')
source=("https://pkg.scaleft.com/rpm/${pkgname%-*}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('f5a551b28f7c820e6ab7923dc85c35688b36849974c66068646238dd53d9a6df')

package() {
  install -Dm0755 usr/bin/sft ${pkgdir}/usr/bin/sft
  install -Dm0644 usr/share/doc/scaleft-client-tools/LICENSE.txt \
                  ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
