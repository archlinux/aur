# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=jp-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Command line interface to JMESPath"
arch=(x86_64 i686 armv7h)
url="https://jmespath.org"
license=('APACHE')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/jmespath/jp/releases/download/$pkgver/jp-linux-amd64")
source_i686=("$pkgname-$pkgver-i686::https://github.com/jmespath/jp/releases/download/$pkgver/jp-linux-386")
source_armv7h=("$pkgname-$pkgver-armv7h::https://github.com/jmespath/jp/releases/download/$pkgver/jp-linux-arm-arm7")
b2sums_x86_64=('4015d992e26d8152d52179b34ea7722f4cf579c1f31ccfca4ebf05b2cf036609648d75bdad84ae2167cdd18d081a57eef9b26df6f1259c121fbf939277d7b73c')
b2sums_i686=('f8f0f6467cff41e56e8f45a2abefb58193a3afd6416a6c23b87202c2742d545cf3384fa7d08596924bfe95f56af406575192ac726af83721d8be382e7c6b6ad4')
b2sums_armv7h=('23162b263317dfefe4391154bd4ea77d87f8588160ded3f68b7174ccb8474ad4f02bdf0864e992cd659bf3ee6fc3dd0872c9ccd382542b99cb9bebdb65e47844')

package() {
	install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/${pkgname%-bin}"
}
