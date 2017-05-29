pkgname=pachook-rstudio-ligatures
pkgver=1.0.0
pkgrel=1
pkgdesc='A pacman hook that patches RStudio to utilize ligatures'
arch=(any)
license=(GPL3)
source=(rstudio-ligatures.hook)
sha256sums=('f75fe234dacb9844ddc0172dd2c792bd3a846161ead521b54922e09c425e40f0')

package() {
	install -Dm644 rstudio-ligatures.hook "$pkgdir/usr/share/libalpm/hooks/rstudio-ligatures.hook"
}
