# Maintainer: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>

pkgname=breeze-cursors-lh
pkgver=2.0
pkgrel=2
pkgdesc="Breeze cursor themes for lefties"
arch=(any)
url="https://store.kde.org/p/999680/"
license=('CCPL:by-nc')
source=("https://ptpb.pw/~breeze-cursors-lh")
md5sums=('8f4bf5c748817c55e826536d59606f0d')

package() {
	mkdir -p ${pkgdir}/usr/share/icons
    cp -dr --no-preserve='ownership' ${srcdir}/Breeze-[A-Z]* "$pkgdir"/usr/share/icons
}

