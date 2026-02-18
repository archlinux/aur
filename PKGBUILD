pkgname="violet-evergarden-grub-theme"
pkgver=1.0
pkgrel=1
pkgdesc="Violet Evergarden GRUB theme"
arch=("any")
url="https://github.com/src-06/${pkgname}"
source=("${url}/archive/refs/tags/v$pkgver.tar.gz")
options=('!strip')
sha256sums=("9fc607441b071db1dfe5948f9e2865986276aa42946a63b70418baa1ff2a4b78")

package() {
  install -dm755 "${pkgdir}/boot/grub/themes/violet-evergarden"
  cp -a "${srcdir}/${pkgname}-${pkgver}/." "${pkgdir}/boot/grub/themes/violet-evergarden/"
}