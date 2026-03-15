# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Bruno Luvizotto <brunoluvizotto@gmail.com>
pkgname=protoc-gen-js-bin
pkgver=4.0.2
pkgrel=1
pkgdesc="Protocol Buffers for JavaScript"
arch=('x86_64' 'aarch64')
url="https://github.com/protocolbuffers/protobuf-javascript"
license=('Apache-2.0 AND BSD-3-Clause')
depends=('protobuf')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("$url/releases/download/v$pkgver/protobuf-javascript-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/protobuf-javascript-$pkgver-linux-aarch_64.tar.gz")
sha256sums_x86_64=('1dc945c36351d6a65f9afc1442394336e7ac325f7e1c27f86ca99daa7fea2917')
sha256sums_aarch64=('18221cf669d03bbe5b5bfdd6c2184effbeddba9a8f3fdc6bd4511f980c1cd298')

package() {
  install -Dm755 "bin/${pkgname%-bin}" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
