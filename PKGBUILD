# Maintainer: Tom Swartz <tom@tswartz.net>
pkgname=credhub-cli
_pkgname=credhub
pkgver=2.8.0
pkgrel=1
pkgdesc="CredHub CLI provides a command line interface to interact with CredHub servers"
arch=('any')
url="https://github.com/cloudfoundry-incubator/credhub-cli/releases/"
license=('apache')
source=("https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/$pkgver/$_pkgname-linux-$pkgver.tgz")
noextract=()
sha256sums=('dcd4f05eaaea6f356d8ffcbf2692c465b272fcdf773266589f4bc4a891cbe4e4')

package() {
        install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
