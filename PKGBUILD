# Maintainer: Takuya Tominaga <takuya.tominaga.public at gmail dot com>

_pkgname=digdag
pkgname=$_pkgname-bin
pkgver=0.9.16
pkgrel=1
pkgdesc="Workload Automation System."
arch=('i686' 'x86_64')
url="https://github.com/treasure-data/digdag"
license=('Apache')
depends=('jdk8-openjdk' 'nodejs')

_dl_url=https://dl.digdag.io
source_i686=("$_dl_url/$_pkgname-$pkgver"
)
source_x86_64=("$_dl_url/$_pkgname-$pkgver"
)
md5sums_i686=('SKIP'
)
md5sums_x86_64=('SKIP'
)



package() {
  _source_arch="32"
  [ "$CARCH" = "x86_64" ] && _source_arch="64"

  install -Dm755 "$srcdir/$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
}

