# Package build descriptor for Arch Linux package deploying Roaming Profiles for Linux.

# Maintainer: Rainer Meier <rainer.meier@gmail.com>
pkgname=roaming-profiles
pkgver=0.2.0
pkgrel=1
# epoch=
pkgdesc="Roaming Profiles for Linux environments."
arch=(any)
url="https://gitlab.com/SkyBeam/linux-roaming-profiles"
license=('0BSD')
# groups=()
depends=('gvfs-smb'
	'rsync'
	'bash'
	'sed'
	'pam'
	'systemd')
makedepend=('git')
source=("${pkgname}-${pkgver}.tar.bz2::${url}/-/archive/${pkgver}/linux-roaming-profiles-${pkgver}.tar.bz2")
sha512sums=(8cfd19e216dd7b5e12c40617438107fef4681c725ee62e13e21dc16c150261883f3471f131dc2160518a5b623cc9860ff742b6d36c56596466430e2fef4a0201)
# checkdepends=()
# optdepends=()
# provides=()
# conflicts=()
# replaces=()
backup=('etc/roaming-profiles/roaming-profiles.conf'
	'etc/roaming-profiles/profile-filter')
# options=()
install=.INSTALL
# changelog=
# source=()
# source=('src')
noextract=()
validpgpkeys=()

# prepare() {
# }

# build() {
# }

# check() {
# }

package() {
	cd "${srcdir}/linux-roaming-profiles-${pkgver}"
	cp -pR "${srcdir}/linux-roaming-profiles-${pkgver}/src"/* "${pkgdir}/"
}

# pkgver() {
	# set -o pipefail
	# Use last annotated tag created  usiong 'git tag -a "1.0.0" -m "My version 1.0.0"'.
	# git describe --long --abbrev=7 2>/dev/null | sed 's/^[^0-9]*//;s/\([^-]*\)/\1/;s/-/./g' ||
	# printf "0.1.%s" "$(git rev-list --count HEAD)"
# }
