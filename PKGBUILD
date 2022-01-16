# Maintainer: Cara Salter <cara at devcara dot com>
# Contributor: theguy147 <yakamoz147 at protonmail dot com>
# Contributor: Marco Steiger <marco at steiger dot online>
pkgname=buffalo-bin
pkgver=0.18.2
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
sha256sums=('aad0b2140f679778d7a96ff67862998d2c9955d0d8e5cb088dafffd33eef7a6d')
validpgpkeys=()

package() {
	cd $srcdir
 	install -Dm755 "${srcdir}/buffalo" "${pkgdir}/usr/local/bin/buffalo"	
}
