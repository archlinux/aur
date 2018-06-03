# Contributor: Dany Marcoux <danymarcoux+archlinux@gmail.com>

pkgname=lf
pkgver=4
pkgrel=1
pkgdesc='lf: A terminal file manager, heavily inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
source_i686=("${url}/releases/download/r${pkgver}/lf-linux-386.tar.gz")
source_x86_64=("${url}/releases/download/r${pkgver}/lf-linux-amd64.tar.gz")
source_armv7h=("${url}/releases/download/r${pkgver}/lf-linux-arm.tar.gz")
md5sums_i686=('208d736544a2eadb3ceaad6000932dce')
md5sums_x86_64=('e8c9fe971c41a428bf302e00f077fe26')
md5sums_armv7h=('0a6a42df17202bbee767cbbace27726f')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
