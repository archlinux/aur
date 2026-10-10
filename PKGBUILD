# Maintainer: tee < teeaur at duck dot com >
pkgname=rill-bin
pkgver=0.90.5
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
sha256sums=('31f3140a2866cfd1201c842ea24d3dbd058cbc4b164e4245ae473d558fff9794')

package() {
  install -Dm755 rill -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
