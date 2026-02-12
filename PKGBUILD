# Maintainer: crymfox <sameur.bh@gmail.com>
pkgname=secrets-cli-bin
pkgver=0.0.15
pkgrel=1
pkgdesc="CLI tool to manage project secrets locally and securely using GPG + pass"
arch=('x86_64')
url="https://github.com/NuevaNext/secrets-cli"
license=('MIT')
depends=('gnupg' 'pass')
provides=('secrets-cli')
conflicts=('secrets-cli')

source_x86_64=("secrets-cli-${pkgver}::https://github.com/NuevaNext/secrets-cli/releases/download/v${pkgver}/secrets-cli-linux-amd64")

sha256sums_x86_64=('3882532fcf260108dfbcda9b2a389f7a1a14b23ed12b2e95bbea57c039d9ff8c')

package() {
  install -Dm755 "${srcdir}/secrets-cli-${pkgver}" "${pkgdir}/usr/bin/secrets-cli"
}
