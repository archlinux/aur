# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=assh-bin
_pkgname=${pkgname/-bin}
pkgver=2.11.3
pkgrel=2
pkgdesc="make your ssh client smarter"
arch=( 'x86_64' 'i686' 'aarch64' 'armv6h' 'armv7h' )
url="https://github.com/moul/assh"
license=( 'MIT' )

source_x86_64=( assh::https://github.com/moul/assh/releases/download/v${pkgver}/assh_linux_amd64 )
source_i686=( assh::https://github.com/moul/assh/releases/download/v${pkgver}/assh_linux_386 )
source_armv6h=( assh::https://github.com/moul/assh/releases/download/v${pkgver}/assh_linux_arm )
source_armv7h=( assh::https://github.com/moul/assh/releases/download/v${pkgver}/assh_linux_arm )
source_aarch64=( assh::https://github.com/moul/assh/releases/download/v${pkgver}/assh_linux_arm64 )

sha256sums_x86_64=( 'cc20837cf3f6cbf461e23815ba075e457162b7b5c5bc50ce7554db699f8b7e49' )
sha256sums_i686=( '70003970b9973ebbaeee92fcf260a12d814e019f5e2d4eda636c541bc53dd986' )
sha256sums_aarch64=( '542f4ac25b249e461da9b917b0d6db1f6450756168d6ec3ce752a26a6c7572a8' )
sha256sums_armv6h=( '678f7121a9f05d2092db426ba1106d77df4d347de07b15ee15b55da01a1390ad' )
sha256sums_armv7h=( '678f7121a9f05d2092db426ba1106d77df4d347de07b15ee15b55da01a1390ad' )

provides=( 'assh' )

package() {
  install -Dm755 "${srcdir}/assh" "${pkgdir}/usr/bin/assh"
}
