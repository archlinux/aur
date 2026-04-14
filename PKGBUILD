# Maintainer: hnchengzong
pkgname=jlu-drcom-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="吉林大学校园网登录认证客户端"
arch=('x86_64')
url="https://github.com/hnchengzong/jlu-drcom"
license=('MIT')
source=("https://github.com/hnchengzong/jlu-drcom/releases/download/v${pkgver}/jlu-drcom-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('7023806bbeaf4fa4955956b28c7e2abcc210c3c64c55110273424b41a8cc30e3')

package() {
    true
}

prepare() {
    cp -f "${srcdir}/jlu-drcom-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst" "${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
}
