# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Alex Gagne [SpectralMemories] <aaalex12gagne@gmail.com>

pkgname=lazpaint-bin
_pkgname=lazpaint
pkgver=7.1.5
pkgrel=1
pkgdesc='Image editor, like PaintBrush or Paint.Net, written in Lazarus (Free Pascal). Binary release (GTK2)'
arch=('x86_64')
url='https://lazpaint.github.io/'
license=('GPL3')
depends=('gtk2' 'desktop-file-utils')
provides=("${_pkgname}")
conflicts=("${_pkgname}-qt4" "${_pkgname}-gtk2")
source=("https://github.com/bgrabitmap/${_pkgname}/releases/download/v${pkgver}/lazpaint${pkgver}_linux64.deb")
sha256sums=('2043e5e104101e8bf2005f64971b31e4cafa8e76ec5803f780d63f39c7d5ff9c')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.xz"
}
