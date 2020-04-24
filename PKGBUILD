# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=wellington-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Adds spriting to the lightning fast libsass. No need to learn a new tool, this all happens right in your Sass"
arch=('x86_64')
url='http://getwt.io'
license=('Apache-2.0')
provides=("${pkgname%-bin}")
source=("https://github.com/wellington/wellington/releases/download/v${pkgver}/wt_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('f0f8ad2461b16e6277b863b092826a9d0c066877c3ea13bd79694d327e800d3d')

package() {
  install -Dm755 "${srcdir}/wt" "${pkgdir}/usr/bin/wt"
}