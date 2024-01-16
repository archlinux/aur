# Maintainer: Moritz Biering <moritzbiering.mb@gmail.com>

pkgname=nachrichten-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Stay informed without leaving your command line"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/zMoooooritz/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source_x86_64=("${url}/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
#source_i686=("${url}/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_armv7h=("${url}/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_armv7.tar.gz")
source_aarch64=("${url}/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")

package() {
  # cd "${pkgname%-bin}-$pkgver"
  install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
}

sha256sums_x86_64=('58250bb246537c058d07e5c91d3097dc6b09424e19d6d6d452b707e50e25cf5f')
sha256sums_armv7h=('1db8466a332e544e68f416427903f60c4f819b8d081c4bcd1f81f6ece211ae54')
sha256sums_aarch64=('3b00cd1cb3ff16886559b990724bf312d6d0496b4de408aa17612eb1434d0108')
#sha256sums_i686=('cc07b62d6c1bddb7bab26844f869703d7213521da6a8635a701c9b51a4ac920f')

