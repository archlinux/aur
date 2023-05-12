
#Maintainer : Jonathan Dönszelmann <jonabent@gmail.com>
pkgname="pointless"
pkgver=1.7.1
pkgrel=1
pkgdesc="An endless drawing canvas desktop app made with Tauri (Rust) and React"
arch=(x86_64)
url="https://github.com/kkoomen/pointless"
license=('GPL')
depends=('nodejs')
makedepends=()
source=("https://github.com/kkoomen/pointless/releases/download/v${pkgver}/pointless_${pkgver}_amd64.deb")
sha512sums=('740390eceff5267e47f570d9b5a9baafcaf617a6a010ffad0b6613b73a9740c6e2c332530a9897af7aba1310000d0589d5146d1d34c9afc7969c8028ce56cda4')

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"

  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/"
}
