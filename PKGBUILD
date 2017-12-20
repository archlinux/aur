# Maintainer: Trizen <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d>

pkgname=trizen
pkgver=1.29
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
sha256sums=('88f30bc59c0c1b4327a18b18e83d1398673ec84290a1097cc78d7b1c0dadc5be')

package() {
  cd "$pkgname-$pkgver"
  install -m 755 -D $pkgname "$pkgdir/usr/bin/$pkgname"
}
