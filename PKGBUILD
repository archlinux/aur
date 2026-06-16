# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=azion-cli-bin
pkgver=4.22.2
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
sha256sums_x86_64=('d627167fa0041c77b26a24deb18fdeb7d36100e5112c9784ffe4dfb9214faf9d')
sha256sums_aarch64=('85e303a4df29ff2e99f8cd81200a68a4c99beeb97cdb781061e521e8834f7be8')
sha256sums_i686=('8a067e1fc136fc0ef7f42e7fde9ef866c82ea906b9f39ad4af99091d0e02d17d')
sha256sums_armv7h=('99a32c873909d967f074fa86fa41774765e4d0a1bddd93ccc2f112862815b711')

package() {
    install -Dm755 azion -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
