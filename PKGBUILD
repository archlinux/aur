# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=trizen
pkgver=1.28
pkgrel=1
epoch=1
pkgdesc="Trizen's AUR Package Manager: A lightweight wrapper for AUR."
arch=('any')
url="https://github.com/trizen/${pkgname}"
license=('GPL3')

depends=(
         'git'
         'diffutils'
         'perl>=5.20.0'
         'perl-libwww'
         'perl-term-ui'
         'pacman'
         'perl-json'
         'perl-data-dump'
         'perl-lwp-protocol-https'
        )

optdepends=(
            'perl-json-xs: faster JSON deserialization'
            'perl-term-readline-gnu: for better STDIN support'
           )

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7bd9ea841f1378009e6e5699e6339ea6c076469aa62abd07b2fb513e18b145ac')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D $pkgname "$pkgdir/usr/bin/$pkgname"
}
