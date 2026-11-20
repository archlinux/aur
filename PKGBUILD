# Maintainer: crux <crrvx@outlook.com>

pkgname=piik-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="a free, open-source screen sharing tool"
arch=('x86_64' 'aarch64')
url="https://piik.tv"
license=('MIT')
depends=()
makedepends=()
optdepends=()
provides=('piik')
conflicts=('piik' 'piik-git')
options=()
source_x86_64=("piik-${pkgver}-x64.tar.gz::https://github.com/TNTcraftHIM/Piik/releases/download/v${pkgver}/piik-app-linux-amd64.zip")
source_aarch64=("piik-${pkgver}-aarch64.tar.gz::https://github.com/TNTcraftHIM/Piik/releases/download/v${pkgver}/piik-app-linux-arm64.zip")
sha256sums_x86_64=('b1c8cf1a0d4a4e354aa4917776f60e3abce3bc4f6d5672d1e66adf280c6af804')
sha256sums_aarch64=('46fb1d4c0cc2dde25db41aebafd7f2d08ee52c3e7f9c5c7dc3782afb4f219546')

package() {
    install -Dm755 "$srcdir/piik-app" \
        "$pkgdir/usr/bin/piik"
}
