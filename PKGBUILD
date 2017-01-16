# Maintainer: Anatoly Rugalev <anatoly.rugalev g-mail>

pkgname=imagy-xfce4
pkgver=0.2
pkgrel=1
url="http://imagy.me"
pkgdesc="Imagy.me screenshooter for xfce4"
arch=('x86' 'x86_64')
depends=('xfce4-screenshooter' 'xclip')
source=('imagy-xfce4' 'LICENSE')
md5sums=('SKIP' 'SKIP')
license=('MIT')
package() {
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/licenses/imagy-xfce4
  install -m755 imagy-xfce4 "$pkgdir"/usr/bin/imagy-xfce4
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/imagy-xfce4/LICENSE
}
