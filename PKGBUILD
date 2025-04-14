# Maintainer: tee < teeaur at duck dot com >
pkgname=rill-bin
pkgver=0.59.2
pkgrel=1
pkgdesc="Rill is an operational BI tool that provides fast dashboards that your team will actually use."
#Rill rethinks BI dashboards with embedded database and instant UX
arch=(x86_64)
url="https://rilldata.com"
license=('Apache')
provides=('rill')
conflicts=('rill')
source=("rill-$pkgver.zip::https://github.com/rilldata/rill/releases/download/v$pkgver/rill_linux_amd64.zip")
sha256sums=('dda40fb6bf0c56aced0acc19846102ce3bac0b6d8d0d8d72bc15adc4d70f9293')

package() {
    install -Dm0755 rill "$pkgdir/usr/bin/rill"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
