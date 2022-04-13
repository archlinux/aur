# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=grpcui-bin
pkgver=1.3.0
pkgrel=2
pkgdesc='An interactive web UI for gRPC, along the lines of postman (binary release)'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/fullstorydev/grpcui"
license=('MIT')
provides=('grpcui')
conflicts=('grpcui')
source=("README_$pkgver.md::https://raw.githubusercontent.com/fullstorydev/grpcui/v$pkgver/README.md")
source_i686=("grpcui_${pkgver}_i686.tar.gz::https://github.com/fullstorydev/grpcui/releases/download/v$pkgver/grpcui_${pkgver}_linux_x86_32.tar.gz")
source_x86_64=("grpcui_${pkgver}_x86_64.tar.gz::https://github.com/fullstorydev/grpcui/releases/download/v$pkgver/grpcui_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("grpcui_${pkgver}_aarch64.tar.gz::https://github.com/fullstorydev/grpcui/releases/download/v$pkgver/grpcui_${pkgver}_linux_arm64.tar.gz")
sha256sums=('7b4a32609bdcd0064be15d8e99b5cd13a2867f6665b196ed56e7a3f759775a84')
sha256sums_i686=('0d570326b95305414aaf841a8793f23c2236930b4db7c6121d26bfd2a75da6f2')
sha256sums_x86_64=('9a7ebe31b89d585a80971f3795b3a8ada9345499c5f987a5a24d02368c314fae')
sha256sums_aarch64=('1c55cca265a29bc9825c3c4a10e882bbfa9c56795b0674be7a8fce8d3ce2f6ed')

package() {
  install -Dm755 grpcui "$pkgdir"/usr/bin/grpcui
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/grpcui/LICENSE
  install -Dm644 "README_$pkgver.md" "$pkgdir"/usr/share/doc/grpcui/README.md
}
