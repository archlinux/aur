# Maintainer: Mumulhl <mumulhl@duck.com>
pkgname='gut-bin'
pkgver='0.2.8'
pkgrel=1
pkgdesc="Easy-to-use git client"
arch=('x86_64' 'i386' 'aarch64')
url='https://gut-cli.dev'
license=('MIT')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/julien040/gut/releases/download/${pkgver}/gut_Linux_x86_64.tar.gz")
source_i386=("${pkgname}-${pkgver}.tar.gz::https://github.com/julien040/gut/releases/download/${pkgver}/gut_Linux_i386.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/julien040/gut/releases/download/${pkgver}/gut_Linux_arm64.tar.gz")
sha256sums_x86_64=('30beab2b722806dfc4b97b348045cb1821281ddb8233239a58b5f6a686390cbc')
sha256sums_i386=('d268a80a7ba09d794a6f483301acccd1cc9517bcc0b471404e8756b4535b5b34')
sha256sums_aarch64=('0597a7d9cf9048585d57f3f8a14a7c6b064ccc1f05b56a187260503207f49ed9')
provides=('gut')

package() {
    cd "$srcdir"
    install -Dm755 gut -t "${pkgdir}/usr/bin"
}
