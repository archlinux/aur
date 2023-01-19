# Maintainer: Bruno Luvizotto <brunoluvizotto@gmail.com>

pkgname=protoc-gen-js-bin
_name="${pkgname%-bin}"
pkgver=3.21.2
pkgrel=1
pkgdesc="Javascript support for Google's protocol buffers"
url="https://github.com/protocolbuffers/protobuf-javascript"
arch=("x86_64" "x86_32" "aarch64" "s390_64" "ppcle_64")
license=("BSD 3-Clause")
provides=("${_name}")
conflicts=("${_name}")

source_x86_64=("https://github.com/protocolbuffers/protobuf-javascript/releases/download/v${pkgver}/protobuf-javascript-${pkgver}-linux-x86_64.tar.gz")
md5sums_x86_64=("2d938b8f12ef298bd19838e68ef55d4f")

source_x86_32=("https://github.com/protocolbuffers/protobuf-javascript/releases/download/v${pkgver}/protobuf-javascript-${pkgver}-linux-x86_32.tar.gz")
md5sums_x86_32=("f7c83d1cffb1b453a02a209305006565")

source_aarch64=("https://github.com/protocolbuffers/protobuf-javascript/releases/download/v${pkgver}/protobuf-javascript-${pkgver}-linux-aarch_64.tar.gz")
md5sums_aarch64=("f827c469ab2ed01aa49accb3739765cb")

source_s390_64=("https://github.com/protocolbuffers/protobuf-javascript/releases/download/v${pkgver}/protobuf-javascript-${pkgver}-linux-s390_64.tar.gz")
md5sums_s390_64=("ca1372b00ab936fba7f71a3ada160d8a")

source_ppcle_64=("https://github.com/protocolbuffers/protobuf-javascript/releases/download/v${pkgver}/protobuf-javascript-${pkgver}-linux-ppcle_64.tar.gz")
md5sums_ppcle_64=("f6a7db94b3b118326424c89b3febe566")

package() {
  install -Dm755 "bin/${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_name}/LICENSE.md"
  install -Dm644 "LICENSE-asserts.md" "${pkgdir}/usr/share/licenses/${_name}/LICENSE-asserts.md"
}
