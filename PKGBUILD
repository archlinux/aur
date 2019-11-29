# Maintainer: Sebastian Morr <sebastian@morr.cc>

pkgname=scopes-bin
pkgver=0.15
pkgrel=1
pkgdesc="A retargetable programming language & infrastructure"
arch=('x86_64')
url="http://scopes.rocks"
license=('MIT')
depends=('ncurses')
makedepends=()
source=(https://bitbucket.org/duangle/scopes/downloads/scopes-$pkgver-glibc_2.27-linux-x86_64.tar.xz)
sha256sums=('12bd24666072ae603b6e253cb07d134bc6d0b6ce5bf1073db2484fae3b1e92ef')

package() {
    cd scopes-$pkgver-glibc_2.27-linux-x86_64
    install -Dm755 bin/scopes $pkgdir/usr/bin/scopes
    install -Dm755 bin/libscopesrt.so $pkgdir/usr/lib/libscopesrt.so
    install -Dm644 lib/scopes/core.sc $pkgdir/usr/lib/scopes/core.sc
    install -Dm644 lib/scopes/testing.sc $pkgdir/usr/lib/scopes/testing.sc
    install -Dm644 lib/scopes/FunctionChain.sc $pkgdir/usr/lib/scopes/FunctionChain.sc
    install -Dm644 lib/scopes/Array.sc $pkgdir/usr/lib/scopes/Array.sc
    install -Dm644 lib/scopes/glsl.sc $pkgdir/usr/lib/scopes/glsl.sc
    install -Dm644 lib/scopes/glm.sc $pkgdir/usr/lib/scopes/glm.sc
    install -Dm644 lib/scopes/Capture.sc $pkgdir/usr/lib/scopes/Capture.sc
    install -Dm644 lib/scopes/itertools.sc $pkgdir/usr/lib/scopes/itertools.sc
    install -Dm644 lib/scopes/Map.sc $pkgdir/usr/lib/scopes/Map.sc
    install -Dm644 lib/scopes/old_core.sc $pkgdir/usr/lib/scopes/old_core.sc
    install -Dm644 lib/scopes/spicetools.sc $pkgdir/usr/lib/scopes/spicetools.sc
    ln -s /usr/lib/libtinfo.so.6 $pkgdir/usr/lib/libtinfo.so.5
}
