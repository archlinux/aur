# Maintainer: username227 {gfrank227 [at] gmail [dot] com}

pkgname=rhythmbox-now-playing-sidebar
_foldername=nowplayingsidebar
pkgver=1.3.0
pkgrel=1
pkgdesc="Adds a Now Playing box to Rhythmbox's left sidebar"
arch=('x86_64')
url="https://github.com/username227/Rhythmbox-Now-Playing-Sidebar"
license=('GPL-3.0-or-later')
depends=('rhythmbox' 'libpeas' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5b6e65787d809b86c42c8bacedd6d73d137831f44edbfd47376c1761767edbda')

package() {
    cd "${srcdir}/Rhythmbox-Now-Playing-Sidebar-${pkgver}"
    install -Dm644 $_foldername/$_foldername.py -t "${pkgdir}/usr/lib/rhythmbox/plugins/$_foldername"
    install -Dm644 $_foldername/$_foldername.plugin -t "${pkgdir}/usr/lib/rhythmbox/plugins/$_foldername"
}
