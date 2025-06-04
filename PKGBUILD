# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='A cross platform utility to dump and modify audio metadata for a wide variety of formats.'
pkgname=('tone-bin')
pkgver=0.2.5
pkgrel=1
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

sha256sums_x86_64=('acc626328d6230045f7032cec1a7f87139645691fae6a367897a8cab67c20d3e')
sha256sums_aarch64=('9b1c3064d2a0ed7b57e430b31dfec9d744524d62f9af1de562e516dc8aa24c23')
