# Maintainer: Rábel, István <thraex dot aquator at icloud dot com>
pkgname='pass2env-git'
pkgver=1.0
pkgrel=0
pkgdesc='Creates or removes environment variables from Password Store'
arch=(any)
license=('Unlicense')
depends=(pass bash sed)
source=('git+https://gitlab.com/aquator/pass2env.git#tag=3e0a8a0769e71de2ce1bfa08da4a0b75243ff478')
md5sums=('4d56a2863f55a2aa5cd8926e23e28d73')

package() {
	cd ${pkgname%-git}
	install -Dm 755 pass2env -t "$pkgdir"/usr/bin
	install -Dm 644 pass2env-completion -T "$pkgdir"/usr/share/bash-completion/completions/pass2env
}
