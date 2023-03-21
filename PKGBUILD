# Maintainer: Vlad Vasiliu <vladvasiliun@yahoo.fr>
pkgname=cargo-lambda-bin
pkgver=0.18.0
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
sha256sums_x86_64=('b9116174d672faba6406aef70154299e734eb480471a0c20fa4aab289df48981')
sha256sums_aarch64=('911aa8758df87a319466e4c4b6de61ebc8411476e0226140df501231df15afb3')

package() {
    install -Dm 755 ${srcdir}/cargo-lambda ${pkgdir}/usr/bin/cargo-lambda
}

