pkgname=pocketbase-bin
pkgver=0.36.5
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
sha256sums_x86_64=('0b9efd78707cb8039e6229865b6eead4d05a9308421259211255746203dd4e7a')
sha256sums_aarch64=('4aa3bd7f88ef01259146bc23a588dd5df22390456ea104551aeebd9c3f036ffa')
sha256sums_armv7h=('20ae1c44c104a11a817653dd8d7fee171eb8c57ec68c14d9ccb5640975186780')
package() {
  install -Dm755 "$srcdir/pocketbase" "$pkgdir/usr/bin/pocketbase"
  install -Dm644 "$srcdir/LICENSE.md" -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 "$srcdir/CHANGELOG.md" -t "$pkgdir/usr/share/doc/$_pkgname"
}
