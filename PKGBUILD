# Maintainer: Mumulhl <mumulhl@duck.com>
pkgname='gut-bin'
pkgver='0.3.0'
pkgrel=1
pkgdesc="An alternative git CLI for Windows, macOS, and Linux"
arch=('x86_64' 'i386' 'aarch64')
url='https://gut-cli.dev'
license=('MIT')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/julien040/gut/releases/download/${pkgver}/gut_Linux_x86_64.tar.gz")
source_i386=("${pkgname}-${pkgver}.tar.gz::https://github.com/julien040/gut/releases/download/${pkgver}/gut_Linux_i386.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/julien040/gut/releases/download/${pkgver}/gut_Linux_arm64.tar.gz")
sha256sums_x86_64=('39735351db45f7d91a6d52b556a92efb9d749f17e04a73f9be923dff7cd0eef2')
sha256sums_i386=('9b5f5c507602cfa976a424501a8a2dfaab13d435771fb555b83349d495ac0210')
sha256sums_aarch64=('0fecfbac1b2f94a8d30fa2215c06911361d9f679f38bab5b4cae342abdfdace5')
provides=('gut')

package() {
    cd "$srcdir"
    install -Dm755 gut -t "${pkgdir}/usr/bin"
}
