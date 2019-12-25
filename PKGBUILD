# Maintainer: Cédric FARINAZZO <cedric.farinazzo@gmail.com>

pkgname=i3lock-fancy-multimonitor
pkgver=0.1
pkgrel=1
pkgdesc="Blurry lock screen for i3lock with multimonitor support"
arch=(any)
url="https://github.com/guimeira/i3lock-fancy-multimonitor"
license=('MIT')
depends=('bash' 'imagemagick' 'i3lock' 'scrot')
makedepends=('git')
provides=('i3lock-fancy-multimonitor')
source=("git+https://github.com/guimeira/${pkgname}.git")
md5sums=('SKIP')


package() {
    install -Dm755 ${srcdir}/${pkgname}/lock ${pkgdir}/usr/bin/i3lock-fancy-multimonitor
}

