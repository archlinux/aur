# Maintainer: Tom Swartz <tom@tswartz.net>
pkgname=credhub-cli
_pkgname=credhub
pkgver=2.4.0
pkgrel=1
pkgdesc="CredHub CLI provides a command line interface to interact with CredHub servers"
arch=('any')
url="https://github.com/cloudfoundry-incubator/credhub-cli/releases/"
license=('apache')
source=("https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/$pkgver/$_pkgname-linux-$pkgver.tgz")
noextract=()
sha256sums=('73edaf1ee47323c4f0aa455bcc17303a73c0cf2a6d9156542f1f6b7b1b1aa3db')

package() {
        install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
