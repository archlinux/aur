# Maintainer: Étienne Deparis <etienne@depar.is>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Shawn Dellysse <sdellysse@radford.edu>

pkgname=bluecurve-icon-theme
pkgver=8.0.2
_rhpkgrel=11
_rhpkgver=21
pkgrel=11
pkgdesc="Red Hat Icons from Fedora 10"
arch=('any')
url="https://fedorahosted.org/bluecurve/"
license=('GPL')
groups=('redhat-artwork')
optdepends=(
  'gnome-icon-theme: for inheriting missing icons'
)

source=("ftp://rpmfind.net/linux/fedora/linux/releases/${_rhpkgver}/Everything/x86_64/os/Packages/b/bluecurve-icon-theme-${pkgver}-${_rhpkgrel}.fc${_rhpkgver}.noarch.rpm")
sha256sums=('90ecc04a23776931158774b432df93102d99ca5f0509a75e3695cb0a502c5d91')

package() {
  cp -R "$srcdir/usr" "$pkgdir"
}
