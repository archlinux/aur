# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Alex Gagne [SpectralMemories] <aaalex12gagne@gmail.com>

pkgname=lazpaint-bin
_pkgname=lazpaint
pkgver=7.1.6
pkgrel=1
pkgdesc='Image editor, like PaintBrush or Paint.Net, written in Lazarus (Free Pascal). Binary release (GTK2)'
arch=('x86_64' 'i686')
url='https://lazpaint.github.io/'
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('gtk2' 'desktop-file-utils')
source_x86_64=("https://github.com/bgrabitmap/${_pkgname}/releases/download/v${pkgver}/lazpaint${pkgver}_linux64.deb")
source_i686=("https://github.com/bgrabitmap/${_pkgname}/releases/download/v${pkgver}/lazpaint${pkgver}_linux32.deb")
sha256sums_x86_64=('66ecc46318975d34c9f9b3fce8168010b7c22134f350f638b76d8d10c097cf8c')
sha256sums_i686=('148601cef036c41f955b4e26bb0e5706ab3d744e5a1081c6b5eec88dba57fab9')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.xz"
}
