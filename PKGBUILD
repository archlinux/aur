# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Kevin K. <kbknapp at gmail dot com>

_pkgname=clog
pkgname=${_pkgname}-bin
pkgver=0.9.3
pkgrel=1

pkgdesc='Generate beautiful changelogs from your Git commit history'
arch=('i686' 'x86_64')
url='https://github.com/clog-tool/clog-cli'
license=('MIT')

makedepends=()
provides=('clog')
conflicts=('clog-git')

source_i686=(
    "https://github.com/clog-tool/clog-cli/releases/download/v$pkgver/clog-v$pkgver-i686-unknown-linux-gnu.tar.gz"
)
sha512sums_i686=(
    'c9e0e83dac0ec6eca6330a420ff685bcb6d3b710920475a1c931252557d6729b59fc1c46557f606a377fb761f22eccf6ead0ffba183eeb63ce5a762a70d85667'
)
source_x86_64=(
    "https://github.com/clog-tool/clog-cli/releases/download/v$pkgver/clog-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
)
sha512sums_x86_64=(
    '9bfde7934558a0a79d29bfd9f049bcfb013c07018b2c290bd6c41acac8b7c22431950dcef972df27477b4d516c1ac5e26f71524ed6b4bba8864e01eb5f39103c'
)

package() {
    install -Dm 0755 clog "${pkgdir}/usr/bin/${_pkgname}"
}

