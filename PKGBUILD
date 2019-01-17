# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=fastotv
pkgver=0.9.5
pkgrel=1
pkgdesc="FastoTV - cross-platform solution for watching tv"
arch=('x86_64')
url="https://github.com/fastogt/fastotv"
license=('GPLv3')
source=("https://fastotv.com/downloads/linux/fastotv-$pkgver-x86_64.rpm")
sha256sums=('33507d7a4d25e3def0decd6a28d64093e34d138de4972e1ecb549febf94a0ba7')

package() {
  bsdtar -xpf "${srcdir}/fastotv-$pkgver-x86_64.rpm" -C $pkgdir
}
