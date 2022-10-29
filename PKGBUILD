# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='A cross platform utility to dump and modify audio metadata for a wide variety of formats.'
pkgname=('tone-bin')
pkgver=0.1.1
pkgrel=1
arch=('x86_64' 'aarch64')
license=('MIT')
url="https://github.com/sandreas/tone"
makedepends=()
depends=()
options=('!strip')
source_x86_64=("https://github.com/sandreas/tone/releases/download/v$pkgver/tone-$pkgver-linux-x64.tar.gz")
source_aarch64=("https://github.com/sandreas/tone/releases/download/v$pkgver/tone-$pkgver-linux-arm64.tar.gz")


package() {
    cd ${srcdir}
    install -Dm 755 tone*/tone "${pkgdir}/usr/local/bin/tone"
}

sha256sums_x86_64=('2079a42cc3d78f162a97cd3968955404afab8a1c648a9ddd1905ad575b3303b8')
sha256sums_aarch64=('a7d19c2b62e6edd5335342ad8a3fde2f32cbc562c0779764eea71acb7ea17e9b')
