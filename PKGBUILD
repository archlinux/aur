# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: flan_suse
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

# This wallpaper collection is complementary to the
# Shimmer Project Xfce themes

pkgname=shimmer-wallpapers
_pkgname=Wallpapers
_pkgnamelong="Shimmer-Wallpapers"
pkgver=1.0
pkgrel=4
pkgdesc="Complementary wallpaper collection for the Shimmer Project Xfce themes"
arch=("any")
url=http://shimmerproject.org
license=(CCPL:by-sa-3.0)
groups=("xfce-themes-shimmer-collection")
replaces=("shimmer-wallpapers-git")
conflicts=("shimmer-wallpapers-git")
provides=("shimmer-wallpapers-git" "shimmer-wallpapers")
makedepends=("git")
optdepends=("elementary-xfce-icons: matching icon set, -git or stable"
    "xfce-theme-albatross: matching Shimmer Project Xfce theme, -git or stable"
    "xfce-theme-bluebird: matching Shimmer Project Xfce theme, -git or stablr"
    "xfce-theme-greybird: matching Shimmer Project Xfce theme, -git or stable")
source=("${_pkgnamelong}::git://github.com/shimmerproject/${_pkgname}.git#commit=ba134cbfa7130e88822f07b18c454a8791d504b8")
md5sums=('SKIP')



package() {

	mkdir -p "${pkgdir}/usr/share/backgrounds/xfce/"

	cp -r "${srcdir}/Shimmer-Wallpapers/Albatross"/*.png "${pkgdir}/usr/share/backgrounds/xfce/"
	cp "${srcdir}/Shimmer-Wallpapers/Bluebird"/*.png "${pkgdir}/usr/share/backgrounds/xfce/"
	cp "${srcdir}/Shimmer-Wallpapers/Greybird"/*.png "${pkgdir}/usr/share/backgrounds/xfce/"
}
