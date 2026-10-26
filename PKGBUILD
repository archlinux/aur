# Maintainer: Rachel Litjens
pkgname=ember
pkgver=2.6
pkgrel=1
pkgdesc="Ember — a minimal AUR helper written in Ruby"
arch=('x86_64' 'aarch64')
url="https://github.com/syuvi211/ember"
license=('GPL-3.0-or-later')
depends=('ruby' 'git')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 "bin/ember" "$pkgdir/usr/bin/ember"
    install -Dm755 "bin/ember" "$pkgdir/usr/bin/emb"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "man/ember.8" "$pkgdir/usr/share/man/man8/ember.8"
    ln -s ember.8 "$pkgdir/usr/share/man/man8/emb.8"
}
