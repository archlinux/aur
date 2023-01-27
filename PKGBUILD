# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="ntopng-data"
# to update visit https://packages.ntop.org/apt/bullseye/all/ and keep track of the latest pkgver, date and build
_pkgverAmd=5.5
_dateAmd=230127
# updated automatically
pkgver="$_pkgverAmd.$_dateAmd"
pkgrel=1
pkgdesc="Web-based traffic monitoring"
url="Geolocation databases for ntopng and other ntop software packaged from https://db-ip.com"
license=("GPL3")
arch=("any")
depends=("ntopng")
source=("https://packages.ntop.org/apt/bullseye/all/ntopng-data_${_pkgverAmd}.${_dateAmd}_all.deb")
sha256sums=('942de05430a40ec71e7befbfa855c858b1746eed7cef0df1f496c477851f2e2b')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 # program files
 cp -r "usr" "$pkgdir"
}
