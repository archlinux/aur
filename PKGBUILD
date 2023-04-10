# Maintainer: Mumulhl <mumulhl@duck.com>
pkgname='gut-bin'
pkgver='0.2.6'
pkgrel=1
pkgdesc="Easy-to-use git client"
arch=('x86_64' 'i386' 'aarch64')
url='https://gut-cli.dev'
license=('MIT')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/julien040/gut/releases/download/${pkgver}/gut_Linux_x86_64.tar.gz")
source_i386=("${pkgname}-${pkgver}.tar.gz::https://github.com/julien040/gut/releases/download/${pkgver}/gut_Linux_i386.tar.gz")
source_aarch64=("${pkgname}-${pkgver}.tar.gz::https://github.com/julien040/gut/releases/download/${pkgver}/gut_Linux_arm64.tar.gz")
sha256sums_x86_64=('5ee51986cc63d2b527318d619da1fb7a2baeaccdbcfa453c286a632d6be92da2')
sha256sums_i386=('94e97df07af11c88793cfdff3da437710280d33ded60d2bb7a637c23191c450e')
sha256sums_aarch64=('26a07c9f83ed3a869231b4e1ba0695e89e89bccb9cd2d6d4b7ed4502948cbfc0')
provides=('gut')

package() {
    cd "$srcdir"
    install -Dm755 gut -t "${pkgdir}/usr/bin"
}
