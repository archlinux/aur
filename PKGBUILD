# Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>
pkgname=publii
pkgver=0.39.1
pkgrel=1
pkgdesc="Publii is a desktop-based CMS for Windows, Mac and Linux that makes creating static websites fast and hassle-free, even for beginners"
arch=('x86_64')
url="https://github.com/GetPublii/Publii"
license=('MIT')
source=("https://getpublii.com/download/Publii-$pkgver.rpm")
sha256sums=('885415f6a1a40e8551dda79d36de696a7c36316458d1a838db023e308905f454')

package() {
  bsdtar -xpf "${srcdir}/Publii-$pkgver.rpm" -C $pkgdir
}
