# Maintainer: daltomi

pkgname='deskshot.sh'
pkgver=1.0
pkgrel=1
_gitname=deskshot
_gittag="v${pkgver}"

pkgdesc="Screenshot of virtual desktops"

arch=('x86_64')

url="https://github.com/daltomi/${_gitname}"

license=('GPL3')

depends=('xdotool' 'sed' 'scrot' 'imagemagick' 'bash' 'coreutils')

source=("git+${url}.git?signed#tag=${_gittag}")

sha256sums=('SKIP')

validpgpkeys=('95BDE4BDE7F657BC298DD722EA8BDDF776B54DD1')

package() {
  install -Dm755 "$_gitname/deskshot.sh" "$pkgdir/usr/bin/deskshot.sh"
}
