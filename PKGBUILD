# Maintainer: shane4ster <archlinux at sl dot forster dot dev>
# Contributor: Cara Salter <cara at devcara dot com>
# Contributor: theguy147 <yakamoz147 at protonmail dot com>
# Contributor: Marco Steiger <marco at steiger dot online>
pkgname=buffalo-bin
pkgver=0.18.5
pkgrel=1
epoch=
pkgdesc="A Go web development ecosystem, designed to make your project easier"
arch=('x86_64')
url="https://gobuffalo.io"
license=('MIT')
groups=()
depends=('go>=1.16')
makedepends=()
checkdepends=()
optdepends=('nodejs>=8: frontend support'
	'npm: asset pipeline'
	'yarn: frontend dependency management'
	'gcc: for sqlite3 support'
	'git: VCS support')
provides=()
conflicts=("buffalo-git")
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/gobuffalo/cli/releases/download/v$pkgver/buffalo_${pkgver}_Linux_x86_64.tar.gz")
noextract=()
sha256sums=('ee7da7486a10c3c2de9e5283d88962ca123d9e4c5c77fa76860e6e5502ef9c5c')
validpgpkeys=()

package() {
	cd $srcdir
	install -Dm755 "${srcdir}/buffalo" "${pkgdir}/usr/local/bin/buffalo"
}
