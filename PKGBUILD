# Maintainer: zzy-ac <zzy-ac@qq.com>

pkgname=ctyun-cloud-desk
pkgver=1.34.4
pkgrel=201340400
pkgdesc="天翼云电脑linux客户端（装好之后需要重启电脑才能正常使用）"
arch=("x86_64")
url="https://www.ctyun.cn/"
license=()
depends=('libnotify' 'libxss' 'libxtst' 'xdg-utils' 'libusb'  'pulseaudio')
source=(
  "https://desk.ctyun.cn:8999/desktop-prod/software/linux_x86_xc_client/11/64/$pkgrel/CtyunClouddeskUniversal-$pkgver-$pkgrel-amd64-202207141538.deb")
sha256sums=('dc241a446104c4ebbcd64c1c5a1709c80dbd73d5eadf84777468d5e536d5e8f8')

build() {
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.gz -C "${srcdir}/dpkgdir"
}

package() {
  cp -r "${srcdir}/dpkgdir"/* "${pkgdir}"
} 
