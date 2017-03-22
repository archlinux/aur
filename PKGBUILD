pkgname=netctl-eduroam
pkgver=0.5
pkgrel=1
pkgdesc='Example netctl profile for eduroam'
arch=(i686 x86_64)
url=http://higgsboson.tk/
license=(MIT)
depends=(ca-certificates netctl)
source=(eduroam eduroam-umu)
install=install
package() {
  mkdir -p $pkgdir/etc/netctl/examples/
  cp eduroam $pkgdir/etc/netctl/examples/
  cp eduroam-umu $pkgdir/etc/netctl/examples/
}
md5sums=('08875498a560a2b62c3f08a21f4c5542'
         'bc3a44f8f58e396423c8b9d1e9657498')
sha1sums=('4ca924ce03da4d29263e035300e283b958b2b613'
          '9be833ea9e25bc2e159f0c2a3e94d6df4b42910b')
sha256sums=('41c34b0b38e918d34dd366f1db80e4f314ff1f9b0080a0075523b10b960cd286'
            '36ffbbc8e6b8be3b9e13c4393f2ef23bd76743c0e148bbb23fba5185f6fdac8b')
