# Maintainer: Tom Swartz <tom@tswartz.net>
pkgname=credhub-cli
_pkgname=credhub
pkgver=2.9.39
pkgrel=1
pkgdesc="CredHub CLI provides a command line interface to interact with CredHub servers"
arch=('any')
url="https://github.com/cloudfoundry/credhub-cli/releases/"
license=('apache')
source=("https://github.com/cloudfoundry/credhub-cli/releases/download/$pkgver/$_pkgname-linux-amd64-$pkgver.tgz")
noextract=()
sha256sums=('15cb96ea05a85020c83ef81d7a72f7da43a8671f8e60ed3f7ddc6660a0c83b2e')

package() {
        install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
