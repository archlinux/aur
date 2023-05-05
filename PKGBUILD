
#Maintainer : Jonathan Dönszelmann <jonabent@gmail.com>
pkgname="pointless"
kgver=1.6.0
pkgrel=1
pkgdesc="An endless drawing canvas desktop app made with Tauri (Rust) and React"
arch=(x86_64)
url="https://github.com/kkoomen/pointless"
license=('GPL')
depends=('nodejs')
makedepends=()
source=("https://github.com/kkoomen/pointless/releases/download/v1.6.0/pointless_1.6.0_amd64.deb")
sha512sums=('15ec8443a282c5b62aa34cd13b5ebfd61e29bee11df8d78a581e12a8b8e4ece447b39f43e0bf0e83235faad204fdc4cbb051c3e4c7f150e2bc96b21955533831')

package() {
  bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"

  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/"
}
