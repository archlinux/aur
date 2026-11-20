# Maintainer: crux <crrvx@outlook.com>

pkgname=piik-bin
pkgver=0.0.0
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
sha256sums=()

package() {
    install -Dm755 "$srcdir/piik-app" \
        "$pkgdir/usr/bin/piik"
}
