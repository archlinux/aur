# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="ntopng-data"
# to update visit https://packages.ntop.org/apt/trixie/all/ and keep track of the latest pkgver, date and build
_pkgverAmd=6.5
_dateAmd=251012
# updated automatically
pkgver="$_pkgverAmd.$_dateAmd"
pkgrel=1
pkgdesc="Web-based traffic monitoring"
url="Geolocation databases for ntopng and other ntop software packaged from https://db-ip.com"
license=("GPL3")
arch=("any")
depends=("ntopng")
source=("https://packages.ntop.org/apt/trixie/all/ntopng-data_${_pkgverAmd}.${_dateAmd}_all.deb")
b2sums=('7db28d54dad299e422a12485bb6a2437967d0c09d4035ff421d3b3d2d19d709106ab98d0a4779a46b447fe12a1a58607d0687e55c43296cb6f895c0d471b36f2')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 # program files
 cp -r "usr" "$pkgdir"
}
