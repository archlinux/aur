# Maintainer: Josesk Volpe <joseskvolpe at gmail dot com>

pkgname=kf5-servicemenus-clamtkscan
pkgver=1.0.2
pkgrel=1
pkgdesc="KDE service context to scan files and directories with ClamTK"
arch=('any')
url="https://gist.github.com/JoseskVolpe/b96966dd8fcde5eea96739d2a35c7e6a"
replaces=('kde-servicemenus-clamtkscan')
license=('LGPL')
depends=(
	'dolphin'
	'clamtk'
)
source=("ClamTKScan.desktop")
sha256sums=('073bc526f96b0b7a81a2f5a2584d2b68a8b0bc4ca08214065013476e86f68afd')

package() {
	mkdir -p $pkgdir/usr/share/kio/servicemenus/
	cp ClamTKScan.desktop $pkgdir/usr/share/kio/servicemenus/ClamTKScan.desktop
}
