# Contributor: Dany Marcoux <danymarcoux+archlinux@gmail.com>

pkgname=lf-bin
pkgver=7
pkgrel=1
pkgdesc='lf: A terminal file manager, heavily inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
source_i686=("${url}/releases/download/r${pkgver}/lf-linux-386.tar.gz")
source_x86_64=("${url}/releases/download/r${pkgver}/lf-linux-amd64.tar.gz")
source_armv7h=("${url}/releases/download/r${pkgver}/lf-linux-arm.tar.gz")
sha256sums_i686=('9e9e4624b7d038cc8e56c995c31947454635eff2490f035a2069dd8d6afbc54d')
sha256sums_x86_64=('2d5b5bb6e6b446a547c7111933fba0bf0caa29a50099fa43d5b5d1a62f89b020')
sha256sums_armv7h=('06367074dcfb8f5bd392c005dc6593308cb281a4159059d4f7e3296e793a38f5')
provides=('lf')
conflicts=('lf')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
