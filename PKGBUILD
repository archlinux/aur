# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=plasma-theme-sweet-mars
pkgver=1.0.0+20200617
pkgrel=1
pkgdesc="A dark and modern theme for Plasma"
arch=('any')
url="https://store.kde.org/p/1393498/"
license=('GPL3')
depends=('plasma-desktop')
source=("https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1OTIzNTQwNzYiLCJvIjoiMSIsInMiOiIwMjc2NWFmNGIyYmZkYTIzMmIzYzM2MGZlOTY4MzJlOTIwMTAzZTY5ZTAzOTVhYWQ0MDMzNWEyMTY3ZTZkMzFjMWEyZDVlMzU3ODVlMjNlODQ1MWI1NGEyY2Y2ZDFkNTg2NDYxMzAxYmM4YTU3ODVlYmVjNjYxMmMwMTE3MzAyOSIsInQiOjE1OTI0MjYyOTQsInN0ZnAiOm51bGwsInN0aXAiOiIxODguMTIzLjIzMS4xMTMifQ.Z5PKCnDGQVrUVnf0EpayoWkBFbSjArq0hz-MsxxmkQk/Sweet-mars.tar.xz")
md5sums=('d23354b6923b2140c42ade06121e9cdf')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/share/plasma/desktoptheme"
  cp -r Sweet-mars "${pkgdir}/usr/share/plasma/desktoptheme/"
}
