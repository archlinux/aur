# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: klpod221 <klpod221@gmail.com>

_pkgauthor=klpod221
_pkgname=kerminal
pkgname=${_pkgname}-bin
pkgver=2.1.1
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
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.deb::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[0]}.deb")
sha256sums_x86_64=('71584bdac9c3f0da8caa54ca6a2ddf8c012489cc3c58885690ce3ec8c814b67c')


package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
}
