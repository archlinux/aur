# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-client-tools-bin'
pkgdesc='ScaleFT(TM) client tools'
pkgver=1.67.4
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
depends=('glibc')
source=("https://pkg.scaleft.com/rpm/${pkgname%-*}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('91109285330a7f9a8a16d87ff07f171cb8f5d9821543d1b97f632f54946dc83b')

package() {
  install -Dm0755 usr/bin/sft ${pkgdir}/usr/bin/sft
  install -Dm0644 usr/share/doc/scaleft-client-tools/LICENSE.txt \
                  ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
