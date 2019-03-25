# Maintainer: Tom Swartz <tom@tswartz.net>
pkgname=credhub-cli
_pkgname=credhub
pkgver=2.3.0
pkgrel=1
pkgdesc="CredHub CLI provides a command line interface to interact with CredHub servers"
arch=('any')
url="https://github.com/cloudfoundry-incubator/credhub-cli/releases/"
license=('apache')
source=("https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/$pkgver/$_pkgname-linux-$pkgver.tgz")
noextract=()
sha256sums=('9018881e1e43794243b6618e675f6f5ab3ac1b2c1f303a8558c1b22e1d1f54eb')

package() {
        install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
