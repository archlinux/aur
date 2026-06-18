# Maintainer: czyt <czytcn@gmail.com>
pkgname=boo-bin
pkgver=0.5.24
pkgrel=1
pkgdesc="A GNU screen style terminal multiplexer built on libghostty"
arch=('x86_64' 'aarch64')
url="https://github.com/coder/boo"
license=('MIT')
provides=('boo')
conflicts=('boo')
source_x86_64=("${pkgname}-amd64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-x86_64-linux.tar.gz")
source_aarch64=("${pkgname}-arm64-${pkgver}.tar.gz::https://github.com/coder/boo/releases/download/v${pkgver}/boo-aarch64-linux.tar.gz")
sha256sums_x86_64=('a041effd8527f575a11f5fc7f26238c3ecf0fd0df57279f3c264e5a3b9054606')
sha256sums_aarch64=('14d4fd8146d920a7f0f42b60c6a0477fb4430f04c196c65445128d808ad52cf8')

package() {
    install -Dm755 "${srcdir}/boo" "${pkgdir}/usr/bin/boo"
}
