pkgname=sttr
pkgver=0.2.10
pkgrel=1
pkgdesc='cli app to perform various operations on string'
arch=('x86_64')
url="https://github.com/abhimanyu003/sttr"
makedepends=()
source=("$url/releases/download/v$pkgver/sttr_${pkgver}_linux_amd64.tar.gz")
sha256sums=('ea4850cee379330e7e5bfa66278dc70c95958b7b29b85337f812d8e3f057ec93')

package() {
  install -Dm755 ./sttr "${pkgdir}/usr/bin/sttr"
}
