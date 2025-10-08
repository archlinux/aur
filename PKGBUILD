# Maintainer: tee < teeaur at duck dot com >
pkgname=rill-bin
pkgver=0.73.1
pkgrel=1
pkgdesc="Rill is an operational BI tool that provides fast dashboards that your team will actually use."
#Rill rethinks BI dashboards with embedded database and instant UX
arch=(x86_64)
url="https://rilldata.com"
license=('Apache-2.0')
provides=('rill')
conflicts=('rill')
source=("rill-$pkgver.zip::https://github.com/rilldata/rill/releases/download/v$pkgver/rill_linux_amd64.zip")
sha256sums=('eb6807053871b200448658fc9d10080a3622b0088e4ca0282d2a15de31a1e1bd')

package() {
    install -Dm755 rill "$pkgdir/usr/bin/rill"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4:
