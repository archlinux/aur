# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>
# Contributor: zer0def <zer0def@github>

pkgname=sbkeys
pkgver=1.1.0
pkgrel=2
pkgdesc="Simple script to generate Secure Boot keys"
arch=('any')
url="https://github.com/electrickite/sbkeys"
license=('GPL3')
depends=('efitools' 'coreutils' 'bash' 'util-linux' 'openssl' 'wget')
optdepends=('sbsigntools: For Microsoft signature database entries')

source=('sbkeys')
sha256sums=('19e24a796889ba7af0eedbb163fb343491e8d935e4a1ae717465ecbaa98a6e0e')

package() {
  install -Dm755 sbkeys "${pkgdir}/usr/bin/sbkeys"
}
