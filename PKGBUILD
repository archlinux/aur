# Maintainer: magodo <wztdyl@sina.com>
pkgname=aztfy-bin
pkgver=0.6.0
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

sha256sums_i686=(9263e414a528c5bb5a9f376375a3e5c7a241ed84a2d4a1e51f5dcef2d9f6d690)
sha256sums_x86_64=(ed68a617c6c79675d0fa024b72e068936402ada598d704098f8323e52673f0b2)
sha256sums_armv7h=(6de7cd58623bee20d3773c8c37d0578eaf4e9c7e92346625c95bf617fd2ef463)
sha256sums_aarch64=(42387dd5ab50ae8736cfea03805594af46d80cde82126841dbdc472c6acc04cc)

package() {
    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/aztfy" "${pkgdir}/usr/bin"
}
