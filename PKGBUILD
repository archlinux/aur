# Maintainer: Sebastian Kunze <mail at sebastiankunze dot de>

pkgname=tfswitch
pkgver=0.8.832
pkgrel=1
pkgdesc='A command line tool to switch between different versions of terraform'
arch=('x86_64')
url='https://warrensbox.github.io/terraform-switcher/'
license=('MIT')
source_x86_64=("https://github.com/warrensbox/terraform-switcher/releases/download/$pkgver/terraform-switcher_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('8588352b2e98a9e619278985dd986dfc837f5ac5d81310dfffc5e9d9eb7c946d')

package() {
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
