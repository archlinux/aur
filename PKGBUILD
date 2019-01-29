#Maintainer: AlpixTM aka Lukas N. <contact@alpix.eu>
pkgname=transfersh
pkgver=1.4
pkgrel=1
pkgdesc="Unofficial command-line client for https://transfer.sh"
arch=('any')
url="https://github.com/AlpixTM/transfersh"
license=('AGPL')
depends=('python' 'python-requests')
install=
source=('https://github.com/AlpixTM/transfersh/archive/v1.4.tar.gz')
md5sums=('b7161f7ea7188ec3ff5570bcac615247')

package() {
  cd "$pkgname-$pkgver"
  install -D -m 755 "${srcdir}/transfersh-$pkgver/transfersh" "${pkgdir}/usr/bin/transfersh"
  install -D -m 755 "${srcdir}/transfersh-$pkgver/README.md" "${pkgdir}/usr/share/$pkgname/README.md"
  install -D -m 755 "${srcdir}/transfersh-$pkgver/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
