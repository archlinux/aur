# Maintainer: ambition-echo <ambition_echo@outlook.com>

pkgname=clash-verge-bin
_pkgname=clash-verge
pkgver=1.2.2
pkgrel=0
pkgdesc="A Clash GUI based on tauri."
arch=('x86_64')
url="https://github.com/zzzgydi/clash-verge"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'clash')
optdepends=('clash-meta: Another Clash Kernel')

source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/zzzgydi/clash-verge/releases/download/v${pkgver}/clash-verge_${pkgver}_amd64.deb")

sha512sums=('346528b3dd81760a33fb12813b1c26a97d9f7bd40c4095fd1dceeebba0dcb367271a12ac28e5e4aeb78e894a6feb048f724961292fc4bf16c527e95cb07ce1f4')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    rm ${pkgdir}/usr/bin/clash
    rm ${pkgdir}/usr/bin/clash-meta
}
