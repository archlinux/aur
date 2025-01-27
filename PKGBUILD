# Maintainer: Sebastian Kunze <mail at sebastiankunze dot de>

pkgname=tfswitch-bin
_pkgname=tfswitch
pkgver=1.3.0
pkgrel=1
pkgdesc='A command line tool to switch between different versions of terraform. Pre-compiled.'
arch=('x86_64')
url='https://github.com/warrensbox/terraform-switcher'
license=('MIT')
provides=('tfswitch')
conflicts=('tfswitch')
source=("$url/releases/download/v$pkgver/terraform-switcher_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('2261a01b5fee50db21d6d2804d3b7e4c05168f7ee7646f760fb2092f4d9a7694')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
