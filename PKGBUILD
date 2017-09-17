# Maintainer: Takuya Tominaga <takuya.tominaga.public at gmail dot com>

_pkgname=embulk
pkgname=$_pkgname-bin
pkgver=0.8.33
pkgrel=2
pkgdesc="Pluggable Bulk Data Loader."
arch=('i686' 'x86_64')
url="https://github.com/treasure-data/digdag"
license=('Apache')
depends=('jdk8-openjdk' 'nodejs')

_dl_url=https://dl.bintray.com/embulk/maven
source_i686=("$_dl_url/$_pkgname-$pkgver.jar"
)
source_x86_64=("$_dl_url/$_pkgname-$pkgver.jar"
)
md5sums_i686=('SKIP'
)
md5sums_x86_64=('SKIP'
)



package() {
  _source_arch="32"
  [ "$CARCH" = "x86_64" ] && _source_arch="64"

  install -Dm755 "$srcdir/$_pkgname-$pkgver.jar" "$pkgdir/usr/bin/$_pkgname"
}

