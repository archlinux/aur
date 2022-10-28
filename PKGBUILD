# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=gitea-github-theme
pkgver=3.0.0
pkgrel=1
pkgdesc='GitHub-based light and dark themes for Gitea including an automatic theme switch option'
arch=('any')
url='https://codeberg.org/pat-s/gitea-github-theme'
license=('MIT')
depends=('gitea')
source=("https://codeberg.org/pat-s/gitea-github-theme/archive/v3.0.0.tar.gz")
sha256sums=('ea6a3f90e1407375b0960ddb0d5880b781584a37c182cfc2759a31c0d5f93fda')

package() {
    install -d -o gitea -g gitea "${pkgdir}/var/lib/gitea"
    install -d -o gitea -g gitea "${pkgdir}/var/lib/gitea/custom"
    install -d -o gitea -g gitea "${pkgdir}/var/lib/gitea/custom/public"
    install -d -o gitea -g gitea "${pkgdir}/var/lib/gitea/custom/public/css"
    install -D -m644 -o gitea -g gitea ${srcdir}/${pkgname}/*css "${pkgdir}/var/lib/gitea/custom/public/css/"
}
