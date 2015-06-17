# Maintainer: Pavol (Lopo) Hluchy <lopo AT losys DOT eu>

pkgname=ksplash-oxyarch
pkgver=1.0
pkgrel=2
pkgdesc="A Arch Linux splash screen for KDE 4.x based on the Default KDE 4 splash screen"
arch=('any')
url="http://kde-look.org/content/show.php?content=98805"
license=('GPL')
source=("https://dl.dropbox.com/u/4813183/linux/theme/KDE/ksplash-oxyarch-1.0.tar.gz")
md5sums=('a6e2adbd9d4a2344aaa1091801574706')

package() {
	cd ${srcdir}
	mkdir -p ${pkgdir}/usr/share/apps/ksplash/Themes
	cp -r OxyArch ${pkgdir}/usr/share/apps/ksplash/Themes
}
