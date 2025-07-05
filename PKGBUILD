# Maintainer: Nicola Pagliuca <nicola.pagliuca at pm dot me>
# Co-Maintainer: Aethar <elliott.ashby88@gmail.com>
_basename='hyprfreeze'
pkgname="$_basename-git"
pkgver=1.1.2.r2.6b67416
pkgrel=2
pkgdesc="Utility to suspend a game process (and other programs) in Hyprland"
arch=('any')
url="https://github.com/Zerodya/hyprfreeze"
license=('GPL')
depends=('bash' 'hyprland' 'jq' 'hyprprop')
makedepends=('git')
provides=("$_basename")
conflicts=("$_basename")
source=("git+$url")
md5sums=('SKIP')

package() {
    cd "$_basename"
    install -Dm755 ./$_basename "$pkgdir/usr/bin/$_basename"
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$_basename/LICENSE"
}
