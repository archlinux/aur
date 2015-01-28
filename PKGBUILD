# Maintainer: Marten Lienen <marten.lienen@gmail.com>
pkgname=lightdm-webkit-theme-nebel
pkgver=0.1.0
pkgrel=1
pkgdesc="A semitransparent LightDM greeter theme"
arch=("any")
url="https://github.com/CQQL/lightdm-webkit-theme-nebel"
license=("GPL3")
depends=("lightdm-webkit-greeter")
makedepends=("git")
source=("$pkgname::git+https://github.com/CQQL/lightdm-webkit-theme-nebel.git")
md5sums=("SKIP")

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
