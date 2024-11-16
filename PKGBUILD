# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="ntopng-data"
# to update visit https://packages.ntop.org/apt/bookworm/all/ and keep track of the latest pkgver, date and build
_pkgverAmd=6.3
_dateAmd=241116
# updated automatically
pkgver="$_pkgverAmd.$_dateAmd"
pkgrel=1
pkgdesc="Web-based traffic monitoring"
url="Geolocation databases for ntopng and other ntop software packaged from https://db-ip.com"
license=("GPL3")
arch=("any")
depends=("ntopng")
source=("https://packages.ntop.org/apt/bookworm/all/ntopng-data_${_pkgverAmd}.${_dateAmd}_all.deb")
b2sums=('e6ea1c3e265cd05c84f8f00f0b58d7cbdbf6c157ceabc0c35500f8e6deb6f22e353e2e36310eec009bd58abf5968fb40f7bd95aaeb7a71afe66003afd3875c64')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 # program files
 cp -r "usr" "$pkgdir"
}
