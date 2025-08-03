# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.42.0
pkgrel=1
pkgdesc="AWS cloud account cleaning tool"
url="https://github.com/gruntwork-io/${_base}"
arch=(x86_64 i386 aarch64)
license=(MIT)
conflicts=("${_base}")
provides=("${_base}")
source_x86_64=(${_base}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_base}_linux_amd64)
source_i386=(${_base}-${pkgver}-i386::${url}/releases/download/v${pkgver}/${_base}_linux_386)
source_aarch64=(${_base}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_base}_linux_arm64)
sha512sums_x86_64=('b9040c4711aed634568395161eb63666281842e5b426ace69f0ab7b561f3bfb83f333db323d965a03e66562efeb562d4b31066a4fc66e8817e1c1fd9a94494ac')
sha512sums_i386=('7c1b29a8ea2a59fc6265bc76a2855e5fbdfbf38ffe180e635ec085a5be771b9f45c9959c1287b2738971a72d65004a62ec8be61117f3233cbdfa2905d57b9a34')
sha512sums_aarch64=('3e7f9648b74dc4489ca00218abed0362e2562857a8bf8288f0e77bc8bd5d2a381dc438537b70b10d0917061157c49e80cd3388cd25bb81b0d8cbda8f365a0e09')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
