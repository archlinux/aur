# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>
# Contributor: Marco Steiger <marco (at) steiger (dot) online>
pkgname=buffalo-bin
pkgver=0.16.9
pkgrel=2
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
sha256sums=('f716b4d818bdb6e5af1a0071a9b99ee2db093908bd45d4bfe02077be433c35f6')

package() {
    install -Dm755 "${srcdir}/buffalo" "${pkgdir}/usr/bin/buffalo"
}
