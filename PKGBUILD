# DO NOT EDIT DIRECTLY: Managed by scripts/sync_metadata.go from app.config.json
# Maintainer: Alexander Mot <alexander@amot.dev>
pkgname=planisphere-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Elite Dangerous expedition flight planner, fleet carrier router, and astrometric telemetry terminal"
arch=('x86_64')
url="https://github.com/amot-dev/planisphere"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1')
source=("$url/releases/download/v$pkgver/planisphere-v$pkgver-linux-amd64.tar.gz")
sha256sums=('c00a679b1dd77bc20ebd87bdc8009edfd83ec212471e55954ab35c50821d8548')

package() {
  cd "$srcdir"
  install -Dm755 planisphere "$pkgdir/usr/bin/planisphere"
  install -Dm644 planisphere.desktop "$pkgdir/usr/share/applications/planisphere.desktop"
  install -Dm644 planisphere.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/planisphere.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
