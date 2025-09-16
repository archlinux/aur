# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=protoc-gen-grpc-java
pkgver=1.75.0
pkgrel=1
epoch=0
pkgdesc="Protobuf gRPC compiler for Java."
arch=('x86_64')
url="https://grpc.io"
license=('MIT')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
_source="https://repo1.maven.org/maven2/io/grpc/protoc-gen-grpc-java/${pkgver}/protoc-gen-grpc-java-${pkgver}-linux-x86_64.exe"
source=($_source $_source.asc)
sha1sums=('7dd0f4a0279b0babaa7c0e85690ad8de2ba636df'
          'SKIP')
validpgpkeys=('B02335AA54CCF21E52BBF9ABD9C565AA72BA2FDD')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install -Dm755 protoc-gen-grpc-java-${pkgver}-linux-x86_64.exe ${pkgdir}/usr/bin/${pkgname}
}
