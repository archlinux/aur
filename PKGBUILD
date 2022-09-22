# Maintainer: Amirabbas Fazelinia <utilyre@proton.me>

pkgname="climan-bin"
pkgver="0.3.1"
pkgrel="1"
pkgdesc="A file based HTTP client"
arch=("x86_64")

url="https://github.com/utilyre/climan#readme"
license=("MIT")

source=("https://github.com/utilyre/climan/releases/download/v0.3.1/climan-v$pkgver-linux-amd64.tar.gz")
sha256sums=("8eb3555ca338c379c81f00513242caef0eba185038a9da2372bfba43556df0eb")

package() {
  cd "$srcdir/climan-v$pkgver-linux-amd64"

  install -Dm644 "licenses/LICENSE" "$pkgdir/usr/share/licenses/climan/LICENSE"
  install -Dm644 "doc/README.md" "$pkgdir/usr/share/doc/climan/README.md"
  install -Dm644 "doc/examples"/* -t "$pkgdir/usr/share/doc/climan/examples"
  install -Dm644 "man/man1/climan.1.gz" "$pkgdir/usr/share/man/man1/climan.1.gz"
  install -Dm755 "bin/climan" "$pkgdir/usr/bin/climan"
}
