# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=mdt
pkgver=1.3.0
pkgrel=1
pkgdesc='Commandline markdown todo list manager'
arch=('any')
url="https://github.com/basilioss/mdt"
license=('GPL3')
depends=('gum' 'findutils' 'gawk' 'grep' 'sed')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ecab59171051673e89fb1eb8964d00a6bcfc337200a913446552a0822ceb3f17')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
