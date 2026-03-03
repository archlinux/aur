# Maintainer: Justin Dickey <justin.dickey.eg@gmail.com>

pkgname=goplaying-bin
pkgver=0.3.6
pkgrel=1
pkgdesc="Now Playing TUI written in Go (binary release)"
arch=('x86_64')
url="https://github.com/justinmdickey/goplaying"
license=('MIT')
depends=('playerctl')
options=(!debug)
provides=('goplaying')
conflicts=('goplaying' 'goplaying-git')
source=("https://github.com/justinmdickey/goplaying/releases/download/v${pkgver}/goplaying_${pkgver}_Linux_x86_64.tar.gz"
        "https://raw.githubusercontent.com/justinmdickey/goplaying/v${pkgver}/LICENSE")
sha256sums=('1dd0256d1f68054fb3f1b49aa5f29ad6e3f54d21876a3b919e89d2469988bb02'
            'SKIP')

package() {
  install -Dm755 goplaying "$pkgdir/usr/bin/goplaying"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
