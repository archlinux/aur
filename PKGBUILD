# Maintainer: Luclu7 <me at luclu7 dot fr>
pkgname=akmey-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Akmey client"
arch=('x86_64')
url="https://github.com/akmey/akmey-client"
license=('custom: Unlicense')
conflicts=('akmey')
source=("https://github.com/akmey/akmey-client/releases/download/v$pkgver-alpha/akmey-client-linux-amd64")
noextract=('akmey-client-linux-amd64')
sha512sums=('9354870bfe9b5d837a955b7fdd50f9f1fd1e380f2176b163a87393e58ef765beef4a088960cab493bb3f909678be98b78171d676fc553f8ebbcf62a2d1708c0d')

warn_build_references() {
    : # I like __FILE__ and don't consider build references to be a problem
}

package() {
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 akmey-client-linux-amd64 "$pkgdir/usr/bin/akmey"
}
