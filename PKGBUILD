# Maintainer: daltomi

pkgname='deskshot.sh'
pkgver=1.3
pkgrel=1
_gittag="v${pkgver}"

pkgdesc="Take a screenshot of the selected desktops and merge them into a single image."

arch=('any')

url="https://github.com/daltomi/${pkgname}"

license=('GPL3')

depends=('xdotool' 'sed' 'scrot' 'imagemagick' 'bash' 'coreutils')

source=("git+${url}.git?signed#tag=${_gittag}")

sha256sums=('SKIP')

validpgpkeys=('95BDE4BDE7F657BC298DD722EA8BDDF776B54DD1')

package() {
  install -Dm755 "$pkgname/deskshot.sh" "$pkgdir/usr/bin/deskshot.sh"
}
