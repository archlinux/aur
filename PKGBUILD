# Maintainer: Librewish <librewish@gmail.com>

pkgname=performance-tweaks
pkgver=0.0.1.r5.ge17ef26
pkgrel=2
pkgdesc='Tweaks for improving performance based on the Arch wiki'
arch=(any)
url="https://gitlab.com/garuda-linux/themes-and-settings/settings/performance-tweaks"
license=(GPL)
conflicts=(powersave-tweaks)
depends=(hdparm)
makedepends=(git)
_commit=22119756fb6dc4815256e8503f6e98ff3f7bb80d
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

package() {
	cd $pkgname
	install -Dm644 -t "$pkgdir"/etc/tmpfiles.d   etc/tmpfiles.d/*.conf
	install -Dm644 -t "$pkgdir"/etc/udev/rules.d etc/udev/rules.d/*.rules
}
