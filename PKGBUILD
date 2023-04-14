# Maintainer: Mumulhl <mumulhl@duck.com>
pkgname='gut-bin'
pkgver='0.2.7'
pkgrel=1
pkgdesc="Easy-to-use git client"
arch=('x86_64' 'i386' 'aarch64')
url='https://gut-cli.dev'
license=('MIT')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/julien040/gut/releases/download/${pkgver}/gut_Linux_x86_64.tar.gz")
source_i386=("${pkgname}-${pkgver}.tar.gz::https://github.com/julien040/gut/releases/download/${pkgver}/gut_Linux_i386.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/julien040/gut/releases/download/${pkgver}/gut_Linux_arm64.tar.gz")
sha256sums_x86_64=('8fe275c849200561533b53d93ee3600e0d0042a792dfa384daaf0e8227152808')
sha256sums_i386=('c0ac4ed35453b4dc4d9f01b899248b7e3ed5fbbe4eb9a9422e08a8ec023f05b3')
sha256sums_aarch64=('3579c0af47894e41ecf23a23cdca956bf877f4977c8fce25602e3bbc1320934a')
provides=('gut')

package() {
    cd "$srcdir"
    install -Dm755 gut -t "${pkgdir}/usr/bin"
}
