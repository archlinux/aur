# Maintainer: klpod221 <klpod221@gmail.com>

_pkgauthor=klpod221
_pkgname=kerminal
appname=Kerminal
pkgname=${_pkgname}-bin
pkgver=2.4.5
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Modern Terminal Emulator & SSH Manager"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc' 'gcc-libs' 'glib2' 'gtk3' 'cairo' 'webkit2gtk-4.1' 'libsoup3' 'gdk-pixbuf2' 'hicolor-icon-theme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

install="${pkgname}.install"
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${appname}_${pkgver}_${_barch[0]}_linux.deb")
sha256sums_x86_64=('5814b7b628486a27c7620659acb30f539c911763b405779642485c0c1f64c342')


package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
}
