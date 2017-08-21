# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=protoc-gen-grpc-java
pkgver=0.15.0
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

#source_x86_64=("http://central.maven.org/maven2/io/grpc/protoc-gen-grpc-java/${pkgver}/protoc-gen-grpc-java-${pkgver}-linux-x86_64.exe"{,.asc})
#md5sums_x86_64=('efe26959a9af989402834eefac1ec78b'
#                'SKIP')

source_x86_64=("http://central.maven.org/maven2/io/grpc/protoc-gen-grpc-java/${pkgver}/protoc-gen-grpc-java-${pkgver}-linux-x86_64.exe")
md5sums_x86_64=('efe26959a9af989402834eefac1ec78b')

validpgpkeys=('54024A1AD00BE5EA')

package() {
    mkdir -p ${pkgdir}/usr/local/bin
    install -Dm755 protoc-gen-grpc-java-${pkgver}-linux-x86_64.exe ${pkgdir}/usr/local/bin
}
