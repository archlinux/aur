# Maintainer: Rachel Litjens
pkgname=ember
pkgver=2.0
pkgrel=2
pkgdesc="Ember — a minimal AUR helper written in Ruby"
arch=('x86_64' 'aarch64')
url="https://github.com/syuvi211/ember"
license=('GPL')
depends=('ruby' 'curl' 'git')
makedepends=()
source=("https://github.com/syuvi211/ember/archive/refs/tags/v2.0-2.tar.gz") #just work ffs
sha256sums=('SKIP')

package() {

    cd "$srcdir/ember-${pkgver}-2" || exit 1


    install -Dm755 bin/ember "$pkgdir/usr/bin/ember"
    install -Dm755 bin/ember "$pkgdir/usr/bin/emb"
    install -Dm644 README.md "$pkgdir/usr/share/doc/ember/README.md"
    install -Dm644 man/ember.8 "$pkgdir/usr/share/man/man8/ember.8"
    ln -s ember.8 "$pkgdir/usr/share/man/man8/emb.8"
}
