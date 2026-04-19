pkgname=pocketbase-bin
pkgver=0.37.1
pkgrel=1
pkgdesc='Open Source realtime backend in 1 file'
arch=(x86_64 aarch64 armv7h)
url='https://pocketbase.io'
license=('MIT')
provides=('pocketbase')
conflicts=('pocketbase')
depends=('glibc')
source_x86_64=("https://github.com/pocketbase/pocketbase/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_amd64.zip")
source_aarch64=("https://github.com/pocketbase/pocketbase/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_arm64.zip")
source_armv7h=("https://github.com/pocketbase/pocketbase/releases/download/v${pkgver}/pocketbase_${pkgver}_linux_armv7.zip")
sha256sums_x86_64=('a835e30a2e1ca989d5b701037d167734de36cb209a838843a08a90de496027ab')
sha256sums_aarch64=('91f728c6bf82cc957bedc18064d04b90f2e7756fecca43a7818b7d04b3a6a6d4')
sha256sums_armv7h=('ea7b2d74df5bd4516f9766e5606717e31b9fcffa7ee0f6aa877af80a8b143be5')
package() {
  install -Dm755 "$srcdir/pocketbase" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/LICENSE.md" -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 "$srcdir/CHANGELOG.md" -t "$pkgdir/usr/share/doc/$_pkgname"
}
