# Contributor: Vithon <ratm@archlinux.us>
# Maintainer: Zoe <chp321@gmail.com>
pkgname=quelcom
pkgver=0.4.0_18
_pkgver=0.4.0
pkgrel=2
pkgdesc="Provides assorted tools to perform simple editing operations on MP3 and WAV audio files. These include fading, check-and-clean, informational extraction and lossless cutting and joining without reencoding."
license=('GPL-2.0-or-later')
makedepends=('libarchive')
depends=('gcc-libs' 'glibc' 'bash')
url="https://github.com/posixru/quelcom"
arch=('x86_64')

source=("http://mirrors.edge.kernel.org/ubuntu/pool/universe/q/${pkgname}/${pkgname}_${_pkgver}-18_amd64.deb")
md5sums=('8be9fa13f27801f27746ea64a3090873')

package() {
    cd ${srcdir}
    bsdtar -xf data.tar.zst -C ${pkgdir} || return 1
}
