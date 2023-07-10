# Maintainer: Areskul <areskul@areskul.com>
pkgname="pipelight"
pkgrel=1
pkgver=0.6.2
pkgdesc="A Rust based quick automation tool"
arch=("any")
url=https://packages.pipelight.dev/$pkgname-$pkgver-$pkgrel-any.pkg.tar.zst
license=('GPL2')
depends=(deno)
makedepends=(git make cargo)
provides=("pipelight")
conflicts=("pipelight-git")
source=($url)
md5sums=('SKIP') #autofill using updpkgsums

pre-install() {

  mkdir -p /var/log/pipelight
  #cp pipelight.bash /usr/share/bash-completion/completions/pipelight
  #cp _pipelight /usr/share/zsh/site-functions/
}

url() {
  https://packages.pipelight.dev/$pkgname-$pkgver-$pkgrel-any.pkg.tar.zst
}
