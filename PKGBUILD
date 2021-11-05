# Contributor: Alex Suykov <axs@ukr.net>

pkgname=ttf-code2001
pkgver=0.921
pkgrel=1
pkgdesc="Plane 1 Unicode-based font (TTF)"
arch=('any')
url="https://www.code2001.com/"
license=('custom')
source=('http://www.code2001.com/CODE2001.zip')
md5sums=('84fc9d98207524497d43be8c780a2ae3')
sha256sums=('b83bf05ba8c07b33a5345c59a88fba352bdd1ded9cdf1692ecd3aa11157bb4cf')
sha512sums=('ad79b3f7f6612b6876c7feb679525165d74c45f129b3d61befe6349b08bc86c0f185017b1de6a17bf7dbaa090b3a46daa6c84ee958b616d0d6319016d65879f8')

package() {
  install -D -m644 CODE2001.TTF "$pkgdir/usr/share/fonts/TTF/Code2001.ttf"
}
