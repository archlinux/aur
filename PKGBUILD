# Maintainer: XYenon <i at xyenon dot bid>

pkgname=go-cqhttp-bin

pkgver=1.0.1
pkgrel=1

pkgdesc='Lightweight, native cross-platform implementation of cqhttp in Golang.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/Mrs4s/go-cqhttp/releases'
license=('AGPL3')
install=go-cqhttp-bin.install

optdepends=('ffmpeg: support voice sending in any format')

provides=('go-cqhttp')

origin_pkgver="v${pkgver//_/-}"

source_i686=("${pkgname}-i686-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_386.tar.gz")
source_x86_64=("${pkgname}-x86_64-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_amd64.tar.gz")
source_armv7h=("${pkgname}-armv7h-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_armv7.tar.gz")
source_aarch64=("${pkgname}-aarch64-${origin_pkgver}.tar.gz::https://github.com/Mrs4s/go-cqhttp/releases/download/${origin_pkgver}/go-cqhttp_linux_arm64.tar.gz")

sha256sums_i686=('2c05236ae1381565d130f710fd2fe80bcbc6e298cedc95fac98db73517fadfa9')
sha256sums_x86_64=('e2d6154cf005316be641213bc46e846b4e0d627003b57adae1bf1651bdd0d1ab')
sha256sums_armv7h=('5742eb42b04df6222149fa5c86713e326c2048a6874a56d483a1a57e2a4419df')
sha256sums_aarch64=('6e44b23036246ed14dc2ee5c3856f6636c27a3c7c2e611a4486153c4c8830b45')

package() {
    cd "${srcdir}"
    install -Dm755 'go-cqhttp' "${pkgdir}/usr/bin/go-cqhttp"
}
