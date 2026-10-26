# Maintainer: username227 {gfrank227 [at] gmail [dot] com}

pkgname=rhythmbox-now-playing-sidebar
_foldername=nowplayingsidebar
pkgver=1.2.0
pkgrel=1
pkgdesc="Adds a Now Playing box to Rhythmbox's left sidebar"
arch=('x86_64')
url="https://github.com/username227/Rhythmbox-Now-Playing-Sidebar"
license=('GPL-3.0-or-later')
depends=('rhythmbox' 'libpeas' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d0bed11074aa25942db57bc008605e1ca194f247e0a00a9c432703f705c2a014')

package() {
    cd "${srcdir}/Rhythmbox-Now-Playing-Sidebar-${pkgver}"
    install -Dm644 $_foldername/$_foldername.py -t "${pkgdir}/usr/lib/rhythmbox/plugins/$_foldername"
    install -Dm644 $_foldername/$_foldername.plugin -t "${pkgdir}/usr/lib/rhythmbox/plugins/$_foldername"
}
