# Maintainer: Max <pearde@proton.me>
pkgname=gitfetch-bin
pkgver=1.0.0 
pkgrel=1
pkgdesc="A simple command-line tool to fetch and display your GitHub statistics (C# port)"
arch=('x86_64')
url="https://github.com/BeanDx/GitFetchCSharp"
license=('MIT')
provides=("gitfetch")
conflicts=("gitfetch")
source_x86_64=("$pkgname-$pkgver-linux-x64::https://github.com/BeanDx/GitFetchCSharp/releases/download/v$pkgver/gitfetch-linux-x64")
sha256sums_x86_64=('ee384b713548755f59f548f0d87ff9a39cc45af5089903464bd8028385db2be2')

package() {
  cd "$srcdir"
  install -Dm755 "$pkgname-$pkgver-linux-x64" "$pkgdir/usr/bin/gitfetch"
}