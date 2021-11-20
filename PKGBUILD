# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=hck-bin
pkgver=0.6.7
pkgrel=1
pkgdesc='A sharp cut(1) clone'
arch=('x86_64')
url="https://github.com/sstadick/${pkgname%-bin}"
license=('Unlicense' 'MIT')
depends=('gcc-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$pkgname-$pkgver-LICENSE-MIT::${url/github/raw.githubusercontent}/v$pkgver/LICENSE-MIT")
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/${pkgname%-bin}-linux-amd64")

b2sums=('57222a9fc85c83c7c2b05e76fe7db55003ee78727fd0361e4b5fbfc81fdb53eed69bd3b0259dcfa055f2bb57628aaf9246fa5cf2a4fc29b6cc1b524c225ceefa')
b2sums_x86_64=('a93b18e6ad53f00f93c2f994524fcda18552429f6a16fc301cbbba83debf0acb07f68fa641a0d1f0344003808a8ddb5f00eaa442c2a24ee6e0e81bfd82c68ee5')

package() {
	install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/${pkgname%-bin}"
	install -Dm644 "$pkgname-$pkgver-LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
