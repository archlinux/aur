pkgname=ngrok-beta
pkgver=2.2.9
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services. Beta version'
url='https://ngrok.com'
license=('Apache')
conflicts=("ngrok" "ngrok-stable")
provides=("ngrok=${pkgver}")
_srcpath="https://bin.equinox.io/c/6raCnPaTf2c/ngrok-beta-linux-"
source_i686=("${_srcpath}386.tgz")
source_x86_64=("${_srcpath}amd64.tgz")
source_armv7h=("${_srcpath}arm.tgz")
source_aarch64=("${_srcpath}arm64.tgz")
md5sums_i686=('56db2e1f157460d4f8d71318eb276bae')
md5sums_x86_64=('825507cf6a10c3e37134ab1cce0d121b')
md5sums_armv7h=('fa4d06d6cd868fd2b990c17fdd642bdf')
md5sums_aarch64=('27f43b218924770b68f2797f97e171a7')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')

package() {
  cd "${srcdir}"

  # Install the program.
  install -Dm755 ngrok  "${pkgdir}/usr/bin/ngrok"
}

# vim: ft=sh ts=2 sw=2 et
