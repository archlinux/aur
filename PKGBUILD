# Maintainer: Jorengarenar

pkgname=quiterss-backup-git
_pkgname=quiterss-backup
pkgver=0.7.0
pkgrel=1
pkgdesc='Simple script, which provides more convenient backup options for QuiteRSS'
arch=('any')
url='https://joren.ga'
license=('MIT')
source=("${_pkgname}::git+https://github.com/Jorengarenar/quiterss-backup.git")
sha512sums=(SKIP)

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 $_pkgname "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
	install -Dm644 bash_completion "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
}
