# Maintainer: Hendrik 'T4cC0re' Meyer <aur@t4cc0.re>
pkgname=mkinitcpio-mlx4
pkgver=1.0.0
pkgrel=1
pkgdesc="Archlinux mkinitcpio hook to pack mlx4_core and mlx4_en kernel modules"
arch=('any')
url="https://github.com/t4cc0re/mkinitcpio-mlx4"
license=('MIT')
optdepends=('mkinitcpio-netconf: Network interface configuration')
source=('hook' 'install')
sha512sums=('bcfa32d087c3de3c4c7e6396f2e96b30ac2d56e3cc50bd0dda4c170cefb6d4982005dcd193bf368f22bd0bc70d41fc06009cb7570d3e2d4371f9fd967f503e8b' '77161e19f5f150dd5a3f67b74a88b0eab3fe624924cdbc7894165c1108a593d584ca0512ed15eb513e00085b3d01ac763b3e25a23064133e3a972b2bdce5f9fb')

package() {
  install -Dm644 "$srcdir/hook"		"$pkgdir/usr/lib/initcpio/hooks/mlx4"
  install -Dm644 "$srcdir/install"	"$pkgdir/usr/lib/initcpio/install/mlx4"
}
