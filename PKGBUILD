# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Keno Goertz <keno@goertz-berlin.com>
pkgname=lightdm-webkit2-theme-arch
pkgver=0.1
pkgrel=1
pkgdesc="Minimal theme for lightdm-webkit2-greeter using humorous wallpapers about Arch Linux."
arch=('any')
url="https://github.com/kenogo/lightdm-webkit2-theme-arch"
license=('WTFPL')
depends=('lightdm-webkit2-greeter')
makedepends=('git')
source=("${pkgname}::git+https://github.com/kenogo/${pkgname}.git")
md5sums=('SKIP')

package() {
    install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/arch"
    cp -r "$srcdir/${pkgname}/"* "$pkgdir/usr/share/lightdm-webkit/themes/arch"
}
