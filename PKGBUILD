# Maintainer: ranger.linux@gmail.com

pkgname=arch-konqueror-search
pkgver=0.1
pkgrel=2
pkgdesc="Arch search engines for konqueror (AUR, Pkgs, BBS, Wiki)"
arch=(any)
url="http://archlinux.org"
license=('GPL')
conflicts=('arch-konqueror-search-adslgr')
depends=("kdebase-konqueror>=4.3")
source=(arpkg.desktop
	arwiki.desktop
	aur.desktop
	arforum.desktop)
md5sums=('c56c5541e64948c676c9e0a985c02691'
	'ea2f29a2a06f735aa64ab97b41d109a8'
	'626910e3b9baba01d5dced284c368945'
	'ff728a24de1038d1db888a02fd7fd7b3')
build() {
	cd $srcdir
	local prefix=${pkgdir}/usr/share/kde4/services/searchproviders/
	install -D -m 0644 arpkg.desktop ${prefix}/arpkg.desktop &&
	install -D -m 0644 arwiki.desktop ${prefix}/arwiki.desktop &&
	install -D -m 0644 aur.desktop ${prefix}/aur.desktop &&
	install -D -m 0644 arforum.desktop ${prefix}/arforum.desktop
}
