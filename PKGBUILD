pkgname=ngrok-stable
pkgver=2.2.8
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services. Stable version'
url='https://ngrok.com'
conflicts=("ngrok" "ngrok-beta")
provides=("ngrok=${pkgver}")
license=('Apache')
_srcpath="https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-"
source_i686=("${_srcpath}386.tgz")
source_x86_64=("${_srcpath}amd64.tgz")
source_armv7h=("${_srcpath}arm.tgz")
source_aarch64=("${_srcpath}arm64.tgz")
md5sums_i686=('3dd4ad624a9646a7605599fa114bd24d')
md5sums_x86_64=('37e649abaf66cb4ebe8a3f2830cbc2a6')
md5sums_armv7h=('4afc884d700e33444b01aebfe263c354')
md5sums_aarch64=('f9544077ee1d0351d87fa58e190f496c')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')

package() {
  cd "${srcdir}"

  # Install the program.
  install -Dm755 ngrok  "${pkgdir}/usr/bin/ngrok"
}

# vim: ft=sh ts=2 sw=2 et
