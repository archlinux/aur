# Maintainer: Jonatan Bravo <zephrax@gmail.com>
pkgname=envconsul
pkgver=0.6.2
pkgrel=1
epoch=
pkgdesc="Launch a subprocess with environment variables using data from @HashiCorp Consul and Vault."
arch=("x86_64")
url="https://github.com/hashicorp/envconsul"
license=('MPL-2.0')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("envconsul")
source=("https://releases.hashicorp.com/${pkgname}/0.6.2/envconsul_${pkgver}_linux_amd64.tgz")
md5sums=("490ff5f4981a477cf9767a71492c467e")
validpgpkeys=()

package() {
	cd "${srcdir}/"
	mkdir -p "${pkgdir}/usr/local/bin"
	install -m755 "${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
	chmod +x ${pkgdir}/usr/local/bin/${pkgname}
}
