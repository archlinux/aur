# Maintainer: CValente <cvalente (a) email com>

pkgname=quantum-moves
pkgver=20160521	#not versioned upstream (WTF)
pkgrel=1
pkgdesc="Contribute to physics research by finding clever ways of manipulating and moving atoms"
arch=(i686 x86_64)
url="https://www.scienceathome.org/games/quantum-moves/"
license=('custom:freeware')
depends=()
makedepends=()
options=('!strip' '!buildflags')
source=(
    'https://builds.scienceathome.org/quantum-moves/QuantumMoves.7z'
    'quantum_moves.run')
sha256sums=(
    '6d974c220d870a895df55f0303561481b2f463179f93c43e56ba57d5a4697f46'
    'c0ee4ae884c6036cd74161e8c6c33633868d7f3d509fe22390fd9e84ba84c745'
)

package() {
  install -dm755 "$pkgdir/opt/"
  cp -r "$srcdir" "$pkgdir/opt/quantum_moves"
  chmod +x "$pkgdir/opt/quantum_moves/Quantum Moves.x86"
  install -Dm555 "$srcdir/quantum_moves.run" "$pkgdir/usr/bin/quantum_moves"

}

