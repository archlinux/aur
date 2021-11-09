# Maintainer: Guillaume Boehm <guillaumeboehm@hotmail.fr>
pkgname=lightdm-webkit2-theme-arch
pkgver=0.1
pkgrel=1
epoch=1
pkgdesc="Minimal theme for lightdm-webkit2-greeter using humorous wallpapers about Arch Linux."
arch=('any')
url="https://gitlab.com/kenogo/lightdm-webkit2-theme-arch"
license=('WTFPL')
depends=('lightdm-webkit2-greeter')
makedepends=('git')
source=("${pkgname}::git+https://gitlab.com/kenogo/${pkgname}.git")
md5sums=('SKIP')

package() {
    install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/arch"
    cp -r "$srcdir/${pkgname}/"* "$pkgdir/usr/share/lightdm-webkit/themes/arch"
}
