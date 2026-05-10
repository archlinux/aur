# Maintainer: bjarneo <https://github.com/bjarneo>
pkgname=coo-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='A light terminal IRC client built on Bubble Tea (precompiled binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/bjarneo/coo'
license=('MIT')
provides=('coo')
conflicts=('coo')
depends=('glibc')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/bjarneo/coo/v${pkgver}/LICENSE")
source_x86_64=("coo-${pkgver}-x86_64::https://github.com/bjarneo/coo/releases/download/v${pkgver}/coo-linux-amd64")
source_aarch64=("coo-${pkgver}-aarch64::https://github.com/bjarneo/coo/releases/download/v${pkgver}/coo-linux-arm64")
sha256sums=('ebb1323d93aee5f8b4a672ec20ca24954373c85686be39307facb88dd582444c')
sha256sums_x86_64=('77d4f3c2295267f65932682199601f8bb4c4d911a0000610e8c7651ac334e7a4')
sha256sums_aarch64=('55a21f35fd5d35e326e1ba37bd79f52ea90d073672beddba35c7899c769464a6')

package() {
    install -Dm755 "coo-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/coo"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
