pkgname=cbindgen
pkgver=0.6.2
pkgrel=2
pkgdesc="A project for generating C bindings from Rust code"
url="https://github.com/eqrion/cbindgen"
depends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("https://github.com/eqrion/cbindgen/archive/v0.6.2.tar.gz")
sha256sums=('67c1037014ec5c3925d0cca928425ca41f3ce20eaa06fe4c3f5c476c2feaf926')

build() {
  cd cbindgen-0.6.2
  cargo build --release
}

package() {
  cd cbindgen-0.6.2
  install -Dm755 "target/release/cbindgen" "$pkgdir/usr/bin/cbindgen"
}
