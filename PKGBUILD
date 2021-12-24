# Maintainer: Mats Bakke <teknsl.mbk at protonmail dot com>

pkgname=('alacritty-xwayland')
pkgdesc='workaround for #4739'
pkgver='1.0.0'
pkgrel='1'
arch=('any')
depends=('alacritty')
makedepends=('desktop-file-utils')
source=('alacritty-xwayland.desktop')
md5sums=('cfcf9cdd3683ddfc3e9798b3465595e0')

package() {
	desktop-file-install --dir="$pkgdir/usr/share/applications" alacritty-xwayland.desktop
}

