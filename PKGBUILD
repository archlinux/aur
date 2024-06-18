# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=helm-ls-bin
pkgver=0.0.17
pkgrel=1
pkgdesc='Language server for Helm'
arch=(x86_64)
url="https://github.com/mrjosh/helm-ls"
license=(MIT)
_binname=helm_ls
source_x86_64=("$_binname-$pkgver::$url/releases/download/v$pkgver/helm_ls_linux_amd64")
source=("https://raw.githubusercontent.com/mrjosh/helm-ls/v$pkgver/LICENSE")
sha256sums_x86_64=('1fd40d5f971c7b58435e1f5177e5300a5893c6df2603747f35bdb4baad4a275f')
sha256sums=('69fcf81ef258076793149979fba61e50f6fc64273c8192472ba7ab18f1616d71')
options=('!strip')

package() {
  cd "$srcdir"
  install -Dm755 $_binname-$pkgver "$pkgdir/usr/bin/$_binname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
