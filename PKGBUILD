# Maintainer: Theo J.A. de Vries <t.j.a.devries(at)gmail(dot)com>

# for customization
_pkgname=touchpad-toggle
_ext=
_basedir=/usr/bin
# note: depends=() needs separate customization

pkgname=${_pkgname}${_ext}
pkgver=1
pkgrel=1
pkgdesc="Script to toggle the touchpad; see https://wiki.archlinux.org/index.php/Touchpad_Synaptics#Software_toggle. Use desktop environment to set keyboard shortcut."
arch=("any")
#url="https://bitbucket.org/"
license=("Apache")
groups=()
depends=("bash" "xf86-input-synaptics")
#makedepends=("git")
optdepends=()
provides=("touchpad-toggle")
conflicts=("touchpad-toggle")
#backup=()
#options=()
#install=
source=(
                  "touchpad-toggle.sh"
                )
noextract=()
#md5sums=() #generate with 'makepkg -g >> PKGBUILD'

build() {
  msg "Nothing to build really.."
}

package() {
 # cd "$srcdir/$_gitname-build"

  msg "Installing script file"
  install -m755 -d ${pkgdir}${_basedir}
  install -m655 touchpad-toggle.sh ${pkgdir}${_basedir}/touchpad-toggle.sh
}

md5sums=('b691e7dbf1c850900120624dbe40e019')
