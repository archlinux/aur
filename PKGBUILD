# Maintainer: HaoCheng <ch1994@outlook.com>
_pkgname=biliup
pkgname=$_pkgname-rs-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="命令行投稿(B站)和视频下载工具，提供多种登录方式，支持多p"
provides=($_pkgname)
arch=("x86_64" "aarch64")
url=https://github.com/biliup/biliup-rs
license=(MIT)
#options=("!strip")
provides=("biliup")
conflicts=(
)
source=(
)
source_x86_64=(
	"$_pkgname-x86_64::$url/releases/download/v${pkgver}/${_pkgname}R-v${pkgver}-x86_64-linux.tar.xz"
	)
source_aarch64=(
	"$_pkgname-aarch64::$url/releases/download/v${pkgver}/${_pkgname}R-v${pkgver}-aarch64-linux.tar.xz"
	)
sha256sums_x86_64=('c0e509424caec2ad5d7c3a049f686d7201891e749e0e7be8a4127232b70bf5d7')
sha256sums_aarch64=('d21c149d2a3ef15b3bbadb16edc453a938bbfdbf9b848e11da795cc3d79629e2')

package() {
	install -Dm755 "$srcdir/${_pkgname}R-v${pkgver}-$CARCH-linux/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
