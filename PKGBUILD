# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: saxonbeta <saxonbeta at gmail>
# Contributor: goten002 <goten002@gmail.com>
# Contributor: epinull

pkgname=mynotex
pkgver=1.4.1.0
pkgrel=2
pkgdesc="A free note-taking, document file and activity manager for GNU/Linux"
url="https://sites.google.com/site/mynotex"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sqlite3' 'gtk2')
optdepends=('gnupg: for notes encryption')
source_i686=("https://sites.google.com/site/${pkgname}/files/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("https://sites.google.com/site/${pkgname}/files/${pkgname}_${pkgver}_amd64.deb")
sha256sums_i686=('7a2b049d166609bec364e34ddf9899ff218c2fea410014f0af78472ee0fb4b90')
sha256sums_x86_64=('0026f7182fd0f9c38b6c220a3ea82642d93241f78ba33360f0d66270bf9f8673')

package() {
  tar -axf data.tar.xz -C "$pkgdir"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/mynotex/mynotex" "${pkgdir}/usr/bin/mynotex"
}
