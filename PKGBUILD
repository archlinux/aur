# Maintainer: Rainu <jetbrains-project-opener@raysha.de>
pkgname=jetbrains-project-opener
pkgver=1.0.1
pkgrel=1
pkgdesc="List all your JetBrains Projects and open the selected one"
arch=('x86_64' 'i686')
url="https://github.com/rainu/jb-project-opener"
source=("git+$url.git#tag=v$pkgver")
sha256sums=("SKIP")
license=('MIT')
makedepends=('git')
depends=('jq' 'rofi' 'jetbrains-toolbox')

package() {
	cd "$srcdir/jb-project-opener"
  install -Dm755 jetbrains-project-opener "$pkgdir"/usr/bin/jetbrains-project-opener
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}