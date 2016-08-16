# Maintainer: Renaud Littolff <rlittolff@gmail.com>

pkgname=insomnia
pkgver=3.2.0
pkgrel=1
pkgdesc="Beautiful HTTP Requests"
arch=('i686' 'x86_64')
url="http://insomnia.rest/"
options=('!strip' '!upx')
#depends=('nss' 'libxtst' 'gcc-libs-multilib' 'alsa-lib' 'gconf' 'gtk2')

source=("https://s3.amazonaws.com/builds-insomnia-rest/linux/insomnia-${pkgver}.deb")
md5sums=('f44afb46b3a27d4e6d797729ed9f66c0')

package() {
    cd "${srcdir}"

    tar -xf data.tar.xz -C "${pkgdir}"

    install -d "${pkgdir}"/usr/share/applications
    install -d "${pkgdir}"/usr/share/icons
    install -d "${pkgdir}"/opt/Insomnia

    chmod -R go-w "${pkgdir}"/usr
}
