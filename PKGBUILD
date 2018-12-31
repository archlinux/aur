# Maintainer: Tom Swartz <tom@tswartz.net>
pkgname=credhub-cli
_pkgname=credhub
pkgver=2.2.0
pkgrel=1
pkgdesc="CredHub CLI provides a command line interface to interact with CredHub servers"
arch=('any')
url="https://github.com/cloudfoundry-incubator/credhub-cli/releases/"
license=('apache')
source=("https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/$pkgver/$_pkgname-linux-$pkgver.tgz")
noextract=()
md5sums=('116a425f760a2ff8cb30a4529de3fcdd')

package() {
        install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
