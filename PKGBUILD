# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=jp-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Command line interface to JMESPath'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://jmespath.org"
license=('APACHE')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/jmespath/jp/releases/download/$pkgver/jp-linux-amd64")
source_i686=("$pkgname-$pkgver-i686::https://github.com/jmespath/jp/releases/download/$pkgver/jp-linux-386")
source_armv7h=("$pkgname-$pkgver-armv7h::https://github.com/jmespath/jp/releases/download/$pkgver/jp-linux-arm-arm7")
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/jmespath/jp/releases/download/$pkgver/jp-linux-arm64")
b2sums_x86_64=('16b61c153556d5792f9a52f0dfca2ac6832ddddbc3ad28bc5455f352f1aee8104a378550d278e01f1a9233b2585d5e4830bbab17dd0c9a08bdc28eed32cee925')
b2sums_i686=('6e6de4c0fb5768dd650172d5259f4f14ac4cd4f850ebf2f575f5829ca831aeae318875407d31fc4b7f966cea4f3f6d04ad8694e0c7702619b98482b3b1dda58b')
b2sums_armv7h=('3f16479be2575fb4bfe2aa424d2877b59471f68264fe9e132e5ef8ff028d675e0cee4341416534169508e0e876b352e825abe8dad7922dfee1d63c11e134936d')
b2sums_aarch64=('b802452e41d418b73d8948b55b9243be6b46925b58c93dff1374bd75969a5c6fa703ee7dfa47a33993c7010e3273e8408186a9146e348dc349b31d0f9a2fe48d')

package() {
	install -Dm755 "$pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/${pkgname%-bin}"
}
