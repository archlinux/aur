# Maintainer: kaptoxic <kaptoxic _at_ yahoo _dot_ com >
# Contributor: Sean Burau <seanburau at gmail dot com>
# Upgrade to 3.0.1: Simon Luijk <simon dot luijk gmail dot com>
pkgname=pidgin-emoticons-trollicons-git
pkgver=1.0
pkgrel=2
pkgdesc="Popular rage faces in Pidgin"
arch=("any")
url="https://github.com/sagargp/trollicons"
license=("BSD")
depends=("pidgin")
makedepends=()
source=("https://github.com/unregistered/trollicon-binaries/blob/master/trollicons-pidgin.zip?raw=true")
md5sums=('64b59329b17bf882c6c7f2303c9d3cd4')

package() {
	local _installPath="/usr/share/pixmaps/pidgin/emotes/trollicons"

	cd "$srcdir" || return 1
		
	# Move the files to their appropriate location
	install -m 755 -d "$pkgdir/$_installPath"
	install -m 644 trollicons-pidgin/* "$pkgdir/$_installPath"
}
