# Maintainer: Nimble Bun Works <contact@nimblebun.works>

pkgname=tsc-ls
pkgver=1.0.7
pkgrel=1
pkgdesc='Language server for the TSC scripting format.'
arch=(x86_64)
url='https://github.com/nimblebun/tsc-language-server'
license=('MIT')
provides=('tsc-ls')
conflicts=('tsc-ls')
source=("$url/releases/download/v$pkgver/tsc-ls_${pkgver}_linux_amd64")
sha256sums=('7663e705d4bcea64e181bb237791d113f9b93a5cb05de84538e6d64390fc8614')

package() {
  install -Dm755 "tsc-ls_${pkgver}_linux_amd64" "$pkgdir/usr/bin/tsc-ls"
}

