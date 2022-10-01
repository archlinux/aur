# Maintainer: magodo <wztdyl@sina.com>
pkgname=aztfy-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A tool to bring existing Azure resources under Terraform's management"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/Azure/aztfy"
license=('MPL2')
provides=(aztfy)
conflicts=(aztfy)

source_i686=(https://github.com/Azure/aztfy/releases/download/v${pkgver}/aztfy_v${pkgver}_linux_386.zip)
source_x86_64=(https://github.com/Azure/aztfy/releases/download/v${pkgver}/aztfy_v${pkgver}_linux_amd64.zip)
source_armv7h=(https://github.com/Azure/aztfy/releases/download/v${pkgver}/aztfy_v${pkgver}_linux_arm.zip)
source_aarch64=(https://github.com/Azure/aztfy/releases/download/v${pkgver}/aztfy_v${pkgver}_linux_arm64.zip)

sha256sums_i686=(eb93bb9cc55522267704a448b756c0a06fed04dfc7ef1b19f6beab78a7bc71ab)
sha256sums_x86_64=(5bdb9418b165615e1035e2166d947ef3dd7c9cf73ef48e90cc5c7b75c71c4faa)
sha256sums_armv7h=(52d2fe738273fe2793e8f2ab94dc6fb00f23433f30edc0e7dffbd2dd33d4668e)
sha256sums_aarch64=(d431120de4ad7bbeddc48f28c4747c1ea95942de861d3f31d6f8d6c9b727e871)

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/aztfy" "${pkgdir}/usr/bin"
}
