# Maintainer: Luclu7 <me at luclu7 dot fr>
pkgname=akmey-bin
pkgver=0.6
pkgrel=1
pkgdesc="Akmey client"
arch=('x86_64')
url="https://github.com/akmey/akmey-client"
license=('custom: Unlicense')
conflicts=('akmey')
source=("https://github.com/akmey/akmey-client/releases/download/v$pkgver-alpha/akmey-client-linux-amd64")
noextract=('akmey-client-linux-amd64')
sha512sums=('4ee232d701a3156d1735134fd0f35ffbeff70e0f276c06198a246dfb36877366f11b719992c384a3b842a2c3e9aced16b2e92f4917116eb154b123107fbbcb6b')

warn_build_references() {
    : # I like __FILE__ and don't consider build references to be a problem
}

package() {
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 akmey-client-linux-amd64 "$pkgdir/usr/bin/akmey"
}
