# Maintainer: tee < teeaur at duck dot com >
pkgname=rill-bin
pkgver=0.86.4
pkgrel=1
pkgdesc="Rill is an operational BI tool that provides fast dashboards that your team will actually use"
#Rill rethinks BI dashboards with embedded database and instant UX
arch=(x86_64)
url="https://rilldata.com"
license=('Apache-2.0')
provides=('rill')
conflicts=('rill')
source=("rill-$pkgver.zip::https://github.com/rilldata/rill/releases/download/v$pkgver/rill_linux_amd64.zip")
sha256sums=('32c01569990c95123f0766350797a23cbdf3940697af30376d2244436c8e3146')

package() {
    install -Dm755 rill -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
