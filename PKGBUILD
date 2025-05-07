# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="ntopng-data"
# to update visit https://packages.ntop.org/apt/bookworm/all/ and keep track of the latest pkgver, date and build
_pkgverAmd=6.5
_dateAmd=250507
# updated automatically
pkgver="$_pkgverAmd.$_dateAmd"
pkgrel=1
pkgdesc="Web-based traffic monitoring"
url="Geolocation databases for ntopng and other ntop software packaged from https://db-ip.com"
license=("GPL3")
arch=("any")
depends=("ntopng")
source=("https://packages.ntop.org/apt/bookworm/all/ntopng-data_${_pkgverAmd}.${_dateAmd}_all.deb")
b2sums=('aea066b13e8227fbea0027ba69bbb7e39aa5265c98ded3f8dda96375b99ec0bb39c95772897007315456cbb7496d10b85362a7ca353dc7b79e58abd2dcffd948')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 # program files
 cp -r "usr" "$pkgdir"
}
