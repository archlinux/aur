# Maintainer: tee < teeaur at duck dot com >
pkgname=lute-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A standalone Luau runtime for general-purpose programming"
arch=(x86_64)
url="https://github.com/luau-lang/lute"
license=('MIT')
depends=('glibc')
provides=('lute')
conflicts=('lute')
source=("$url/releases/download/v$pkgver/lute-linux-$arch.zip"
"$url/raw/v$pkgver/LICENSE")
b2sums=('54b930d30226abffb2362125b8113e0a352fa64dab6438dc59aa7fa69dacee513d7b74bf89afda07ca6227ea2cecd4175574fca3993b55acb0e606aae060e47e'
        '127cb4fccb74c073c4feebb8b68bf95db29455500987121146c6a1397bd1ba7ec4fe199c8ceac119b169a622db5f913a9d4f7335f32e8b262a2269a9295843e5')

package() {
	install -Dm755 lute -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
