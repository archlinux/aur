# Maintainer: Rachel Litjens
pkgname=ember
pkgver=1.2
pkgrel=0
pkgdesc="Ember — a minimal AUR helper written in Ruby"
arch=('x86_64' 'aarch64')
url="https://github.com/syuvi211/ember"
license=('GPL')
depends=('ruby' 'curl' 'git')
makedepends=()
source=("https://github.com/syuvi211/ember/archive/refs/tags/v2.0-0.tar.gz")
sha256sums=('SKIP')

package() {

    cd "$srcdir/ember-${pkgver}-0" || exit 1


    install -Dm755 bin/ember "$pkgdir/usr/bin/ember"
    install -Dm755 bin/ember "$pkgdir/usr/bin/emb"
    install -Dm644 README.md "$pkgdir/usr/share/doc/ember/README.md"
}
