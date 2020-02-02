# Maintainer: Konstantin Ivanov <kostyarin.ivanov@gmail.com>

pkgname=('xfwm4-z4-dark-theme')
git_name=z4
git_tag=v1.2
pkgver=1.2
pkgrel=1
system_share_themes='usr/share/themes'
pkgdesc="xfwm4 dark theme"
arch=('any')
makedepends=()
url="https://github.com/logrusorgru/z4"
license=('GPL2')
source=("https://github.com/logrusorgru/z4/archive/$git_tag.tar.gz")
sha256sums=('079fea7f5a05714e393f04d6c0a68018c35dbd160f7c5c340b5eeeff31bc8e22')

package() {
	cd "${srcdir}/$git_name-$pkgver"
	install -d "$pkgdir/$system_share_themes/$git_name/xfwm4"
	install -D xfwm4/* "$pkgdir/$system_share_themes/$git_name/xfwm4"
}
