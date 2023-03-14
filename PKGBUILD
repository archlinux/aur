# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='A cross platform utility to dump and modify audio metadata for a wide variety of formats.'
pkgname=('tone-bin')
pkgver=0.1.4
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

sha256sums_x86_64=('1bc7d7ade3241813bc8fdf1939dba21b0bd8497214780835806c21f47ec670fc')
sha256sums_aarch64=('057e217ccdeb7acfeeb4305da0b7f08e838e278efbd6713e791350fa9bd7986e')
