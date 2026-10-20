# Maintainer: Kevin McConnell <kevin.mcconnell@gmail.com>

pkgname=opto-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="See how busy your machine has been, and why"
arch=('x86_64')
url="https://github.com/kevinmcconnell/opto"
license=('MIT')
depends=('cairo' 'glib2' 'glibc' 'gtk4' 'libadwaita' 'libgcc' 'pango' 'sqlite')
optdepends=('openssh: read other machines over ssh')
provides=('opto')
conflicts=('opto')
options=('!debug' '!strip')
install=opto.install
source=("$url/releases/download/v$pkgver/opto-$pkgver-x86_64.tar.gz")
sha256sums=('00ff4194b23e4f3bdc0d9cc3021d1d5f8272748f85846aced70053e182ff2bee')

package() {
  cp -a "opto-$pkgver-x86_64/usr" "$pkgdir/"
}
