# Maintainer: Sebastian Kunze <mail at sebastiankunze dot de>

pkgname=tfswitch-bin
_pkgname=tfswitch
pkgver=0.10.1010
pkgrel=1
pkgdesc='A command line tool to switch between different versions of terraform. Pre-compiled.'
arch=('x86_64')
url='https://github.com/warrensbox/terraform-switcher'
license=('MIT')
provides=('tfswitch')
conflicts=('tfswitch')
source_x86_64=("$url/releases/download/$pkgver/terraform-switcher_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('cad5c991d0cef09d1e5dfdf0e25e51fb30a2817d8c89dbf4b318bd36e73c7ac1')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname}/LICENSE"
}
