# Maintainer: tee < teeaur at duck dot com >
pkgname=rill-bin
pkgver=0.42.0
pkgrel=1
pkgdesc="Rill is an operational BI tool that provides fast dashboards that your team will actually use."
#Rill rethinks BI dashboards with embedded database and instant UX
arch=(x86_64)
url="https://rilldata.com"
license=('Apache')
provides=('rill')
conflicts=('rill')
source=("rill-$pkgver.zip::https://github.com/rilldata/rill/releases/download/v$pkgver/rill_linux_amd64.zip")
sha256sums=('760376a3b89fc493c6bcfa75b1a4f80078b86eb5ea2c5127ad9a4e3f22d6eab0')

package() {
    install -Dm0755 rill "$pkgdir/usr/bin/rill"
	install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
