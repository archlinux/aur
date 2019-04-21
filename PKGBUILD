# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=fastotv
pkgver=1.2.0
pkgrel=1
pkgdesc="FastoTV - cross-platform solution for watching tv"
arch=('x86_64')
url="https://github.com/fastogt/fastotv"
license=('GPLv3')
source=("https://fastotv.com/downloads/linux/fastotv-$pkgver-x86_64.rpm")
sha256sums=('7968f8cbef363f969df8a544498cb4c156b585c49bb37efc3c1833e14efff174')

package() {
  bsdtar -xpf "${srcdir}/fastotv-$pkgver-x86_64.rpm" -C $pkgdir
}
