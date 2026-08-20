# Maintainer: tee < teeaur at duck dot com >
pkgname=rill-bin
pkgver=0.89.0
pkgrel=1
pkgdesc="Rill is an operational BI tool that provides fast dashboards that your team will actually use"
#Rill rethinks BI dashboards with embedded database and instant UX
#"Rill is the fastest BI tool for humans and agents, powered by OLAP engines like ClickHouse and DuckDB"
arch=(x86_64)
url="https://rilldata.com"
license=('Apache-2.0')
provides=('rill')
conflicts=('rill')
source=("rill-$pkgver.zip::https://github.com/rilldata/rill/releases/download/v$pkgver/rill_linux_amd64.zip")
sha256sums=('5813e7404a8558ec30fe765429c81006e2884eecf361eeea56debe6c099c6e8d')

package() {
  install -Dm755 rill -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
