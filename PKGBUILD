# Maintainer: Jorengarenar

pkgname=quiterss-backup
epoch=1
pkgver=0.6.1
pkgrel=1
pkgdesc='Simple script, which provides better backup options for QuiteRSS, than the build-in one'
arch=('any')
url='https://joren.ga'
license=('MIT')
source=("${pkgname}::git+https://github.com/Jorengarenar/quiterss-backup.git")
sha512sums=(SKIP)

package() {
    cd "$srcdir/$pkgname"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 $pkgname "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
	install -Dm644 bash_completion "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}
