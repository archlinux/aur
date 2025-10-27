# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: klpod221 <klpod221@gmail.com>

_pkgauthor=klpod221
_pkgname=kerminal
appname=Kerminal
pkgname=${_pkgname}-bin
pkgver=2.2.1
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
sha256sums_x86_64=('114bbc8367592f864dae2f0f003b693c34bfdce60319d96d0e90bb8a1f80a39c')


package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
}
