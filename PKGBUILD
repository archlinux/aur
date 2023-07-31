# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: corvolino <corvolino@archlinux.com.br>

pkgname=gkrellm2-show_ip
pkgver=1.1
pkgrel=7
pkgdesc="Shows the actual IP address of a given network interface"
arch=('i686' 'x86_64')
url="https://web.archive.org/web/20150802135843/http://members.dslextreme.com/users/billw/gkrellm/Plugins.html"
license=('GPL')
depends=('gkrellm')
source=("https://web.archive.org/web/20150802135842/http://members.dslextreme.com/users/billw/gkrellm/Plugins/GKrellM2-show_ip-${pkgver}.tar.gz")
md5sums=('65639a9588231a1b0df34405441b7861')

build() {
  cd "$srcdir/GKrellM2-show_ip-${pkgver}"
  make
}

package() {
  cd "$srcdir/GKrellM2-show_ip-${pkgver}"
  install -Dm644 GKrellM2-show_ip.so "$pkgdir/usr/lib/gkrellm2/plugins/GKrellM2-show_ip.so"
}



