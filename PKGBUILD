# Maintainer: Justin Dickey <justin.dickey.eg@gmail.com>

pkgname=goplaying-bin
pkgver=0.3.2
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
sha256sums=('7e1d1a83da808be4d37b0f231865b851286d4bd7254a757dc16547257eb8bc45'
            'SKIP')

package() {
  install -Dm755 goplaying "$pkgdir/usr/bin/goplaying"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
