# Maintainer: Hafeoz <hafeoz@kolabnow.com>

pkgname=danmakufactory
_pkgname=DanmakuFactory
pkgver=1.63
pkgrel=1
pkgdesc='A tool for converting XML danmaku to ass subtitles.'
url="https://github.com/hihkm/DanmakuFactory"
arch=(x86_64)
license=(MIT)
makedepends=()
options=()
source=(
  "$_pkgname-$pkgver.tar.gz::https://github.com/hihkm/$_pkgname/archive/v$pkgver.tar.gz"
)
sha512sums=('e94fc800cdf4e68ddb28001075a3dd7eb91fd7a9a528fdc0e454aab94fae717a1d53929065e7e34df89b5e53285405cb8826be874b06b93d7c3d65f815f21505')

build() {
  cd $_pkgname-$pkgver
  make
}

package() {
  cd $_pkgname-$pkgver
  install -Dm755 DanmakuFactory $pkgdir/usr/bin/DanmakuFactory
}
