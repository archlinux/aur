# Maintainer: mirsella <mirsella@protonmail.com>
pkgname=tokenuze-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="A CLI tool that summarizes token and cost usage from various LLM providers"
arch=('x86_64')
url="https://github.com/mirsella/tokenuze"
license=('MIT')
optdepends=('sqlite: for Zed, Crush, and Opencode providers')
provides=('tokenuze')
conflicts=('tokenuze')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mirsella/tokenuze/releases/download/${pkgver}/tokenuze-linux-x86_64.tar.gz")
sha256sums=('a1acd3f0a77fddb6d0b889bcaac1724bf52d1661eabb4abe917591ae46a095a4')

package() {
    install -Dm755 tokenuze "${pkgdir}/usr/bin/tokenuze"
}
