# Maintainer: Daniel Rose <danielrose@member.fsf.org>
pkgname=swq-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Fetch and add Star Wars quotes (and GIFs!) from the CLI."
url="https://github.com/thecatster/swq-rs"
license=("GPL-3.0")
arch=("x86_64")
provides=("swq")
options=("strip")
source=("https://github.com/thecatster/swq-rs/releases/download/v$pkgver/swq-$pkgver-x86_64.tar.gz")
sha256sums=("82671521b2824e6d706ef9818a08fdc7f130dab0ed470cb0bed799617c288c7b")

package() {
    install -Dm755 swq -t "$pkgdir/usr/bin/"
}
