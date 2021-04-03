# Maintainer: nulldev <contact AT andybao DOT me>

pkgname=tinc-boot-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Bootstrap your Tinc node quickly and easy"
arch=('i686' 'x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/reddec/tinc-boot"
license=('MPL2')
depends=('tinc' 'bash')
provides=('tinc-boot')
conflicts=('tinc-boot')
source_i686=("https://github.com/reddec/tinc-boot/releases/download/v$pkgver/tinc-boot_linux_i386.tar.gz")
source_x86_64=("https://github.com/reddec/tinc-boot/releases/download/v$pkgver/tinc-boot_linux_amd64.tar.gz")
source_aarch64=("https://github.com/reddec/tinc-boot/releases/download/v$pkgver/tinc-boot_linux_arm64.tar.gz")
source_arm=("https://github.com/reddec/tinc-boot/releases/download/v$pkgver/tinc-boot_linux_armv5.tar.gz")
source_armv6h=("https://github.com/reddec/tinc-boot/releases/download/v$pkgver/tinc-boot_linux_armv6.tar.gz")
source_armv7h=("https://github.com/reddec/tinc-boot/releases/download/v$pkgver/tinc-boot_linux_armv7.tar.gz")
sha256sums_i686=('1a5d0fae6fb32cf3c14bdc5e617b198a2c1d42882c52f9d54812f487dbb97c4a')
sha256sums_x86_64=('d05a6c2da797595fe0ad076bfb6720949c88561e5fbda010eca5e6401773185a')
sha256sums_aarch64=('5b1e9f9e5044f9995e291977fa4047d89d51bdd795bd45ad74f84f5734d900ce')
sha256sums_arm=('7aca3bfe9b219d4b9515b32920c1d70cdfda16e5cb6780e8ffb4d66fceca013f')
sha256sums_armv6h=('8364ba52162e5bb5a60e09f49efb851f43e03c25011435339828be97c993f5a1')
sha256sums_armv7h=('5a4c0ed483c3f232a784aba921d72432ed323174e02ccd6dad22380fa27f7806')


package() {
  install -Dm755 "$srcdir/tinc-boot" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/tinc-boot"
  install -Dm644 "$srcdir/tinc-boot.1.gz" -t "${pkgdir}/usr/share/man/man1"
}
