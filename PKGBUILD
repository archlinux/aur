# Maintainer: Sebastian Kunze <mail at sebastiankunze dot de>

pkgname=tfswitch-bin
_pkgname=tfswitch
pkgver=0.13.1221
pkgrel=1
pkgdesc='A command line tool to switch between different versions of terraform. Pre-compiled.'
arch=('x86_64')
url='https://github.com/warrensbox/terraform-switcher'
license=('MIT')
provides=('tfswitch')
conflicts=('tfswitch')
source=("$url/releases/download/$pkgver/terraform-switcher_${pkgver}_linux_amd64.tar.gz")
sha256sums=('a423ee13d5f7dc839f85a13d8db3107b59efca40d7e1dad7c5749201646187e4')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
