# Maintainer: mini-rose <fenze@contact.dev>
pkgname=rose-browser
pkgver=1.0.beta
pkgrel=1
pkgdesc='Minimalist browser based on webkit2 and GTK4.'
arch=('x86_64')
url='https://github.com/mini-rose/rose'
license=('CUSTOM')
makedepends=('gcc' 'make')
depends=('webkit2gtk-5.0' 'gtk4')
options=('!strip')
source=("https://github.com/mini-rose/rose/archive/refs/tags/beta.tar.gz")
md5sums=('SKIP')

package() {
  cd "$srcdir/rose-beta"
  make
  install -Dm755 rose "${pkgdir}/usr/bin/rose"
}
