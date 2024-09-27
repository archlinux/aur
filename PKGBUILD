# Maintainer: Rábel, István <thraex dot aquator at icloud dot com>
pkgname='pass2env-git'
pkgver=1.0
pkgrel=0
pkgdesc='Creates or removes environment variables from Password Store'
arch=(any)
license=('Unlicense')
depends=(pass bash sed)
source=('git+https://gitlab.com/aquator/pass2env.git?signed#commit=34fcc010d4e3dee7ee6bc4e081c489f8dd91b994')
md5sums=('b997b1aee3734d0a83b78fee7cce3285')
validgpgkeys=('B1F16E034EEF474477662AB6F7342E073FC5AFB0')

package() {
	cd ${pkgname%-git}
	install -Dm 755 pass2env -t "$pkgdir"/usr/bin
	install -Dm 644 pass2env-completion -T "$pkgdir"/usr/share/bash-completion/completions/pass2env
}
