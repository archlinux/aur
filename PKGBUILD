# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='A cross platform utility to dump and modify audio metadata for a wide variety of formats.'
pkgname=('tone-bin')
pkgver=0.0.3
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

sha256sums_x86_64=('dccaaecefcd6abb0294dc2b868bfc72694d7c125ddc25c883ce1fd780dde766a')
sha256sums_aarch64=('63748aa556b33c5144b31c586811feab8110058c417a0c023c542fad07cb0083')
