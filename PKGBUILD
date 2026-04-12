# Maintainer: hnchengzong 
pkgname=jlu-drcom-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="吉林大学校园网登录认证客户端"
arch=('x86_64')
url="https://github.com/hnchengzong/jlu-drcom"
license=('MIT')
depends=()
makedepends=()
provides=("jlu-drcom=${pkgver}")
source=("${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/hnchengzong/jlu-drcom/releases/download/v${pkgver}/jlu-drcom-bin-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('2a71e62d0b0497129f3fa86a21201cd01920e7ede86c2a11249839df17e746ac')  

package() {
  bsdtar -C "$pkgdir" -xf "$srcdir/${pkgname%-bin}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
  rm -f "$pkgdir/.PKGINFO" "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE"
}
