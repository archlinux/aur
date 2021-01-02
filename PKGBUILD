# Contributor: Vithon <ratm@archlinux.us>
# Maintainer: Zoe <chp321@gmail.com>
pkgname=quelcom
pkgver=0.4.0_15
_pkgver=0.4.0
pkgrel=1
pkgdesc="Quelcom provides assorted tools to perform simple editing operations on MP3 and WAV audio files. These include fading, check-and-clean, informational extraction and lossless cutting and joining without reencoding."
license=('GPL')
url="https://github.com/posixru/quelcom"
arch=('x86_64')

source=("http://mirrors.edge.kernel.org/ubuntu/pool/universe/q/${pkgname}/${pkgname}_${_pkgver}-15_amd64.deb")
md5sums=('be0495c7714f6f624ee379f5627c6fee')

package() {
    cd ${srcdir}
    bsdtar -xf data.tar.xz -C ${pkgdir} || return 1
}
