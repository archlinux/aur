# Maintainer: Lieke Litjens
pkgname=ember
pkgver=1.1
pkgrel=2
pkgdesc="Ember — a minimal AUR helper written in Ruby"
arch=('x86_64' 'aarch64')
url="https://github.com/0xraincandy/ember"
license=('GPL')
depends=('ruby' 'curl' 'git')
makedepends=()
source=("https://github.com/0xraincandy/ember/archive/refs/tags/v1.1-2.tar.gz")
sha256sums=('SKIP')

package() {

    cd "$srcdir/ember-${pkgver}-2" || exit 1


    install -Dm755 bin/emb "$pkgdir/usr/bin/emb"


    install -Dm644 lib/ember.rb "$pkgdir/usr/lib/ember/ember.rb"


    install -Dm644 README.md "$pkgdir/usr/share/doc/ember/README.md"
}
