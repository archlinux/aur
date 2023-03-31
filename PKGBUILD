# Maintainer: Mumulhl <mumulhl@duck.com>
pkgname='gut-bin'
pkgver='0.2.5'
pkgrel=1
pkgdesc="Easy-to-use git client"
arch=('x86_64' 'i386')
url='gut-cli.dev'
license=('MIT')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/julien040/gut/releases/download/${pkgver}/gut_Linux_x86_64.tar.gz")
source_i386=("${pkgname}-${pkgver}.tar.gz::https://github.com/julien040/gut/releases/download/${pkgver}/gut_Linux_i386.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/julien040/gut/releases/download/${pkgver}/gut_Linux_arm64.tar.gz")
sha256sums_x86_64=('b1cdfe986e9d5c33dfe7e2312bfd3ee1c1242163dc05386c6a636248e2a1b686')
sha256sums_i386=('8c4e365d6101f0a048ade405e55374d26135ddcf2b38913c7a72bb77b29b9735')
sha256sums_aarch64=('2150839e693c16dda52a6503f983914cc8e59041a4ef8f14e37290c81da49d92')
provides=('gut')

package() {
    cd "$srcdir"
    install -Dm755 gut -t "${pkgdir}/usr/bin"
}
