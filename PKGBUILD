# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=grpcui-bin
pkgver=1.5.4
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
sha256sums_i686=('74339ebc66b1f2806e43a353ec2e2f475fb64e98df5f530acc7b23e4ce352d63')
sha256sums_x86_64=('c5393203248854b2f6eda054bfaf55b6b26f248a45c8a2c8df7f43bd007396ff')
sha256sums_aarch64=('6d61052378ffbfad038d6cda614ebc2b75b5fe1b35e678c29b6c682ef40c994f')

package() {
  install -Dm755 grpcui "$pkgdir"/usr/bin/grpcui
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/grpcui/LICENSE
  install -Dm644 "README_$pkgver.md" "$pkgdir"/usr/share/doc/grpcui/README.md
}
