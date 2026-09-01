# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=azion-cli-bin
pkgver=4.23.0
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
sha256sums_x86_64=('563fa8a432c2c49d627855cd9709671bfc1087195f6b11664607a9db13dcb28f')
sha256sums_aarch64=('33afe699f9329a47a97860cda63503a677c1de6b3f2700fd10c0da4735fa3b90')
sha256sums_i686=('93ad9854eff79d7fd4ef11772de775358ffe12553aa4a61c8193dbadf195cf05')
sha256sums_armv7h=('9bf521258ff894ae4245478b5611c782534e8b4479dd508945ebb53c1967a7d5')

package() {
    install -Dm755 azion -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
