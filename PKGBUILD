# Maintainer: GreenRaccoon23 <GreenRaccoon a t gmail d o t com>

# NOTE: Please install this package instead of 'archdroid-icon-theme-git'.
#
# Both packages provide the same version, but this one installs faster.
#
# If this package fails to download, try 'archdroid-icon-theme-git' instead.
#
# Please report bugs in the AUR comments or here:
# https://github.com/GreenRaccoon23/archdroid-icon-theme/issues
#
# Please submit suggestions, ideas, or requests through the link above.
# I would appreciate your feedback and am open to requests.

pkgname=archdroid-icon-theme
pkgver=r131.5143e7847
pkgrel=2
pkgdesc="Port of Android 5/6 (Lollipop/Marshmallow)'s material design icons to Arch."
arch=('any')
url="https://github.com/GreenRaccoon23/${pkgname}"
license=('GPL3')
depends=('ttf-roboto')
makedepends=('intltool' 'librsvg' 'gtk-update-icon-cache')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
options=('!strip')
install="${pkgname}.install"
_commit="5143e7847d61ee4df177616ecae5e4b16bfb9d09"
# To revert to an older version, use an archive from here:
#   https://github.com/GreenRaccoon23/archdroid-icon-theme/raw/master/bak
source=("https://raw.githubusercontent.com/GreenRaccoon23/${pkgname}/${_commit}/${pkgname}.tar.xz")
md5sums=("d64b070d1731eb4c57d4bc260257273e")

package() {
  msg2 "Installing ${pkgname}...";
  cd ${pkgname};
  install -dm 755 "${pkgdir}"/usr/share/icons;
  cp -drf --no-preserve='ownership' . "${pkgdir}"/usr/share/icons/;
};
