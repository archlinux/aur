# Maintainer: Álvaro Jesús Baena Rosino <alvarojsino8@gmail.com>
pkgname='mecano'
pkgver='0.2.2'
pkgrel='1'
pkgdesc='Minimalist typing train'
arch=('x86_64')
makedepends=('cargo')
source=(
   "https://github.com/alvarojsino813/mecano/archive/refs/tags/v$pkgver.tar.gz"
   )
license=('unlicense')

build() {
   cd "$srcdir/$pkgname-$pkgver/"
   cargo build --release --target-dir=target
   cd ../..
}

package() { 
   install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/mecano" "$pkgdir/usr/bin/$pkgname"
}
sha256sums=('1ac28406fe45782baf46c5710250022c9ab3b319f4887a6eef1ba375eaf209ff')
sha256sums=('e066b77e03c2ebf3a2e0adddbf7e5bf7f982a74c5d83476aa59726517bdd3863')
