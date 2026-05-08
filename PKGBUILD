# Maintainer: Lieke Litjens
pkgname=ember
pkgver=1.1
pkgrel=3
pkgdesc="Ember — a minimal AUR helper written in Ruby"
arch=('x86_64' 'aarch64')
url="https://github.com/xkikiyaa/ember"
license=('GPL')
depends=('ruby' 'curl' 'git')
makedepends=()
source=("https://github.com/xkikiyaa/ember/archive/refs/tags/v1.1-3.tar.gz")
sha256sums=('SKIP')

package() {

    cd "$srcdir/ember-${pkgver}-3" || exit 1


    install -Dm755 bin/emb "$pkgdir/usr/bin/emb"


    install -Dm644 lib/ember.rb "$pkgdir/usr/lib/ember/ember.rb"


    install -Dm644 README.md "$pkgdir/usr/share/doc/ember/README.md"
}
