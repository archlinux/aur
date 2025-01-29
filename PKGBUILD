# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>

pkgname=replicated-bin
_pkgname="${pkgname%-bin}"
pkgver=0.91.0
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
b2sums=('a4f150b54f09a3acaf8161a7db2240f5dc9878c4e89b5fd55848b82b0031620296420c17060cbf65ce6d503dc31c525fd51277c69840540511e54a07ecf5c489')

package() {
	install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
}
