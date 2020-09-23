# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nebula-bin
pkgver=1.3.0
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
sha256sums_i686=('236b1f2ebb9e90cac9d322c89699e203bf724c6e534002395d861525f392fee5')
sha256sums_x86_64=('a82e0c6ab14dd2c5af921ae3051a88493ac053a5ece77eaa9e87a0543fd3d89b')
sha256sums_aarch64=('7073edfa357f5ee8fd2e155a8671ff65ccb7ccc31f8bbf11eaea9fcda1a2cd04')
sha256sums_arm=('cae19acc1c87fcbc064be944d9b3d3c6a8c38af20222b187a88cb6f68eef16c9')
sha256sums_armv6h=('fb4d725570797ecab714faca86908c83d754a97b0641c5aced1501fed9e126f8')
sha256sums_armv7h=('d9fe7768b5b80f72c1b0b9cd47004361b7238ef042de21298b6e68097392f215')


package() {
  install -Dm755 "$srcdir/nebula"{,-cert} -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/nebula"
}
