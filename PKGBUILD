# Maintainer: Sebastian Kunze <mail at sebastiankunze dot de>

pkgname=tfswitch-bin
_pkgname=tfswitch
pkgver=0.11.1071
pkgrel=1
pkgdesc='A command line tool to switch between different versions of terraform. Pre-compiled.'
arch=('x86_64')
url='https://github.com/warrensbox/terraform-switcher'
license=('MIT')
provides=('tfswitch')
conflicts=('tfswitch')
source=("$url/releases/download/$pkgver/terraform-switcher_${pkgver}_linux_amd64.tar.gz")
sha256sums=('d5a568ca466bd2432c659e9fd005b20fbaba09b4ae800c08f28ae12646ded954')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname}/LICENSE"
}
