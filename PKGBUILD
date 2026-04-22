pkgname=pocketbase-bin
pkgver=0.37.3
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
sha256sums_x86_64=('bc70168541313e265de89ef1e8d18b538466fe1191b6ed816f9d84a77e665add')
sha256sums_aarch64=('4e2d897d63e1d4a0eb3a4aa8854142a634139f382f3b563a4f7ab0916e9d3dd5')
sha256sums_armv7h=('c2ebc71478eb605a0761f330cea61d50fb719575fbb8c48c366c89177c3fd520')
package() {
  install -Dm755 "$srcdir/pocketbase" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/LICENSE.md" -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 "$srcdir/CHANGELOG.md" -t "$pkgdir/usr/share/doc/$_pkgname"
}
