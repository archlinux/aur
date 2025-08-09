pkgname=pocketbase-bin
pkgver=0.29.2
pkgrel=1
pkgdesc='Open source backend for your next project in 1 file'
arch=('x86_64')
url='https://pocketbase.io'
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("https://github.com/pocketbase/pocketbase/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('c6f803eba12fcc04df662522bf5881fd835d63b746a8d3835fb20574f6df5f60')
package() {
  install -Dm755 "$srcdir/pocketbase" "$pkgdir/usr/bin/pocketbase"
  install -Dm644 "$srcdir/LICENSE.md" -t "usr/share/licenses/$_pkgname"
}
