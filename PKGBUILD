# Maintainer: Romain Porte <microjoe@mailoo.org>

pkgname=vue
pkgver=3.3.0
pkgrel=1
pkgdesc="Visual Understanding Environment"
arch=('any')
url="https://github.com/VUE/VUE"
license=('unknown')
depends=('java-environment')
source=(https://github.com/VUE/VUE/releases/download/$pkgver/VUE.jar vue)
noextract=('VUE.jar')
md5sums=('4ac36729f42d000ac163add1b6c7a351' 'af196991a58733c5c0742aace0439639')


package() {
	install -Dm755 VUE.jar $pkgdir/opt/$pkgname/VUE.jar
	install -Dm755 vue $pkgdir/usr/bin/vue
}
