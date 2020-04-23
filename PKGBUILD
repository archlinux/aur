# Maintainer: Luclu7 <me at luclu7 dot fr>
pkgname=akmey-bin
pkgver=0.5
pkgrel=1
pkgdesc="Akmey client"
arch=('x86_64')
url="https://github.com/akmey/akmey-client"
license=('custom: Unlicense')
conflicts=('akmey')
source=("https://github.com/akmey/akmey-client/releases/download/v$pkgver-alpha/akmey-client-linux-amd64")
noextract=('akmey-client-linux-amd64')
sha512sums=('d28c8f3adf5c00702607d5a00b28fa0cb0cdaffa761a63227139a693b991d6863d4c2a1683bc903693e41787f99dbe1bed9f676ca7e5effafa94dc44223e530f')

warn_build_references() {
    : # I like __FILE__ and don't consider build references to be a problem
}

package() {
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 akmey-client-linux-amd64 "$pkgdir/usr/bin/akmey"
}
