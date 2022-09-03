# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Alex Gagne [SpectralMemories] <aaalex12gagne@gmail.com>

pkgname=lazpaint-bin
_pkgname=lazpaint
pkgver=7.2.2
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
sha256sums_x86_64=('53bc39c7f463de0f85ebdc7499a0ca971892a84c576a13582d9377240c256b18')
sha256sums_i686=('a07ff0b7d12f1183b974ede47d0a1cf46255dc58646f8465ccf6370f3a0e4197')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.zst"
}
