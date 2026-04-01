pkgname=repoporge
pkgver=0.0.9
pkgrel=1
pkgdesc="Aur package of repoporge"
arch=('any')
url="https://aur.archlinux.org/account/Vniverse77/"
license=('1')
depends=(gcc)
source=("https://github.com/Neuwj-00/repoForge/archive/refs/tags/v0.0.9.tar.gz")
sha256sums=('7e39ac8fd6ec0ed1ffa1231bdbd39447898de60ff2fedc2a60d245542c1196d7')

package() {
  install -Dm644 "$srcdir" "$pkgdir/usr/share/doc/$pkgname/README"
}
