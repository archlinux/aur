# Maintainer: Claudio Netto <nettinhorama@gmail.com>
# Maintainer: Tsuru <tsuru@g.globo>

pkgname='tsuru-bin'
pkgver=1.15.5
pkgrel=3
pkgdesc='tsuru-client is a tsuru command line tool for application developers.'
url='https://tsuru.io'
arch=('aarch64' 'i686' 'x86_64')
license=('BSD-3-Clause')
provides=('tsuru')
conflicts=('tsuru')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/tsuru/tsuru-client/releases/download/1.15.5/tsuru_1.15.5_linux_arm64.tar.gz")
sha256sums_aarch64=('7b6f6bd11acd1dec8123906553329328bedb71390d7942f54079cd3635e5a3f2')

source_i686=("${pkgname}_${pkgver}_i686.tar.gz::https://github.com/tsuru/tsuru-client/releases/download/1.15.5/tsuru_1.15.5_linux_386.tar.gz")
sha256sums_i686=('c0aca8160afb499850427d979c68edd3f3b199897abe552f234b8a8f68f97db9')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/tsuru/tsuru-client/releases/download/1.15.5/tsuru_1.15.5_linux_amd64.tar.gz")
sha256sums_x86_64=('355ad50bf33403b029897d67e9bf365b3daa78ee82165ce5fbd4a9c88a13c121')

package() {
  install -Dm755 "./tsuru" "${pkgdir}/usr/bin/tsuru"
}
