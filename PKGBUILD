# Maintainer: Simona <simona.pisano[at]gmail[dot]com>
pkgname=simona-scripts
pkgver=0.0.1
pkgrel=1
pkgdesc="Bash commands."
#url="https://github.com/simona70/grub-custom-simona"
arch=('any')
license=('GPL2')
depends=('bash')
source=($pkgname-$pkgver.tar.gz)
#generate with 'makepkg -g'
md5sums=('0e55f720e27ebb2791248a93f48ed8b6')

package() {
  install -Dm 755 "$srcdir/*.sh" "$pkgdir/bin"
}

