# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-client-tools'
pkgdesc='ScaleFT(TM) client tools'
pkgver=1.38.5
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
depends=('glibc')
source=("https://pkg.scaleft.com/rpm/${pkgname}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('b061a7d1b7e03796f42291d980ba0dc18f983138c8e209a311cb4de93a85b45a')

package() {
  install -Dm0755 usr/bin/sft ${pkgdir}/usr/bin/sft
  install -Dm0644 usr/share/doc/scaleft-client-tools/LICENSE.txt \
                  ${pkgdir}/share/doc/scaleft-client-tools/LICENSE.txt
}
