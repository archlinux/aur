# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=gkrellm2-show_ip
pkgver=1.1
pkgrel=6
pkgdesc="Shows the actual IP address of a given network interface"
arch=('i686' 'x86_64')
url="http://members.dslextreme.com/users/billw/gkrellm/Plugins.html"
license=('GPL')
depends=('gkrellm')
source=("http://members.dslextreme.com/users/billw/gkrellm/Plugins/GKrellM2-show_ip-${pkgver}.tar.gz")
md5sums=('65639a9588231a1b0df34405441b7861')

build() {
  cd "$srcdir/GKrellM2-show_ip-${pkgver}"
  make
}

package() {
  cd "$srcdir/GKrellM2-show_ip-${pkgver}"
  install -Dm644 GKrellM2-show_ip.so "$pkgdir/usr/lib/gkrellm2/plugins/GKrellM2-show_ip.so"
}



