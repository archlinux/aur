# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=protoc-gen-grpc-java
pkgver=1.25.0
pkgrel=1
epoch=0
pkgdesc="Protobuf gRPC compiler for Java."
arch=('x86_64')
url="http://central.maven.org/"
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
_source="http://central.maven.org/maven2/io/grpc/protoc-gen-grpc-java/${pkgver}/protoc-gen-grpc-java-${pkgver}-linux-x86_64.exe"
source=($_source $_source.asc)
sha1sums=('52e4b308cae18ae37af4722eea3f6bc0e0b928c6'
          'SKIP')
validpgpkeys=('B02335AA54CCF21E52BBF9ABD9C565AA72BA2FDD')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install -Dm755 protoc-gen-grpc-java-${pkgver}-linux-x86_64.exe ${pkgdir}/usr/bin/${pkgname}
}
