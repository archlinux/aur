# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=markplane-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Markdown-first project management for humans and AI agents"
arch=('x86_64')
url="https://github.com/zerowand01/markplane"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/zerowand01/markplane/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/markplane-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('64375e572190005a47ee817115788f42b2963d1a66f0c10bdf7ffbe581dd1c1c')
sha256sums_x86_64=('4975e5d6dbf79ab60d0205402ff980161f77ba510e8cdb4f021fbf71588c9432')

package() {
  install -Dm755 "markplane" "${pkgdir}/usr/bin/markplane"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
