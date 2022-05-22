# Maintainer: fenze <fenze@contact.dev>
pkgname=rose-browser
pkgver=v1.0.beta
pkgrel=1
pkgdesc='Minimalist browser based on webkit2 and GTK4.'
arch=('x86_64')
url='https://github.com/mini-rose/rose'
license=('CUSTOM')
makedepends=('tar')
depends=('webkit2gtk-5.0' 'gtk4')
options=('!strip')
source=("https://github.com/mini-rose/rose/releases/download/beta/rose.tar.gz")
md5sums=('SKIP')

package() {
  tar xf ./rose.tar.gz
  install -Dm755 rose "${pkgdir}/usr/bin/rose"
}
