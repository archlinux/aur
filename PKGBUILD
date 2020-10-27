# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>
# Contributor: Marco Steiger <marco (at) steiger (dot) online>
pkgname=buffalo-bin
pkgver=0.16.16
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
sha256sums=('a39635dc8a37f3f9b2d9d48d036a92e7fa657db9990a3a68325bc166aaa2644a')

package() {
    install -Dm755 "${srcdir}/buffalo" "${pkgdir}/usr/bin/buffalo"
}
