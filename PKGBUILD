# Maintainer: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>

pkgname=breeze-icons-lh
pkgver=2.0
pkgrel=1
pkgdesc="Breeze icon themes for lefties"
arch=(any)
url="https://store.kde.org/p/999680/"
license=('CCPL:by-nc')
source=("https://ptpb.pw/~breeze-icons-lh")
md5sums=('459b3ea099bc7099b7eb31fb3f94b044')

package() {
	mkdir -p ${pkgdir}/usr/share/icons
    cp -dr --no-preserve='ownership' ${srcdir}/Breeze-[A-Z]* "$pkgdir"/usr/share/icons
}

