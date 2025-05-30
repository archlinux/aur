# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Alex Gagne [SpectralMemories] <aaalex12gagne@gmail.com>

pkgname=lazpaint-bin
_pkgname=lazpaint
pkgver=7.3
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
sha256sums_x86_64=('8724bb6a18d3d82c98f6f9d522b52235ede9cfc4bf5459d49d85008ae68d6ef8')
sha256sums_i686=('e39b3a9497ecbce19d63ef9587f5c2230e1125d4fad2ed4a230b8da37b220ee6')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.zst"
}
