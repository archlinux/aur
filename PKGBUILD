# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nebula-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A scalable overlay networking tool"
arch=('i686' 'x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/slackhq/nebula"
license=('MIT')
depends=('glibc')
provides=('nebula')
conflicts=('nebula')
source=("https://raw.githubusercontent.com/slackhq/nebula/master/LICENSE")
source_i686=("https://github.com/slackhq/nebula/releases/download/v$pkgver/nebula-linux-386.tar.gz")
source_x86_64=("https://github.com/slackhq/nebula/releases/download/v$pkgver/nebula-linux-amd64.tar.gz")
source_aarch64=("https://github.com/slackhq/nebula/releases/download/v$pkgver/nebula-linux-arm64.tar.gz")
source_arm=("https://github.com/slackhq/nebula/releases/download/v$pkgver/nebula-linux-arm-5.tar.gz")
source_armv6h=("https://github.com/slackhq/nebula/releases/download/v$pkgver/nebula-linux-arm-6.tar.gz")
source_armv7h=("https://github.com/slackhq/nebula/releases/download/v$pkgver/nebula-linux-arm-7.tar.gz")
sha256sums=('SKIP')
sha256sums_i686=('f3dee98a468cdae524e82b06688ecdf6b92282f888fdfb51c2cbf641f40ea29d')
sha256sums_x86_64=('ca8edda2f265dedb27878bc7465cdd50a2613af649b267e237d4a57ac95ff318')
sha256sums_aarch64=('02ba7ba4b98fc3b94d19f99897ab55513b0ab3f9ac023abf153b61d4abe341fd')
sha256sums_arm=('0b64321ba9b7a85178f8f1513f0e7990a3465e61499d16e6934052f36680e253')
sha256sums_armv6h=('42c4087fd2bd18600e31b5ed9ccb7c51434a88bd3558900c67450514a4549b13')
sha256sums_armv7h=('2a9ded282b92e5eec88df80e1d773b1ae8ff590dd66aa5c5fb9b532f819707f5')


package() {
  install -Dm755 "$srcdir/nebula"{,-cert} -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/nebula"
}
