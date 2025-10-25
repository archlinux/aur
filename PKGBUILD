# Package build descriptor for Arch Linux package deploying Roaming Profiles for Linux.

# Maintainer: Rainer Meier <rainer.meier@gmail.com>
pkgname=roaming-profiles
pkgver=0.3.4
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
	'gawk'
	'coreutils'
	'sed'
	'pam'
	'systemd'
	'pam-krb5'
	'kstart')
makedepend=('git')
source=("${pkgname}-${pkgver}.tar.bz2::${url}/-/archive/${pkgver}/linux-roaming-profiles-${pkgver}.tar.bz2")
sha512sums=(a4264e2363f761d6ac1e619499da4ff45acf64d4aed2971b1829a02058f4254347b7589036e0b314aab776d1d3686d1e09a257001c3db6e96787bcdfe8922cf9)
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
