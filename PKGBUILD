# Maintainer: Vlad Vasiliu <vladvasiliun@yahoo.fr>
pkgname=cargo-lambda-bin
pkgver=1.9.2
pkgrel=1
pkgdesc='Cargo Lambda is a Cargo subcommand to help you work with AWS Lambda.'
arch=('aarch64' 'x86_64')
url='https://www.cargo-lambda.info/'
license=('MIT')
provides=("cargo-lambda")
makedepends=()
depends=("cargo" "cargo-watch" "zig")
conflicts=()
options=(strip !debug)
source_x86_64=("cargo-lambda-${pkgver}-x86_64::https://github.com/cargo-lambda/cargo-lambda/releases/download/v${pkgver}/cargo-lambda-v${pkgver}.x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("cargo-lambda-${pkgver}-aarch64::https://github.com/cargo-lambda/cargo-lambda/releases/download/v${pkgver}/cargo-lambda-v${pkgver}.aarch64-unknown-linux-musl.tar.gz")
sha256sums_aarch64=('c3fd0a352bb439e4e84a09e5361ea333f7cdc58b0894105e93a33c43b867bc2d')
sha256sums_x86_64=('b5c258c424ebaef39541c3641f33c51137ee6c426016f365628fedb2c737271d')

package() {
    install -Dm 755 ${srcdir}/cargo-lambda ${pkgdir}/usr/bin/cargo-lambda
}

