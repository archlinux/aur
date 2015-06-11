# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Previous maintainer: crshd <crshd@mail.com>

pkgname=nafe
pkgver=0.1
pkgrel=1
pkgdesc="Toolset to translate PSF format consolefonts into text files and text files into PSF files."
url="http://nafe.sourceforge.net"
arch=('x86_64' 'i686')
license=('GPL2')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('c1066cf003a46bb3908f322c7ed9d529')


build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make all
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p -- "${pkgdir}/usr/bin"
    cp -- txt2psf psf2txt "${pkgdir}/usr/bin"
}

