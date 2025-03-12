# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=grpcui-bin
pkgver=1.4.3
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
sha256sums_i686=('200b0b018b771f665dc6ffa389d1894f09af223298c382f202d7e2c15f98de92')
sha256sums_x86_64=('e020f4c7e40d099432834a2712bf58960bf657994a5b36f5f1becdb47836a244')
sha256sums_aarch64=('9432cf4881977219faf8856b30fd24c6d2089e11486b289514ae99ff4b1a24d5')

package() {
  install -Dm755 grpcui "$pkgdir"/usr/bin/grpcui
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/grpcui/LICENSE
  install -Dm644 "README_$pkgver.md" "$pkgdir"/usr/share/doc/grpcui/README.md
}
