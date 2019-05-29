# Maintainer: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>

pkgname=breeze-cursors-lh
pkgver=2.0
pkgrel=4
pkgdesc="Breeze cursor themes for lefties"
arch=(any)
url="https://store.kde.org/p/999680/"
license=('CCPL:by-nc')
source=("https://cl.ly/4aa545307da1/download/breeze-cursors-lh.tar.bz2")
md5sums=('d928113e284c705461da4bbb82a94457')

package() {
	mkdir -p ${pkgdir}/usr/share/icons
	cp -dr --no-preserve='ownership' ${srcdir}/Breeze-[A-Z]* "$pkgdir"/usr/share/icons
}

