# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=fastotv
pkgver=0.9.4
pkgrel=1
pkgdesc="FastoTV - cross-platform solution for watching tv"
arch=('x86_64')
url="https://github.com/fastogt/fastotv"
license=('GPLv3')
source=("https://fastotv.com/downloads/linux/fastotv-$pkgver-x86_64.rpm")
sha256sums=('44668e5da60c345fb9cb56a3cfce3042b3a35d96c6ac41eeaa0c41f9a1f0b7ba')

package() {
  bsdtar -xpf "${srcdir}/fastotv-$pkgver-x86_64.rpm" -C $pkgdir
}
