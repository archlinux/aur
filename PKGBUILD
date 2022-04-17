# Maintainer: Josesk Volpe <joseskvolpe at gmail dot com>

pkgname=kde-servicemenus-clamtkscan
pkgver=1.0.1
pkgrel=1
pkgdesc="KDE service context to scan files and directories with ClamTK"
arch=('any')
url="https://gist.github.com/JoseskVolpe/b96966dd8fcde5eea96739d2a35c7e6a"
license=('LGPL')
depends=(
	'dolphin'
	'clamtk'
)
makedepends=(
	'git'
)
source=("ClamTKScan.desktop")
sha256sums=('a451bb50950a38dce849bdf9db7e00da0575951b243b37d7b0f5ff9a25a59b21')

package() {
	mkdir -p $pkgdir/usr/share/kio/servicemenus/
	cp ClamTKScan.desktop $pkgdir/usr/share/kio/servicemenus/ClamTKScan.desktop
}
