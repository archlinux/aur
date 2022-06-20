# Maintainer: Sebastian Kunze <mail at sebastiankunze dot de>

pkgname=tfswitch-bin
_pkgname=tfswitch
pkgver=0.13.1275
pkgrel=1
pkgdesc='A command line tool to switch between different versions of terraform. Pre-compiled.'
arch=('x86_64')
url='https://github.com/warrensbox/terraform-switcher'
license=('MIT')
provides=('tfswitch')
conflicts=('tfswitch')
source=("$url/releases/download/$pkgver/terraform-switcher_${pkgver}_linux_amd64.tar.gz")
sha256sums=('e82fc17396dad6f5f11aab709f21099e05577427310d9cc0b0bec16dfdcaf154')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
