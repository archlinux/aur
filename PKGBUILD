# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=tai-bin
pkgver=0.0.7
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
sha256sums_x86_64=('fd5f017905a51b0265360a41712140359721030da435283f44c958c80c23e31c')
sha256sums_i686=('0988abbf47ed30275cc53200c9a2992f2a502b95d61f0c262fd0626982713444')
sha256sums_arm=('53f370410db5c50b8c073acf12ae664acab769246d3503a14721b12290fa9597')
sha256sums_armv7h=('9e819883f5bdcd0f799792620ff5cf1ab5f7117d7a42d3bdc239c4cd7b720192')
sha256sums_aarch64=('90f75d6ea2bf52b79a1775428c56996f9fc5b6cf8da870a7d4c70b6cdeffdd3e')

package() {
	install -Dm 755 tai -t "$pkgdir/usr/bin/"
	install -Dm 444 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 444 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
