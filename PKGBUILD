# Maintainer: Ваше имя <danyazeppeli@gmail.com>
pkgname=my-aur-helper
pkgver=1.0.0
pkgrel=1
pkgdesc="Персональный AUR-хелпер"
arch=('any')
url="https://github.com/oriten1223221/aur"
license=('GPL3')
depends=('bash' 'git' 'pacman')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('41f5bff4dbbfe62895d59cbb89f5419fce2d26d666af6c80dc9a351244fbd361')  # Замените после создания архива

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 aur "$pkgdir/usr/bin/my-aur-helper"
}
