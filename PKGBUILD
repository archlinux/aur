# Maintainer: Shalygin Konstantin (kostya@opentech.ru)

pkgname='arcconf'
pkgver='1.07'
pkgrel='21229'
pkgdesc='Adaptec command line interface utility'
arch=('i686' 'x86_64')
url=('http://adaptec.com/')
license=('freeware')
sha256sums=('b9ec025ed6e7167551dc2a034b39999f5b43a3a6544e3e8989f75a89dd99c7b3')
source=("http://download.adaptec.com/raid/storage_manager/arcconf_v1_7_${pkgrel}.zip")

if [[ "$CARCH" == "i686" ]]; then
package() {
  pushd "$srcdir"
  install -Dm755 "linux/cmdline/arcconf" "$pkgdir/usr/bin/arcconf"
  popd
}
fi

if [[ "$CARCH" == "x86_64" ]]; then
package() {
  pushd "$srcdir"
  install -Dm755 "linux_x64/cmdline/arcconf" "$pkgdir/usr/bin/arcconf"
  popd
}
fi
