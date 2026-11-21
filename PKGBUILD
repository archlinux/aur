# Maintainer: Monjaris <ziyanovruzlu.750@gmail.com>
pkgname=circle-bin
pkgver=240
pkgrel=1
pkgdesc='Circle C++ compiler with novel language features (prebuilt binaries)'
arch=('x86_64' 'aarch64')
url='https://www.circle-lang.org/'
license=('custom')
options=('!strip' '!debug')
depends=('gcc-libs' 'zlib' 'zstd' 'libelf' 'util-linux-libs' 'gcc' 'lld')
provides=('circle')
conflicts=('circle')
source_x86_64=("circle_linux_x86_64.tgz::https://www.circle-lang.org/download/circle_linux_x86_64.tgz")
sha256sums_x86_64=('ddcad728359afef32a55c6750ee0ebba4e48f826e70fbda28dd37f503b1d20e6')
source_aarch64=("circle_linux_aarch64.tgz::https://www.circle-lang.org/download/circle_linux_aarch64.tgz")
sha256sums_aarch64=('731242605b97412446677907026492b00e6457fa3f84e2246d0f27d449e17b49')

package() {
    install -Dm755 circle "$pkgdir/usr/bin/circle"
}
