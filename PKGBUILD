pkgname=pocketbase-bin
pkgver=0.29.3
pkgrel=1
pkgdesc='Open source backend for your next project in 1 file'
arch=('x86_64')
url='https://pocketbase.io'
license=('MIT')
conflicts=('pocketbase-git')
depends=('glibc')
source=("https://github.com/pocketbase/pocketbase/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
sha256sums=('c0c4ef56b74a17c469b74c00c40d90ec20b6fd33cd45bf1f9993fbf86f03c695')
package() {
  install -Dm755 "$srcdir/pocketbase" "$pkgdir/usr/bin/pocketbase"
  install -Dm644 "$srcdir/LICENSE.md" -t "usr/share/licenses/$_pkgname"
}
