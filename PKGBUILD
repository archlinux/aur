# Maintainer: tee < teeaur at duck dot com >
pkgname=rill-bin
pkgver=0.90.2
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
sha256sums=('dadf1bbfefe1ee0aa48a6608af2a3619c714e4667605d1234ed15ea8faa1eff5')

package() {
  install -Dm755 rill -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
