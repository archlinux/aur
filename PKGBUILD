# Maintainer: crux <crrvx@outlook.com>

pkgname=piik-bin
pkgver=2.8.0
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
sha256sums_x86_64=('1bd8cfce0231bdb7fa733e33631ad3d402cfd624f175790e0d8b4b2dd01be979')
sha256sums_aarch64=('16268748979c7d61dcc9b956665d21b9b21df984ca1938dbff5f7ff5807016ee')

package() {
    install -Dm755 "$srcdir/piik-app" \
        "$pkgdir/usr/bin/piik"
}
