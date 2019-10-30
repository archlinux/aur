# Maintainer: Tom Swartz <tom@tswartz.net>
pkgname=credhub-cli
_pkgname=credhub
pkgver=2.6.0
pkgrel=1
pkgdesc="CredHub CLI provides a command line interface to interact with CredHub servers"
arch=('any')
url="https://github.com/cloudfoundry-incubator/credhub-cli/releases/"
license=('apache')
source=("https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/$pkgver/$_pkgname-linux-$pkgver.tgz")
noextract=()
sha256sums=('14788b0b6814c51f8fd0ad0673b6cf96e7891af98120eedb642c9ae8460c4d63')

package() {
        install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
