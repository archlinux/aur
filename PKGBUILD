
# Maintainer: Rafael Senties Martinelli <contact@rsm92.fr>

# git describe --long --tags --abbrev=7 | sed 's/^d//;s/\([^-]*-g\)/r\1/;s/-/./g'
pkgver=v3.0.0.r0.g571aab9
_commit=571aab9850da168198eb62c75662997bf0345e11
_commit_sha256=aa43e897839652bfd52cef13b45bfe17775e0baee7e7858ccae77637c67489ed

# Static content

pkgname=akbl-git
pkgrel=1
epoch=
pkgdesc="AKBL is a software to control the lights of Alienware computers (The keyboard, the logo, the speakers, etc...)."
arch=("x86_64")
url="https://codeberg.org/rsm92/akbl"
license=('GPLv3')
groups=()
depends=("systemd" "usbutils" "python" "python-pyusb" "python-pyro")
makedepends=("git")
checkdepends=()
optdepends=(
  'webkit2gtk: for the graphical interphase'
  'python-gobject: for the graphical interphase'
  'python-cairo: for the graphical interphase'
  'libayatana-appindicator: for the system try indicator'
)
provides=("akbl")
conflicts=()
replaces=()
backup=()
options=()
install=akbl.install
changelog=
source=("https://codeberg.org/rsm92/akbl/archive/${_commit}.zip")
noextract=()
sha256sums=("${_commit_sha256}")
validpgpkeys=()

package() {
	cd "akbl"
	ls -la
	cp -r ./usr "$pkgdir" 
}
