# Maintainer: Vlad Vasiliu <vladvasiliun@yahoo.fr>
pkgname=cargo-lambda-bin
pkgver=0.20.1
pkgrel=1
pkgdesc='Cargo Lambda is a Cargo subcommand to help you work with AWS Lambda.'
arch=('aarch64' 'x86_64')
url='https://www.cargo-lambda.info/'
license=('MIT')
provides=("cargo-lambda")
makedepends=()
depends=("cargo" "cargo-watch" "zig")
conflicts=()
source_x86_64=("cargo-lambda-${pkgver}-x86_64::https://github.com/cargo-lambda/cargo-lambda/releases/download/v${pkgver}/cargo-lambda-v${pkgver}.x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("cargo-lambda-${pkgver}-aarch64::https://github.com/cargo-lambda/cargo-lambda/releases/download/v${pkgver}/cargo-lambda-v${pkgver}.aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('ea86c99348ff1f7568d826e8a00a8cfa49728c2b0a1d76482639898d27d9bbde')
sha256sums_aarch64=('81b900bed2e7f975617d75151f13260cdcda235b5aa578926406ebfa260216b8')

package() {
    install -Dm 755 ${srcdir}/cargo-lambda ${pkgdir}/usr/bin/cargo-lambda
}

