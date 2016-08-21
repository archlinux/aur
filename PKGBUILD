# Maintainer: Renaud Littolff <rlittolff@gmail.com>

pkgname=insomnia
pkgver=3.2.2
pkgrel=1
pkgdesc="Beautiful HTTP Requests"
arch=('i686' 'x86_64')
url="http://insomnia.rest/"
options=('!strip' '!upx')

source=("https://s3.amazonaws.com/builds-insomnia-rest/linux/insomnia-${pkgver}.deb")
md5sums=('e2117f8aa673eecdf5b11b0aed81be74')

package() {
    cd "${srcdir}"

    tar -xf data.tar.xz -C "${pkgdir}"

    install -d "${pkgdir}"/usr/share/applications
    install -d "${pkgdir}"/usr/share/icons
    install -d "${pkgdir}"/opt/Insomnia

    chmod -R go-w "${pkgdir}"/usr
}
