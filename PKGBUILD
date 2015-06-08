    # Maintainer: FadeMind <fademind@gmail.com>

_pkgname=EleganZe
pkgname=gnome-shell-theme-eleganze
pkgver=0.2.0
pkgrel=1
pkgdesc="EleganZe GNOME Shell theme for GNOME 3.16"
arch=('any')
url="http://opendesktop.org/content/show.php?content=167239"
license=('GPL3')
depends=('gnome-shell')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("${_pkgname}.tar.lzma::https://copy.com/iJ066JteRTAKSJ6r/${_pkgname}.tar.lzma?download=1")
sha256sums=('58de5a072942f484e8c9ea05daf7660645de29e1eac4f167288ca5e6422827a2')

package() {
    install -dm755 "${pkgdir}/usr/share/themes"
    cp -rf "${_pkgname}" "${pkgdir}/usr/share/themes"
} 
