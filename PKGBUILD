# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>
# Contributor: Marco Steiger <marco (at) steiger (dot) online>
pkgname=buffalo-bin
pkgver=0.16.23
pkgrel=1
pkgdesc='A Go web development eco-system, designed to make your project easier.'
arch=('x86_64')
url="https://github.com/gobuffalo/buffalo/"
license=('MIT')
makedepends=('tar')
depends=('go>=1.13')
optdepends=('nodejs>=8: frontend'
            'npm: asset pipeline'
            'yarn: frontend dependency management'
            'gcc: for building sqlite3 support'
            'git: for VCS support')
conflicts=('buffalo-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gobuffalo/buffalo/releases/download/v${pkgver}/buffalo_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('603258ee05ab9b8489bd93f41222132cb0a1ce9c6784c3f066b39af6137daffa')

package() {
    install -Dm755 "${srcdir}/buffalo" "${pkgdir}/usr/bin/buffalo"
}
