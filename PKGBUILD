# Maintainer: Rábel, István <thraex dot aquator at icloud dot com>
pkgname='pass2env-git'
pkgver=1.0
pkgrel=1
pkgdesc='Creates or removes environment variables from Password Store'
arch=(any)
license=('Unlicense')
depends=(pass bash sed)
source=('git+https://gitlab.com/aquator/pass2env.git?signed#commit=7a72952fe35950c285455aecdeecf599dfdeb083')
md5sums=('88669a1b48de1b1827b6ab7370b2db86')
validgpgkeys=('B1F16E034EEF474477662AB6F7342E073FC5AFB0')

package() {
	cd ${pkgname%-git}
	install -Dm 755 pass2env -t "$pkgdir"/usr/bin
	install -Dm 644 pass2env-completion -T "$pkgdir"/usr/share/bash-completion/completions/pass2env
}
