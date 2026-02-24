# Maintainer: Justin Dickey <justin.dickey.eg@gmail.com>

pkgname=goplaying-bin
pkgver=0.3.5
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
sha256sums=('48610beb432f4df258686b7fc9b14bd4eceadec2ba716a8f4e0ac918d2300e66'
            'SKIP')

package() {
  install -Dm755 goplaying "$pkgdir/usr/bin/goplaying"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
