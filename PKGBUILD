# Maintainer: magodo <wztdyl@sina.com>
pkgname=aztfy-bin
pkgver=0.10.0
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

sha256sums_i686=(608b2a24bbf9c6d678209eef2c65e6d3a2f8b799a1665773a1dd37af49eb8680)
sha256sums_x86_64=(2f2b5d4f0951596289949f47c9e5a4058d75c4d8bcb6463f79f4b2dc45de2868)
sha256sums_armv7h=(a1d2cb792b2d74be7983966a98bee2070853539077a9e655521e057440b287d1)
sha256sums_aarch64=(26ebf049ba63005642de49c7d46f8f0c67114c226c462815463e948351c93132)

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/aztfy" "${pkgdir}/usr/bin"
}
