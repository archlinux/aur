pkgname=angular-cli-bash-completion
pkgdesc="Bash completion for Angular CLI"
pkgver=1.0
pkgrel=1
arch=('any')
depends=('bash-completion')

package() {
	cd $srcdir
	ng completion --bash > ${srcdir}/bash_completion.bash
	install -m 0644 -D "${srcdir}/bash_completion.bash" "${pkgdir}"/usr/share/bash-completion/completions/ng
}
