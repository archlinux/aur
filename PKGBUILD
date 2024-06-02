# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-client-tools-bin'
pkgdesc='ScaleFT(TM) client tools'
pkgver=1.80.1
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
depends=('glibc')
source=("https://dist.scaleft.com/repos/rpm/stable/centos/9/${arch}/${pkgver}/${pkgname%-*}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('42b92a02092994517a4e9e8558a6f64c96aa78ec3c79ce3377da729833f62326')

package() {
  install -Dm0755 usr/bin/sft ${pkgdir}/usr/bin/sft
  install -Dm0644 usr/share/doc/scaleft-client-tools/LICENSE.txt \
                  ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
