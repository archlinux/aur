# Maintainer: heapifyman <heapifyman@gmail.com>
pkgname=maven-completions
pkgver=0.0.1
pkgrel=1
pkgdesc="Bash completion script for maven"
arch=('any')
url="https://github.com/juven/maven-bash-completion"
license=('unknown')
depends=('bash-completion')
source=("https://raw.githubusercontent.com/juven/maven-bash-completion/03b9f006ddffbe4f6e3913dcf5dab5039822893c/bash_completion.bash")
sha1sums=('ec31a5cdbe9eb061e4158162552f9678c5c083af')

package() {
	cd ${srcdir}
	install -m 0644 -D "${srcdir}"/bash_completion.bash "${pkgdir}"/usr/share/bash-completion/completions/maven
}
