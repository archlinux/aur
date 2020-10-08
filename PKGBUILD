# Maintainer: Rodrigo Farias <rodrigofarias77@gmail.com>

pkgname=plata-theme-bin
pkgver=0.9.9
pkgrel=1
pkgdesc='A Gtk theme based on Material Design Refresh (PPA package)'
arch=('any')
url='https://gitlab.com/tista500/plata-theme'
license=('CCPL' 'GPL2')
optdepends=('gtk-engine-murrine' 'ttf-roboto')
conflicts=('plata-theme')
source=("https://launchpad.net/~tista/+archive/ubuntu/plata-theme/+files/plata-theme_${pkgver}-0ubuntu1~focal1_all.deb")
md5sums=('3c7bb3f6b32265d84e1f271881c3aec7')

package () {
	cd "${pkgdir}"
	tar -xf "${srcdir}/data.tar.xz"
	rm -r usr/share/doc
}
