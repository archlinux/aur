# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=asklink-bin
pkgver=4.0.33.0
pkgrel=1
pkgdesc='Asklink Remote'
arch=('x86_64' 'aarch64')

url="https://www.asklink.com"
license=('commercial')
depends=('pulseaudio'
    'libxtst'
)
optdepends=('libdrm'
    'alsa-lib'
)
source=("https://dl.asklink.com/linux/${pkgver}/AskLink-${pkgver}-${CARCH}.deb"
)
sha256sums=('SKIP'
)

prepare() {
    ar -x AskLink-${pkgver}-${CARCH}.deb
    tar xzf data.tar.gz
}

package() {
    cp -r opt ${pkgdir}
    cp -r usr ${pkgdir}
}
