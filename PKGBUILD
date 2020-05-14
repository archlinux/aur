# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Eugene Lamskoy

pkgname=ngrok-beta
pkgver=2.3.35
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services (beta version)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://ngrok.com'
license=('Apache')
conflicts=("ngrok" "ngrok-stable")
provides=("ngrok=${pkgver}")
_srcpath="https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-beta-linux-"
source_i686=("${_srcpath}386.tgz")
source_x86_64=("${_srcpath}amd64.tgz")
source_armv7h=("${_srcpath}arm.tgz")
source_aarch64=("${_srcpath}arm64.tgz")
sha256sums_i686=('136673d9f46ecea7cd0d94d617f07d98fce24a99892d3324f9714c9e3df50c0f')
sha256sums_x86_64=('55df9c479b41a3b9b488458b5fb758df63001d14196a4126e3f669542c8727e9')
sha256sums_armv7h=('0e21e242858be513f70a22a2e5f40e5859275454f7b18d451ec30af4deba2dd2')
sha256sums_aarch64=('412a6d145ab61eae0012d2fbe111bf962e11327f11787d3d41d56ea97969fe04')

package() {
  install -Dm755 ${srcdir}/ngrok  "${pkgdir}/usr/bin/ngrok"
}
# vim: ft=sh ts=2 sw=2 et