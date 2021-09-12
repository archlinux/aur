# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tai-bin
pkgver=0.0.8
pkgrel=1
pkgdesc="terminal ascii image -- convert images to ascii art"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://github.com/MustafaSalih1993/tai"
license=('MIT')
depends=('gcc-libs')
provides=('tai')
conflicts=('tai')
source=(
	"LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE"
	"README-$pkgver.md::$url/raw/v$pkgver/README.md"
)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/tai-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/tai-i686-unknown-linux-gnu.tar.gz")
source_arm=("$pkgname-$pkgver-arm.tar.gz::$url/releases/download/v$pkgver/tai-arm-unknown-linux-gnueabi.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/tai-armv7-unknown-linux-gnueabihf.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/tai-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('f56fbec69679d49e7be4268b9373b89ede5df40520b8e7dd1d929d554bdc6614'
            'da1779cbb30ce1380933b545c6a7cedcce64ddf6bd358017e754a3718cbb5305')
sha256sums_x86_64=('df0779cdd5bf718960088eeb501d7e13cab7b4354699dc1fe8d076aca54d468c')
sha256sums_i686=('96a2d48fd3c09f85d56e58fe8818491a4d915a74f487079b5e64fda1ab15fa33')
sha256sums_arm=('4f855485d487fa8eecf9ff0b6deec61b57fd538cea66b34082064bcd7b0ec631')
sha256sums_armv7h=('876201eacc1085b3711c9598d8453a5cec2cacec8e2eff077e7f8e359c85fc1c')
sha256sums_aarch64=('4ce691be4a16e8ccc16625c5a6ae9494564257bc7661a4aa8f1c3f8c9c0a09d0')

package() {
	install -Dm 755 tai -t "$pkgdir/usr/bin/"
	install -Dm 444 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 444 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
