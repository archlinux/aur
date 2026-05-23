# Maintainer: czyt <czytcn@gmail.com>
pkgname=hclient-cli-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Lazycat Microserver CLI client (懒猫微服命令行客户端)"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://lazycat.cloud/download"
license=('MIT')
provides=('hclient-cli')
conflicts=('hclient-cli')

source_x86_64=("${pkgname}::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-amd64")
source_aarch64=("${pkgname}::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-arm64")
source_riscv64=("${pkgname}::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-riscv64")

sha256sums_x86_64=('9324605feaf3f7d953e9c05550500e1856c96c7ac8ecf0d855d59e3fd859a9a0')
sha256sums_aarch64=('9324605feaf3f7d953e9c05550500e1856c96c7ac8ecf0d855d59e3fd859a9a0')
sha256sums_riscv64=('9324605feaf3f7d953e9c05550500e1856c96c7ac8ecf0d855d59e3fd859a9a0')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/hclient-cli"
}
