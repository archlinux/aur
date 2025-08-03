pkgname=pocketbase-bin
pkgver=0.29.1
pkgrel=1
pkgdesc='Open source backend for your next project in 1 file'
arch=('x86_64')
url='https://pocketbase.io'
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("https://github.com/pocketbase/pocketbase/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('8ba9edc571485b3deac7bbd33ec5de84967d3806964ba2daba17e1a1de42105b')
package() {
  install -Dm755 "$srcdir/pocketbase" "$pkgdir/usr/bin/pocketbase"
  install -Dm644 "$srcdir/LICENSE.md" -t "usr/share/licenses/$_pkgname"
}
