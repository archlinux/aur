# Maintainer: Master81 <FreeFighter81 at protonmail dot com>
pkgname=toosheh-extractor
pkgver=4.3.7509.24771
pkgrel=2
pkgdesc="Official toosheh extractor CLI for Linux. Please USE A VPN or any anti-censorship tool before installing this package."
arch=('x86_64' 'aarch64')
url="https://www.toosheh.org/download/"
license=('other')
depends=()
provides=(toosheh-extractor)
conflicts=(toosheh-extractor)
#getting from official link
source=("https://s3-us-west-2.amazonaws.com/lisa-app/extract-linux-x64.zip")
md5sums=('SKIP')
options=('!strip')


package() {
	install -d $pkgdir/usr/bin
	install -Dm755 "${srcdir}"/extract "${pkgdir}"/usr/bin/toosheh-extractor
}
