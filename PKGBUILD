# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=agregore-browser-bin
pkgver=1.0.0_44
pkgrel=1
pkgdesc='A minimal web browser for the distributed web'
arch=('x86_64' 'i686')
url='https://github.com/AgregoreWeb/agregore-browser'
license=('AGPL3')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
source_x86_64=("https://github.com/AgregoreWeb/agregore-browser/releases/download/v1.0.0-44/agregore-browser_1.0.0-44_amd64.deb")
source_i686=("https://github.com/AgregoreWeb/agregore-browser/releases/download/v1.0.0-44/agregore-browser_1.0.0-44_i386.deb")

package() {
	tar xvf data.tar.xz --directory="$pkgdir"

	install -d "${pkgdir}/usr/bin"
	ln -s '/opt/Agregore Browser/agregore-browser' "${pkgdir}/usr/bin/agregore-browser"

	mv "${pkgdir}/usr/share/icons/hicolor/0x0/apps/" "${pkgdir}/usr/share/pixmaps"
	rm -r "${pkgdir}/usr/share/icons"
}
b2sums_x86_64=('f5f5ebd1283b915afd83f4cb037a36c5b48279d678b1059bf589cc5731713d382537fe10718a39e10cfd94d424399c79774f3bd7ae0eb016d2edf76b73fd368e')
b2sums_i686=('53829d1ce76ae2641aa404cacc46e1c312d8944d82898dbfb2d2aec553f5ebec78d26579cd86b4fc7d63d45ec14c64a54e79d2f3fc3dfc209742b51790d83280')
