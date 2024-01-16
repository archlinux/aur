# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=grpcui-bin
pkgver=1.3.3
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
sha256sums=('c1d35813dfcca820165eb7b554b1030edbbdbd91cfd89c486c9fc582d0b86117')
sha256sums_i686=('9ce5352370e874ac58f4cdd2676c605f5a53e873e773f56e51ebe2f30127f9d0')
sha256sums_x86_64=('94d4398fac2138d8a5f2936d82d4678b5fd82400af3f7454a6c7af600a91d86a')
sha256sums_aarch64=('539f27857a8bc569dc0e4e02728f47853efadce9758d35b3a06a74cf3ef8f6dd')

package() {
  install -Dm755 grpcui "$pkgdir"/usr/bin/grpcui
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/grpcui/LICENSE
  install -Dm644 "README_$pkgver.md" "$pkgdir"/usr/share/doc/grpcui/README.md
}
