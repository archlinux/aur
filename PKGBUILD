# Maintainer: Kedap <dxhqezk@hi2.in>
# Author: th3_pr3d4t0r <orbko90781@is35.com>
pkgname=beef-cerberus-git
_pkgname=beef-cerberus
_reponame=beef-for-cerberus
pkgver=1.0_beta
pkgrel=1
pkgdesc="Herramienta para automatizar BeEF fuera de LAN!"
arch=('x86_64')
url="https://github.com/tony23x/beef-for-cerberus"
license=('GPL')
depends=('curl' 'php' 'python3' 'wget' 'openssh' 'unzip' 'ngrok')
makedepends=('git')
optdepends=('BeEF: Cerberus es la implementación para este')
source=("git+https://github.com/tony23x/$_reponame.git")
md5sums=('SKIP')

package() {
	cd $_reponame
	install -Dm 755 "$_pkgname" "${pkgdir}/usr/bin/${_pkgname}"
	cd ..
	mkdir -p "${pkgdir}/opt/${_reponame}"
	cp -r "${_reponame}" "${pkgdir}/opt/"
}
