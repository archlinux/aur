# Maintainer: MostlyK <bruvistrue93@gmail.com>
pkgname=gemini
pkgver=0.1.9
pkgrel=1
pkgdesc="Gemini CLI: A command-line AI workflow tool by Google"
arch=('any')
url="https://github.com/google-gemini/gemini-cli"
license=('Apache')
depends=('nodejs' 'npm')
makedepends=()
source=()
md5sums=()

package() {
  npm install -g --prefix "$pkgdir/usr" @google/gemini-cli@${pkgver}
  # symlink is already created by npm
}

# vim:set ts=2 sw=2 et:
