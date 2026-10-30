# Maintainer: username227 {gfrank227 [at] gmail [dot] com}

pkgname=rhythmbox-folder-shuffle
_foldername=foldershuffle
pkgver=1.4.0
pkgrel=1
pkgdesc="Continuous folder shuffle plugin for Rhythmbox"
arch=('x86_64')
url="https://github.com/username227/Rhythmbox-Folder-Shuffle"
license=('GPL-3.0-or-later')
depends=('rhythmbox' 'libpeas' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ecda1dbe2574febeaf1f4cf2d95b9d33b0dfb502e26f2009ecd4e34070f5f7c3')

package() {
    cd "${srcdir}/Rhythmbox-Folder-Shuffle-${pkgver}"
    install -Dm644 $_foldername/$_foldername.py -t "${pkgdir}/usr/lib/rhythmbox/plugins/$_foldername"
    install -Dm644 $_foldername/$_foldername.plugin -t "${pkgdir}/usr/lib/rhythmbox/plugins/$_foldername"
    install -Dm644 $_foldername/folder-shuffle.svg -t "$pkgdir/usr/lib/rhythmbox/plugins/$_foldername"
}
