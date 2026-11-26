# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=azion-cli-bin
pkgver=4.27.0
pkgrel=1
pkgdesc="Efficient creation and management of applications on Azion Edge Platform"
arch=(x86_64 aarch64 i686 armv7h)
url="https://github.com/aziontech/azion"
license=(MIT)
depends=(glibc)
provides=(azion-cli)
conflicts=(azion-cli)
source_x86_64=("$pkgname-$pkgver-x86_64.zip::$url/releases/download/$pkgver/azion_${pkgver}_linux_amd64.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::$url/releases/download/$pkgver/azion_${pkgver}_linux_arm64.zip")
source_i686=("$pkgname-$pkgver-i686.zip::$url/releases/download/$pkgver/azion_${pkgver}_linux_386.zip")
source_armv7h=("$pkgname-$pkgver-armv7h.zip::$url/releases/download/$pkgver/azion_${pkgver}_linux_armv7.zip")
sha256sums_x86_64=('5954d94d90c2dd4478a58c2ac8254496085e7c7d99297d854b7a48adeec37fc7')
sha256sums_aarch64=('7a97f871a63fbf8cf9467fee0ba8b32430b014643eb37ed9e479993846a8759e')
sha256sums_i686=('3453b5d28bc5ad90a05df4e31f9eba956e73eaf0462e5d92e1eedfecfedc65ae')
sha256sums_armv7h=('e3ff93240dcf1a8f8ff858c8dc9afa35722df0bd8d04404df29f452645517bcd')

package() {
    install -Dm755 azion -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
