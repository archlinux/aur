# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=grimshot
pkgver=1.4
pkgrel=1
pkgdesc="A helper for screenshots within sway."
arch=("x86_64")
url="https://github.com/swaywm/sway"
license=('MIT')
depends=("sway" "grim" "slurp" "jq" "xdg-user-dirs")
optdepends=('notify-send: Notify users when a screenshot is taken'
            'mktemp: Copy screenshots'
            'wl-clipboard: Copy screenshots')
makedepends=("scdoc")
source=("https://github.com/swaywm/sway/archive/${pkgver}.tar.gz")
md5sums=('cef910816c64cecd75cd8b5bd0a0ccb2')

package() {
  cd "$srcdir/sway-$pkgver/contrib"

  install -Dm 755 grimshot "$pkgdir/usr/bin/grimshot"
}
