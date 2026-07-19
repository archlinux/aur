# Maintainer: tee < teeaur at duck dot com >
pkgname=sqlrite-bin
pkgver=0.14.0
pkgrel=1
#pkgdesc="SQLRite — an embedded SQL + vector database in Rust"
#pkgdesc="SQLRite is a from-scratch SQLite alternative — a single-file embedded database in Rust"
pkgdesc="SQLRite - Simple embedded database modeled off SQLite in Rust"
arch=(x86_64)
url="https://sqlritedb.com"
license=(MIT)
provides=(sqlrite)
conflicts=(sqlrite)
depends=(cairo glib2 glibc gtk3 hicolor-icon-theme libgcc libsoup3 webkit2gtk-4.1)
source=("https://github.com/joaoh82/rust_sqlite/releases/download/sqlrite-desktop-v$pkgver/SQLRite_${pkgver}_amd64.deb"
  "https://github.com/joaoh82/rust_sqlite/raw/v$pkgver/LICENSE")
b2sums=('1388a56fbe06dfb52e600ba9ef913893dcfce29db81fc332f9199580dbf47ce24f4ec08b1258fb8b4bfc7d01c6acc7bfcf54425de82802b8b67010602377cfdc'
        '6d5414bd5ecc7face392d9af8dc45f45e116dc4420ee17a1dbe71b5d9fbdfaea311390c4553aecf8ae49b141f770ca675597157e6ade6394804708239c643d27')

package() {
  tar -xf data.tar.gz -C "$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
