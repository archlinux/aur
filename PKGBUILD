#Maintainer: AlpixTM aka Lukas N. <contact@alpix.eu>
pkgname=transfersh
pkgver=1.2
pkgrel=2
pkgdesc="Unofficial command-line client for https://transfer.sh"
arch=('any')
url="https://github.com/AlpixTM/transfersh"
license=('AGPL')
depends=('python' 'python-requests')
install=
source=('https://github.com/AlpixTM/transfersh/archive/v1.2.tar.gz')
md5sums=('1b21ace11239f351b36ed4b1fda9f67a')

package() {
  cd "$pkgname-$pkgver"
  install -D -m 755 "${srcdir}/transfersh-$pkgver/transfersh" "${pkgdir}/usr/bin/transfersh"
  install -D -m 755 "${srcdir}/transfersh-$pkgver/README.md" "${pkgdir}/usr/share/$pkgname/README.md"
  install -D -m 644 "${srcdir}/transfersh-$pkgver/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
