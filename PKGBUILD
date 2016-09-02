# Maintainer: Renaud Littolff <rlittolff@gmail.com>

pkgname=insomnia
pkgver=3.3.0
pkgrel=1
pkgdesc="A simple and beautiful REST API and HTTP client"
arch=('i686' 'x86_64')
url="http://insomnia.rest/"
options=('!strip' '!upx')

source=("https://s3.amazonaws.com/builds-insomnia-rest/linux/insomnia-${pkgver}.deb")
md5sums=('73ed3cd54cb8b316cb59dcc8e22cde4a')

package() {
    cd "${srcdir}"

    tar -xf data.tar.xz -C "${pkgdir}"

    install -d "${pkgdir}"/usr/share/applications
    install -d "${pkgdir}"/usr/share/icons
    install -d "${pkgdir}"/opt/Insomnia

    chmod -R go-w "${pkgdir}"/usr
}
