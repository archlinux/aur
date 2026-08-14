pkgname=pocketbase-bin
pkgver=0.39.11
pkgrel=1
pkgdesc='Open Source realtime backend in 1 file'
arch=(x86_64 aarch64 armv7h)
url='https://pocketbase.io'
license=('MIT')
provides=('pocketbase')
conflicts=('pocketbase')
depends=('glibc')
_src='https://github.com/pocketbase/pocketbase'
source_x86_64=("$_src/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
source_aarch64=("$_src/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_arm64.zip")
source_armv7h=("$_src/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_armv7.zip")
sha256sums_x86_64=('08b9fcda0d5fd42cb315dc15a36dfa121c993855bd635f01d347c31b4328ec34')
sha256sums_aarch64=('8c785618840df7ebba795fdf4eba33a5fed64ac5307ad8023b955b4ebb82048b')
sha256sums_armv7h=('ba5cde96576716ea8ecf96a11b53a4e0c376f24d93cd48e70aaee54f620ddc5e')
package() {
  install -Dm755 pocketbase -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
