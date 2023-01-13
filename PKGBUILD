# Maintainer: Vlad Vasiliu <vladvasiliun@yahoo.fr>
pkgname=cargo-lambda-bin
pkgver=0.15.0
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
sha256sums_x86_64=('c2fceaf4a2a44adeefa26bedb75db5c9d81c9da71399de2c3198f7b6363ca307')
sha256sums_aarch64=('82a4529be159e2aa38da57ef7ae4f0ac2ea3a9f673cfbd2020c39a45febdf128')

package() {
    install -Dm 755 ${srcdir}/cargo-lambda ${pkgdir}/usr/bin/cargo-lambda
}

