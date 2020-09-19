# Maintainer: Manish Jain <bourne.identity@hotmail.com>

pkgname=switchbashzsh
pkgver=1.0
pkgrel=1
pkgdesc="Portably switching between Bash/Zsh across BSD/Linux/Cygwin"
arch=(any)
license=('BSD')
url="https://github.com/bourne-again/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bourne-again/${pkgname}/archive/${pkgver}.tar.gz")

provides=(poshinit)
replaces=(poshinit)

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
	install -Dm644 ${pkgname}.1 "${pkgdir}"/usr/share/man/man1/${pkgname}.1
	mkdir -p /usr/share/licenses/${pkgname} 2>/dev/null
	install -Dm644 LICENSE /usr/share/licenses/${pkgname}/
}

sha256sums=('d40f28a0d21105cbd864eca182485455038221384b0cb45f049ac5c47434688e')
