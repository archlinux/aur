# Maintainer: nulldev <contact AT andybao DOT me>

pkgname=tinc-boot-bin
pkgver=0.0.7
pkgrel=1
pkgdesc="Bootstrap your Tinc node quickly and easy"
arch=('i686' 'x86_64' 'aarch64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/slackhq/nebula"
license=('MPL2')
depends=('tinc', 'bash')
provides=('tinc-boot')
conflicts=('tinc-boot')
source_i686=("https://github.com/reddec/tinc-boot/releases/download/v$pkgver/tinc-boot_linux_i386.tar.gz")
source_x86_64=("https://github.com/reddec/tinc-boot/releases/download/v$pkgver/tinc-boot_linux_amd64.tar.gz")
source_aarch64=("https://github.com/reddec/tinc-boot/releases/download/v$pkgver/tinc-boot_linux_arm64.tar.gz")
source_arm=("https://github.com/reddec/tinc-boot/releases/download/v$pkgver/tinc-boot_linux_armv5.tar.gz")
source_armv6h=("https://github.com/reddec/tinc-boot/releases/download/v$pkgver/tinc-boot_linux_armv6.tar.gz")
source_armv7h=("https://github.com/reddec/tinc-boot/releases/download/v$pkgver/tinc-boot_linux_armv7.tar.gz")
sha256sums_i686=('1101e6f378c25489f06b076b051c59b28030c41c3d0889f42d693d095de741bd')
sha256sums_x86_64=('21de63e576d6ab1097f0ba6808ffc7ca7ae5ad354a2dec5f5373d9b31f53877f')
sha256sums_aarch64=('69145a0aea7fbdccc0e3e846e9dfa89177b3a81a065407a46a8b4384abc050cb')
sha256sums_arm=('f4b9dd9ad1db85379d8350ef95e2f6324caae4465045e3b5d9f286d0d2d7f05b')
sha256sums_armv6h=('5a1de2e6c293c36bc671e92143ed0f7b1afc5faf53506e2b20c840511281fad3')
sha256sums_armv7h=('34401b7f037e0984fb529716ba08f3c29c57b17efbf5425f9f2b47716ddc9d28')


package() {
  install -Dm755 "$srcdir/tinc-boot" -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/tinc-boot"
  install -Dm644 "$srcdir/tinc-boot.1.gz" -t "${pkgdir}/usr/share/man/man1"
}
