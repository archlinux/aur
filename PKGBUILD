# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="ntopng-data"
# to update visit https://packages.ntop.org/apt/bookworm/all/ and keep track of the latest pkgver, date and build
_pkgverAmd=6.1
_dateAmd=240720
# updated automatically
pkgver="$_pkgverAmd.$_dateAmd"
pkgrel=1
pkgdesc="Web-based traffic monitoring"
url="Geolocation databases for ntopng and other ntop software packaged from https://db-ip.com"
license=("GPL3")
arch=("any")
depends=("ntopng")
source=("https://packages.ntop.org/apt/bookworm/all/ntopng-data_${_pkgverAmd}.${_dateAmd}_all.deb")
b2sums=('2ac1b60576c3a5a2838a3525c7647d148fa9a2334c562823ea923f810a2457908542171c82e25b0c3d45413af301cf631db9d4d6aaa8c2fc441e947bb648c9f8')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 # program files
 cp -r "usr" "$pkgdir"
}
