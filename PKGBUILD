# Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=asklink-bin
pkgver=4.0.33.0
pkgrel=2
pkgdesc='Asklink Remote'
arch=('x86_64' 'aarch64')

url="https://www.asklink.com"
license=('commercial')
depends=('pulse-native-provider'
    'libxtst'
    'libdrm'
    'alsa-lib'
    'jack'
)
source_x86_64=("https://dl.asklink.com/linux/${pkgver}/AskLink-${pkgver}-x86_64.deb")
source_aarch64=("https://dl.asklink.com/linux/${pkgver}/AskLink-${pkgver}-aarch64.deb")
sha256sums_x86_64=('SKIP'
)
sha256sums_aarch64=('SKIP'
)

prepare() {
    tar xzf data.tar.gz
}

package() {
    cp -r opt ${pkgdir}
    cp -r usr ${pkgdir}
}
