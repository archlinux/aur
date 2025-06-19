# Maintainer: tee < teeaur at duck dot com >
pkgname=rill-bin
pkgver=0.65.0
pkgrel=1
pkgdesc="Rill is an operational BI tool that provides fast dashboards that your team will actually use."
#Rill rethinks BI dashboards with embedded database and instant UX
arch=(x86_64)
url="https://rilldata.com"
license=('Apache-2.0')
provides=('rill')
conflicts=('rill')
source=("rill-$pkgver.zip::https://github.com/rilldata/rill/releases/download/v$pkgver/rill_linux_amd64.zip")
sha256sums=('a2eb93bf9c920aa1fdf70799baaf17ab67ec20d7c54dc9d989232c3c33f64a5c')

package() {
    install -Dm0755 rill "$pkgdir/usr/bin/rill"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
