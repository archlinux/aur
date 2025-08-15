# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.111.0
pkgrel=1
pkgdesc='CLI for interacting with the Replicated Vendor API'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url="https://github.com/${_pkgname}hq/$_pkgname"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_${_goos}_${_goarch}.tar.gz")
b2sums=('77a0fea4b198627ff7a297b5d8f78652ceb284628a70acecc4c82442a44eb8ed793b3e65a38920b320eaef3dfe49fe600a48b68a32ab42289dddf69af44bd793')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
