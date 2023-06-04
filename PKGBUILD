# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='A cross platform utility to dump and modify audio metadata for a wide variety of formats.'
pkgname=('tone-bin')
pkgver=0.1.5
pkgrel=3
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

sha256sums_x86_64=('29c197b21c6e36a3b889ebd6bb1fbdd2c95e489ac6508d010adcf6f69ab8ceba')
sha256sums_aarch64=('0749b33e20c30607e73d654e6382fc8c56147eab81086131f95915eb58500bad')
