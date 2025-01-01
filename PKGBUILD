# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='A cross platform utility to dump and modify audio metadata for a wide variety of formats.'
pkgname=('tone-bin')
pkgver=0.2.4
pkgrel=0
arch=('x86_64' 'aarch64')
license=('APACHE')
url="https://github.com/sandreas/tone"
makedepends=()
depends=('gcc-libs' 'zlib')
provides=("tone=${pkgver}")
conflicts=('tone')
options=('!strip')
source_x86_64=("https://github.com/sandreas/tone/releases/download/v$pkgver/tone-$pkgver-linux-x64.tar.gz")
source_aarch64=("https://github.com/sandreas/tone/releases/download/v$pkgver/tone-$pkgver-linux-arm64.tar.gz")


package() {
    cd ${srcdir}
    install -Dm 755 tone*/tone "${pkgdir}/usr/bin/tone"
}

sha256sums_x86_64=('fca0bace134b4f3d417dfdfae6ad1139bc6be6c489fc4f40e43174837788ad94')
sha256sums_aarch64=('ea5de8121860561f00c3a563880bad44e04dc2dfc56423c443bb378e47464670')
