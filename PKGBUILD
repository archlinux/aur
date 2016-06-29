# Maintainer: Renaud Littolff <rlittolff@gmail.com>

pkgname=mongobooster
_shortpkgver=2.2
pkgver=2.2.1
pkgrel=1
pkgdesc="The Smartest MongoDB Admin GUI"
arch=('x86_64')
url="http://mongobooster.com"
options=('!strip' '!upx')

source_x86_64=("https://s3.amazonaws.com/mongobooster/download/${_shortpkgver}/mongobooster-${pkgver}-amd64.deb")
md5sums_x86_64=('c6638a3761905812cfd7594b9b22869b')

package() {
    cd "${srcdir}"
    pwd

    tar -xf data.tar.xz -C "${pkgdir}"

    install -d "${pkgdir}"/usr/share/applications
    install -d "${pkgdir}"/opt/mongobooster

    chmod -R go-w "${pkgdir}"/usr
}
