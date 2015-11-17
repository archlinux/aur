# $Id$
# Maintainer: Theo J.A. de Vries <t.j.a.devries(at)gmail(dot)com>

# for customization
_pkgname=archupdate
_ext=
_basedir=/usr

pkgname=${_pkgname}${_ext}
pkgver=1
pkgrel=2
pkgdesc="A simple script to update archlinux using pacmatic and pacaur."
arch=('any')
url=""
license=('Apache')
depends=('bash' 'pacmatic' 'pacaur')
source=(
        https://bitbucket.org/theojadevries/archupdate-script/raw/d0e7cbe2eb329ae510e9ea99a998716e2f434c0e/archupdate.sh
        archupdate.desktop
        arch.png
        )
#md5sums=() #generate with 'makepkg -g >> PKGBUILD'

build() {
  msg "Nothing to build really.."
}

package() {
 # cd "$srcdir/$_gitname-build"

  msg "Installing script file"
  install -Dm655 "${srcdir}/archupdate.sh" "${pkgdir}${_basedir}/bin/archupdate.sh"
  install -Dm644 "${srcdir}/archupdate.desktop" "${pkgdir}/${_basedir}/share/applications/archupdate.desktop"
  install -Dm644 "${srcdir}/arch.png" "${pkgdir}/${_basedir}/share/pixmaps/archicon.png"
}
md5sums=('9647e3b024f7efafc88e771d6b31a6c7'
         '44e877b407ed393fe4e4fc4f1b2e73e3'
         'f320506b8b461536febc036e6168e77a')
md5sums=('9647e3b024f7efafc88e771d6b31a6c7'
         '9980b3d474c5ef5bd3f57c20dbeb748e'
         'f320506b8b461536febc036e6168e77a')
md5sums=('9647e3b024f7efafc88e771d6b31a6c7'
         '85870d14b854b996f3a48c66db689edb'
         'f320506b8b461536febc036e6168e77a')
