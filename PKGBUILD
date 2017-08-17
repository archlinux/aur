# Maintainer: Aiyion <aur@aiyionpri.me>
pkgname=rdworks-wine-bin
pkgver=8.01.18
pkgrel=1
pkgdesc='A powerful program that allows you to perform laser cutting engraving operations'
arch=('any')
url='http://en.rd-acs.com/prod_view.aspx?TypeId=50105&Id=148'
license=('GPL')
groups=()
depends=('wine'
         'winetricks')
makedepends=('unrar')
optdepends=('wine-mono: or take dotnet')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://en.rd-acs.com/Private/Files/add732140c983267.rar"
        "rdworks-wine-bin")
noextract=("add732140c983267.rar")
md5sums=('3102d7217a72c9b95e4a93898aefc173'
         '29101780536e645ec479e49ead7266aa')

prepare() {
  unrar x add732140c983267.rar
}

package() {
  install -dm755 "$pkgdir"/usr/bin
  install -dm755 "$pkgdir"/usr/share/rdworks-wine-bin

  install -Dm755 rdworks-wine-bin "$pkgdir"/usr/bin/rdworks-wine-bin
  install -Dm755 RDWorksV8Setup8.01.18.exe "$pkgdir"/usr/share/rdworks-wine-bin/RDWorksV8Setup8.01.18.exe
}
