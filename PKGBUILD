#Maintainer: AlpixTM aka Lukas N. <contact@alpix.eu>
pkgname=transfersh
pkgver=1.4.1
pkgrel=1
pkgdesc="Unofficial command-line client for https://transfer.sh"
arch=('any')
url="https://github.com/AlpixTM/transfersh"
license=('AGPL')
depends=('python' 'python-requests')
install=
source=('https://github.com/AlpixTM/transfersh/archive/v1.4.1.tar.gz')
md5sums=('0a33aec2fda2f2fe791928f722a5dfcd')

package() {
  cd "$pkgname-$pkgver"
  install -D -m 755 "${srcdir}/transfersh-$pkgver/transfersh" "${pkgdir}/usr/bin/transfersh"
  install -D -m 755 "${srcdir}/transfersh-$pkgver/README.md" "${pkgdir}/usr/share/$pkgname/README.md"
  install -D -m 755 "${srcdir}/transfersh-$pkgver/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
