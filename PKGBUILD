# Maintainer: magodo <wztdyl@sina.com>
pkgname=aztfy-bin
pkgver=0.14.0
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

sha256sums_i686=(87e2d85c208ad86ff694ed0becc662450c94e3a90462e582dacdf9e6784fbb1f)
sha256sums_x86_64=(024dc90a6bd89cc1b4888373b5819d10b727c73d20c70be1ff160bf15a74ce80)
sha256sums_armv7h=(26354acb9d430c9f5f4e18fda8c53a4f4ab9689aa058cdd2fcd9b0cb8832c780)
sha256sums_aarch64=(8ce70004e9aacb034aa7a0cced5440ff52037286bcd7a74cca881a898ac839e6)

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/aztfy" "${pkgdir}/usr/bin"
}
