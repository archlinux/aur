# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=grpcui-bin
pkgver=1.5.2
pkgrel=1
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
sha256sums=('4add9388ee94f6d70c9b1a9a44adce4d7c1b0573d4643b60cb6d4a669506166e')
sha256sums_i686=('9e81f9e111e0d3e41af5503bcb87b54f63d03844aeba1c6f2499fa7923e72197')
sha256sums_x86_64=('a57acb97726c70ce2f323118ccbd1ac28fbe608d8af7e9037526aff16d7a0bc4')
sha256sums_aarch64=('79ebb98b6833ffc46ffff04bc8125ea2e1870e6e34970b9a8b7c463b31da45aa')

package() {
  install -Dm755 grpcui "$pkgdir"/usr/bin/grpcui
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/grpcui/LICENSE
  install -Dm644 "README_$pkgver.md" "$pkgdir"/usr/share/doc/grpcui/README.md
}
