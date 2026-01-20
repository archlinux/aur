# Maintainer: Justin Dickey <justin.dickey.eg@gmail.com>

pkgname=goplaying-bin
pkgver=0.3.1
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
sha256sums=('3587fadfaaedb2a6f0ae1ea2d1223328b99de3be83bb2dcf91533f8bca1ab397'
            'SKIP')

package() {
  install -Dm755 goplaying "$pkgdir/usr/bin/goplaying"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
