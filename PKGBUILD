# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="ntopng-data"
# to update visit https://packages.ntop.org/apt/trixie/all/ and keep track of the latest pkgver, date and build
_pkgverAmd=6.7
_dateAmd=251208
# updated automatically
pkgver="$_pkgverAmd.$_dateAmd"
pkgrel=1
pkgdesc="Web-based traffic monitoring"
url="Geolocation databases for ntopng and other ntop software packaged from https://db-ip.com"
license=("GPL3")
arch=("any")
depends=("ntopng")
source=("https://packages.ntop.org/apt/trixie/all/ntopng-data_${_pkgverAmd}.${_dateAmd}_all.deb")
# the sha512 sums are present in https://packages.ntop.org/apt/trixie/all/Packages
sha512sums=('306aee6796c70327e31e44db5b8a946aff3b3db6c4ef0adf78ffb73e1ca094096426d0882f1241cd204b65039fbfa8ed88a89f8bd871dc2c4a38d39f1e6b0731')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 # program files
 cp -r "usr" "$pkgdir"
}
