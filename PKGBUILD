# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgdesc='A cross platform utility to dump and modify audio metadata for a wide variety of formats.'
pkgname=('tone-bin')
pkgver=0.2.5
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

sha256sums_x86_64=('7b1027e2f85ce677614b432b13a3edc887a1959623b8c3991adc6748774c6bde')
sha256sums_aarch64=('2b014c522e3baef7db90d9969046e4579fde96270ead01230b989474f14fa40c')
