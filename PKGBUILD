# Maintainer: Cara Salter <cara at devcara dot com>
# Contributor: theguy147 <yakamoz147 at protonmail dot com>
# Contributor: Marco Steiger <marco at steiger dot online>
pkgname=buffalo-bin
pkgver=0.17.7
pkgrel=1
epoch=
pkgdesc="A Go web development ecosystem, designed to make your project easier"
arch=('x86_64')
url="https://gobuffalo.io"
license=('MIT')
groups=()
depends=('go>=1.13')
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
sha256sums=('4c16bde030a6d1c1c44bd398ac64a2496a497db12d43feae1b9361d8edc4fabe')
validpgpkeys=()

package() {
	cd $srcdir
 	install -Dm755 "${srcdir}/buffalo" "${pkgdir}/usr/local/bin/buffalo"	
}
