# Maintainer: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>

pkgname=breeze-cursors-lh
pkgver=2.0
pkgrel=5
pkgdesc="Breeze cursor themes for lefties"
arch=(any)
url="https://store.kde.org/p/999680/"
license=('CCPL:by-nc')
source=("https://share.getcloudapp.com/Qwu5L5eN/download/breeze-cursors-lh")
sha256sums=('0d39dc8b6cb29cfdb07aa8fe267e88e5add145723c7d14db232fef2203a0f491')

package() {
	mkdir -p ${pkgdir}/usr/share/icons
	cp -dr --no-preserve='ownership' ${srcdir}/Breeze-[A-Z]* "$pkgdir"/usr/share/icons
}

