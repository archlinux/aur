# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Eugene Lamskoy

pkgname=ngrok-beta
pkgver=2.3.32
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services (beta version)'
url='https://ngrok.com'
license=('Apache')
conflicts=("ngrok" "ngrok-stable")
provides=("ngrok=${pkgver}")
_srcpath="https://bin.equinox.io/c/6raCnPaTf2c/ngrok-beta-linux-"
source_i686=("${_srcpath}386.tgz")
source_x86_64=("${_srcpath}amd64.tgz")
source_armv7h=("${_srcpath}arm.tgz")
source_aarch64=("${_srcpath}arm64.tgz")
md5sums_i686=('0e3579149099ddbd308d209b874d92e8')
md5sums_x86_64=('4fe7ab22b743d191472a54883de0d74b')
md5sums_armv7h=('eebe76b17812b6d97f27cf09dc129fff')
md5sums_aarch64=('87e7edab4d3ee862608aca8831de7b4f')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')

package() {
  install -Dm755 ${srcdir}/ngrok  "${pkgdir}/usr/bin/ngrok"
}
# vim: ft=sh ts=2 sw=2 et