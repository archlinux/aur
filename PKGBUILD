# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=maxim-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Simple CLI for interacting with local databases"
arch=('x86_64' 'aarch64')
url="https://github.com/ASHUTOSH-SWAIN-GIT/maxim"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/maxim_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/maxim_Linux_arm64.tar.gz")
sha256sums_x86_64=('ab1ee91afabbd22798b230450801388a5c40157727af2fcab71af1eb4d53a883')
sha256sums_aarch64=('bdfc336540d62f2ddf8d2094d7aebdd10a1358b292caff808fd42aefd359dfaa')

package() {
  install -Dm755 "maxim" "${pkgdir}/usr/bin/maxim"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
