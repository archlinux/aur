# Maintainer: Daniel Rose <danielrose@member.fsf.org>
pkgname=swq-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Fetch and add Star Wars quotes (and GIFs!) from the CLI."
url="https://github.com/thecatster/swq-rs"
license=("GPL-3.0")
arch=("x86_64")
provides=("swq")
options=("strip")
source=("https://github.com/thecatster/swq-rs/releases/download/v$pkgver/swq-$pkgver-x86_64.tar.gz")
sha256sums=("319005b6ae6e37c62b82665fb074c0d77862f6096cb6886a3e5928374c06e0c7")

package() {
    install -Dm755 swq -t "$pkgdir/usr/bin/"
}
