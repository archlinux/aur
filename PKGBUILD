# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=azion-cli-bin
pkgver=4.26.1
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
sha256sums_x86_64=('e7e12db9fa26d8e0a8e059704cfdcbb33ea85ebfd9e76f87bfdff918f013f9b6')
sha256sums_aarch64=('2d8b9236e98d55dca9ab6ba9244f108003b1f7f5fc6d32b6e444b25ffebb28b3')
sha256sums_i686=('5e750d13127259587c095758aa45a439bf2a2d1143c6dc704524a9e14bce0405')
sha256sums_armv7h=('75e2bf1a6f1758e88f11551fd5ad683f3e4facacf8882abd2c5bb02d990f0b6b')

package() {
    install -Dm755 azion -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
