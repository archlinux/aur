# Maintainer: j1simon

pkgname=splashy-bin
pkgver=1
pkgrel=1
pkgdesc='Unsplash photos as desktop wallpapers'
arch=('x86_64')
url='https://splashy.art/'
license=('ignored')
provides=('splashy')
source=("https://splashy.s3.amazonaws.com/Splashy-v1.0.deb")
md5sums=('eb1583dbbb406a3641df0d3006ece557')

package() {
   bsdtar xf data.tar.xz
	cp -R "${srcdir}"/opt "${pkgdir}"
	install -d "${pkgdir}"/usr/share
	cp -R "${srcdir}"/usr/share/* "${pkgdir}"/usr/share    
}

