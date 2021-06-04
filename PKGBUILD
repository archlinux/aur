# Maintainer: Genstar <genstar@disroot.org>
pkgname=theme-windows-3.11
pkgver=1.1
pkgrel=1
pkgdesc="Windows 3.11 theme (GTK2, GTK3, GNOME Shell, Cinnamon, Metacity, Xfwm4)"
arch=('any')
url="https://github.com/B00merang-Project/Windows-3.11"
license=('GPL3')
optdepends=('gtk2' 'gtk3' 'gnome-shell' 'xfwm4' 'cinnamon' 'metacity' 'deepin-metacity')
changelog=
source=("https://github.com/B00merang-Project/Windows-3.11/archive/refs/tags/$pkgver.tar.gz")
cksums=('1219733895')
md5sums=('09e97b8693529532f41828f85efb942c')
sha1sums=('4cb2b33cca8744048123e8c6497169eef4be3fdf')
sha256sums=('2de9d9abe78eb7e45ad80903a82e08ef66e5bd892d4f5394fd1601d78f2ccbf4')
sha384sums=('47dae2205df0b16b76c3d8dc67f32820ccf02bc48b8b39b98aac95c0b22830241912c5948568eb8254e1a5e6a33c658d')
sha512sums=('7e1945896b906507ebb5258b9ae6cbae613729300ff3109ad7fe9eaed1759fc25b5ca0e54c1897c634dcd27ff93d9451c997077bbefbe51f23dcbba6c0c54288')
b2sums=('178038833088783ddf8f8d64555c56a60c1c1bdd011e727589ae656c9fb11caba4924dd99b723dedf2d70a2eea9425b46a9a9ba2fa77283cfd6ca5ee98f0abe7')

package() {
	cd "Windows-3.11-$pkgver"
	find -type f -exec install -vDm 644 {} "$pkgdir/usr/share/themes/Windows-3.11/"{} \;
}
