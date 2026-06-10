# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=azion-cli-bin
pkgver=4.22.1
pkgrel=1
pkgdesc="Efficient creation and management of applications on Azion Edge Platform"
arch=(x86_64 aarch64 i686 armv7h)
url="https://github.com/aziontech/azion"
license=(MIT)
depends=(glibc)
source_x86_64=("$pkgname-$pkgver-x86_64.zip::$url/releases/download/$pkgver/azion_${pkgver}_linux_amd64.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::$url/releases/download/$pkgver/azion_${pkgver}_linux_arm64.zip")
source_i686=("$pkgname-$pkgver-i686.zip::$url/releases/download/$pkgver/azion_${pkgver}_linux_386.zip")
source_armv7h=("$pkgname-$pkgver-armv7h.zip::$url/releases/download/$pkgver/azion_${pkgver}_linux_armv7.zip")
sha256sums_x86_64=('4d2ea06f74b76b735dd438f6fdcd6043a4b2e94a7c008c82828a13ca5e498da2')
sha256sums_aarch64=('555db6d4cc07e3b2d8620ff7d75bcddf804c533d45072ba26447edac0030a173')
sha256sums_i686=('78439dbfee469dacbb71d3e8b1c3f184b965e488e69ae527192d7541ada72848')
sha256sums_armv7h=('fb6d56175f0d47f923b13679177fb5fe9163667b581978fdb9d7d1ce53b73383')

package() {
    install -Dm755 azion -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
