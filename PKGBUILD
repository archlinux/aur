# Maintainer: Rachel Litjens
pkgname=ember
pkgver=2.0
pkgrel=1
pkgdesc="Ember — a minimal AUR helper written in Ruby"
arch=('x86_64' 'aarch64')
url="https://github.com/syuvi211/ember"
license=('GPL')
depends=('ruby' 'curl' 'git')
makedepends=()
source=("https://github.com/syuvi211/ember/archive/refs/tags/v2.0-1.tar.gz")
sha256sums=('SKIP')

package() {

    cd "$srcdir/ember-${pkgver}-1" || exit 1


    install -Dm755 "$startdir/bin/ember" "$pkgdir/usr/bin/ember"
    install -Dm755 "$startdir/bin/ember" "$pkgdir/usr/bin/emb"
    install -Dm644 README.md "$pkgdir/usr/share/doc/ember/README.md"
    install -Dm644 "$startdir/man/ember.8" "$pkgdir/usr/share/man/man8/ember.8"
    ln -s ember.8 "$pkgdir/usr/share/man/man8/emb.8"
}
