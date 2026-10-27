# Maintainer: username227 {gfrank227 [at] gmail [dot] com}

pkgname=rhythmbox-folder-shuffle
_foldername=foldershuffle
pkgver=1.1.0
pkgrel=1
pkgdesc="Continuous folder shuffle plugin for Rhythmbox"
arch=('x86_64')
url="https://github.com/username227/Rhythmbox-Folder-Shuffle"
license=('GPL-3.0-or-later')
depends=('rhythmbox' 'libpeas' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c5a36e11a3c8fa9e277128b17e284b9251b7d733b6bfed82765df79f08f06616')

package() {
    cd "${srcdir}/Rhythmbox-Folder-Shuffle-${pkgver}"
    install -Dm644 $_foldername/$_foldername.py -t "${pkgdir}/usr/lib/rhythmbox/plugins/$_foldername"
    install -Dm644 $_foldername/$_foldername.plugin -t "${pkgdir}/usr/lib/rhythmbox/plugins/$_foldername"
    install -Dm644 $_foldername/folder-shuffle.svg -t "$pkgdir/usr/lib/rhythmbox/plugins/$_foldername"
}
