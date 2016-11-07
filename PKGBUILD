#Maintainer: Jeremy Marlow <i3_arch@archlinux.info>
#Contributor: JJ.Ying <yingjunjiu@yahoo.com.cn> converted by GrynayS

pkgname=ecliz-arch
pkgver=2016.11.03
pkgrel=2
pkgdesc="Ecliz Arch Cursor Theme"
arch=('any')
license=('GPL')
source=("https://raw.githubusercontent.com/i3-Arch/PKGBUILD/master/ecliz-arch/ecliz-arch.tar.gz")
md5sums=('ce892397831be5e50841b60d410dfb2b')
url="http://jj-ying.deviantart.com/art/Ecliz-Cursors-33874746" #Except the cursor is cyan

package() {
	install -dm755 "$pkgdir"/usr/share/icons/
	cp -dR --no-preserve=ownership ecliz-arch "$pkgdir"/usr/share/icons/ecliz-arch
	find "$pkgdir" -type f -exec chmod 644 {} +
	find "$pkgdir" -type d -exec chmod 755 {} +
}

