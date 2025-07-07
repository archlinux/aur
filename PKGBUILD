# Maintainer: Your Name <dima.burak1811@gmail.com>
pkgname=fortunafetch
pkgver=1.0.5
pkgrel=1
pkgdesc="THE BEST FETCH IN THE WORLD OF ALL EXISTING. 100% FASTER THAN FASTFETCH AND NEOFETCH. PROVEN BY SCIENTISTS.( The following project is a meme and was made for fun dont take it seriously )"
arch=('any')
url="https://github.com/alexskid/fortunafetch"
license=('GPL3')
depends=('python' 'xorg-xrandr' 'lsb-release' 'pciutils' 'procps-ng' 'inetutils' 'acpi' 'upower')
source=("$pkgname.py")
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
}
