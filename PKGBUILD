# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="gws"
pkgver="0.1.10"
pkgrel="1"
pkgdesc="Colorful KISS helper for git workspaces"
url="https://github.com/StreakyCobra/gws"
license=('MIT')
arch=('any')
depends=('bash>4.0' 'git')
changelog="ChangeLog"
source=("https://github.com/StreakyCobra/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('f7b76df55789db8bac94edd34bda7a0f')
sha256sums=('816592f3fec8c437ba96d17dbbfa911d88d1fa70071d3d127efc64f73551f747')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    install -D -m755 'src/gws' "${pkgdir}/usr/bin/${pkgname}"
    install -D -m755 'completions/zsh' "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
    install -D -m755 'completions/bash' "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
}

# vim:set ts=4 sw=4 et:
