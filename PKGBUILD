# Maintainer: czyt <czytcn@gmail.com>
pkgname=hclient-cli-bin
pkgver=1.1.1
pkgrel=5
pkgdesc="Lazycat Microserver CLI client (懒猫微服命令行客户端)"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://lazycat.cloud/download"
license=('MIT')
provides=('hclient-cli')
conflicts=('hclient-cli')

source_x86_64=("${pkgname}::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-amd64")
source_aarch64=("${pkgname}::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-arm64")
source_riscv64=("${pkgname}::https://dl.lazycatmicroserver.com/hclient-cli/v${pkgver}/hclient-cli-linux-riscv64")

sha256sums_x86_64=('a672512bd83c7fb441682ec97cbeea16380c943f0a93cc7c3f64391c82702c8b')
sha256sums_aarch64=('a672512bd83c7fb441682ec97cbeea16380c943f0a93cc7c3f64391c82702c8b')
sha256sums_riscv64=('a672512bd83c7fb441682ec97cbeea16380c943f0a93cc7c3f64391c82702c8b')

package() {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/hclient-cli"
}
