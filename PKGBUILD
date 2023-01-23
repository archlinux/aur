# Maintainer: Vlad Vasiliu <vladvasiliun@yahoo.fr>
pkgname=cargo-lambda-bin
pkgver=0.16.0
pkgrel=1
pkgdesc='Cargo Lambda is a Cargo subcommand to help you work with AWS Lambda.'
arch=('aarch64' 'x86_64')
url='https://www.cargo-lambda.info/'
license=('MIT')
provides=("cargo-lambda")
makedepends=()
depends=("cargo" "cargo-watch" "zig")
conflicts=()
source_x86_64=("cargo-lambda-${pkgver}::https://github.com/cargo-lambda/cargo-lambda/releases/download/v${pkgver}/cargo-lambda-v${pkgver}.x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("cargo-lambda-${pkgver}::https://github.com/cargo-lambda/cargo-lambda/releases/download/v${pkgver}/cargo-lambda-v${pkgver}.aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('e040a075a66b4d5385f96f873e95c399f122ead6dd4c3a4157fa9811e8547145')
sha256sums_aarch64=('99d38f3d2b240d5361ad32ec7d1771ce1b52a2814a35f5be61c25022137db8b8')

package() {
    install -Dm 755 ${srcdir}/cargo-lambda ${pkgdir}/usr/bin/cargo-lambda
}

