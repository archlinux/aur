# Maintainer: tee < teeaur at duck dot com >
pkgname=rill-bin
pkgver=0.47.4
pkgrel=1
pkgdesc="Rill is an operational BI tool that provides fast dashboards that your team will actually use."
#Rill rethinks BI dashboards with embedded database and instant UX
arch=(x86_64)
url="https://rilldata.com"
license=('Apache')
provides=('rill')
conflicts=('rill')
source=("rill-$pkgver.zip::https://github.com/rilldata/rill/releases/download/v$pkgver/rill_linux_amd64.zip")
sha256sums=('a1c1da1dc0ca951da018064753a9072c7e3910e0a883e23a573ee632935ddb7e')

package() {
    install -Dm0755 rill "$pkgdir/usr/bin/rill"
	install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
