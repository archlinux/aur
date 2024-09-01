# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=eaglemode-bin
basename=eaglemode
pkgver=0.96.2
pkgrel=1
pkgdesc="Visit almost everything in your PC simply by zooming in"
arch=('x86_64')
url="http://eaglemode.sourceforge.net/"
license=('GPL3')
conflicts=('eaglemode')
provides=('eaglemode')
makedepends=('tar')
depends=('desktop-file-utils' 'gtk2' 'hicolor-icon-theme' 'libtiff'
         'libpng' 'librsvg' 'poppler-glib' 'xdg-utils' 'vlc' 'xz')
optdepends=('perl: Fetching stock market info for the emStocks plugin'
            'htmldoc: Rendering HTML documents')
source=("https://downloads.sourceforge.net/${basename}/${basename}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('094f55608e1fde824f3fa3f6651d6cd5d25b59fa98d276474d9512b7d9889947')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.xz"
} 
