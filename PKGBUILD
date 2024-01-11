# Maintainer: Jakob (XDjackieXD) <aur at chaosfield dot at>
pkgname=mkinitcpio-mlx5
pkgver=1.0.0
pkgrel=1
pkgdesc="Archlinux mkinitcpio hook to pack mlx5_core kernel module"
arch=('any')
license=('MIT')
optdepends=('mkinitcpio-netconf: Network interface configuration')
source=('hook' 'install')
sha512sums=('bcfa32d087c3de3c4c7e6396f2e96b30ac2d56e3cc50bd0dda4c170cefb6d4982005dcd193bf368f22bd0bc70d41fc06009cb7570d3e2d4371f9fd967f503e8b'
            '19333b4807ae11e9e4da12ba2d435653cb0bb9bac1d19da9c81f03495753759822a633d618360822ce62f2e36ff4077cb7346104ea138101bedb0c99b5eeb83d')

package() {
  install -Dm644 "$srcdir/hook"		"$pkgdir/usr/lib/initcpio/hooks/mlx5"
  install -Dm644 "$srcdir/install"	"$pkgdir/usr/lib/initcpio/install/mlx5"
}
