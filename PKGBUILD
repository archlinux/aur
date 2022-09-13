# Maintainer: magodo <wztdyl@sina.com>
pkgname=aztfy-bin
pkgver=0.7.0
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

sha256sums_i686=(9b2ead41546469c11d4ef948b55a487d0131e2721e71993977875d5274274fa1)
sha256sums_x86_64=(e44c1a34eac2ba2eabdbb8981e30c3423a6a74f5c466d25a2a691cd1e8ec7910)
sha256sums_armv7h=(f63645997c7e15250aba4d4e84d140c0e4ac01a029d5f6032f6144b42ac51e45)
sha256sums_aarch64=(f5b5c242c94ee9aef3669bcb8ee1bb8a120394a0a1ddb90928608b66f2e52fb0)

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/aztfy" "${pkgdir}/usr/bin"
}
