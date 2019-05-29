# Maintainer: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>

pkgname=xcursor-comix-lh
pkgver=0.8.2
pkgrel=2
pkgdesc="Comix X Cursor Theme for lefties"
depends=('libxcursor')
arch=(any)
url="https://gitlab.com/limitland/comixcursors"
license=('GPL')
source=("https://cl.ly/38c89d33ce3e/download/ComixCursors-LH.tar.bz2")
md5sums=('1058c81b7afed502d0e67b64272b57e8')

package() {
	mkdir -p ${pkgdir}/usr/share/icons
	cp -dr --no-preserve='ownership' ${srcdir}/ComixCursors-LH-[A-Z]* "$pkgdir"/usr/share/icons
}

