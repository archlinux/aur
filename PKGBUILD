# Maintainer: Riley_VM <Riley_VM@proton.me>
pkgname=git.gay
pkgver=1.0.0
pkgrel=1
pkgdesc="Unofficial desktop app for git.gay"
arch=('x86_64')
url="https://git.gay"
license=('MIT')
depends=('fuse2')
source=("$pkgname-$pkgver.AppImage::https://git.gay/Ri/unofficial-desktop-app/releases/download/$pkgver/$pkgname-$pkgver.AppImage")
sha256sums=('07741ac00535acfb8f595e9bd72b963e9dfaf3f6a91ac8c2d9a947b2f07ff640')

package() {
  install -Dm755 "$pkgname-$pkgver.AppImage" "$pkgdir/usr/bin/$pkgname"
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
