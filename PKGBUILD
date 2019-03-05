# Maintainer: Luclu7 <me at luclu7 dot fr>
pkgname=akmey-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Akmey client"
arch=('x86_64')
url="https://github.com/akmey/akmey-client"
license=('custom: Unlicense')
conflicts=('akmey')
source=("https://github.com/akmey/akmey-client/releases/download/v$pkgver-alpha/akmey-client-linux-amd64")
noextract=('akmey-client-linux-amd64')
sha512sums=('d2311d149b0d93a83ec7130261e0f732ac32151ee8df2cf8d8f46bea2686b8ba468a8cb488c5a3385b969a5adf6a6db894495cd9231d82df98bd2c7900f4cdf1')

warn_build_references() {
    : # I like __FILE__ and don't consider build references to be a problem
}

package() {
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 akmey-client-linux-amd64 "$pkgdir/usr/bin/akmey"
}
