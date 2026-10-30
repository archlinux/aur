# Maintainer: username227 {gfrank227 [at] gmail [dot] com}

pkgname=rhythmbox-session-restore
_foldername=sessionrestore
pkgver=1.0.0
pkgrel=1
pkgdesc="Continuous folder shuffle plugin for Rhythmbox"
arch=('x86_64')
url="https://github.com/username227/Rhythmbox-Session-Restore"
license=('GPL-3.0-or-later')
depends=('rhythmbox' 'libpeas' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9c251c3456b0b21bea7d74f7cec4a4545b9dbfeec34e90abb7246559fec5defd')

package() {
    cd "${srcdir}/Rhythmbox-Session-Restore-${pkgver}"
    install -Dm644 $_foldername/$_foldername.py -t "${pkgdir}/usr/lib/rhythmbox/plugins/$_foldername"
    install -Dm644 $_foldername/$_foldername.plugin -t "${pkgdir}/usr/lib/rhythmbox/plugins/$_foldername"
}
