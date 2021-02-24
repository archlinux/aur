# Maintainer: MidAutumnMoon <mid.autumn0moon@gmail.com>

pkgname=assh-bin
pkgver=2.11.3
pkgrel=1
pkgdesc="make your ssh client smarter"
arch=( 'x86_64' )
url="https://github.com/moul/assh"
license=( 'MIT' )

source=( https://github.com/moul/assh/releases/download/v${pkgver}/assh_linux_amd64 )
sha256sums=( 'cc20837cf3f6cbf461e23815ba075e457162b7b5c5bc50ce7554db699f8b7e49' )

provides=( 'assh' )

package() {
  install -Dm755 "${srcdir}/assh_linux_amd64" "${pkgdir}/usr/bin/assh"
}
