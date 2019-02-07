# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=fastotv
pkgver=0.9.6
pkgrel=1
pkgdesc="FastoTV - cross-platform solution for watching tv"
arch=('x86_64')
url="https://github.com/fastogt/fastotv"
license=('GPLv3')
source=("https://fastotv.com/downloads/linux/fastotv-$pkgver-x86_64.rpm")
sha256sums=('6c4dbe66d8187e65276a60fa3b5ad5a36d9ce6b50ed73bc58951b1c8a313eaa0')

package() {
  bsdtar -xpf "${srcdir}/fastotv-$pkgver-x86_64.rpm" -C $pkgdir
}
