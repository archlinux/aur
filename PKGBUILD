# Maintainer: Albert Kugel (Lastebil) (lastebilaur@trebel.org)
# Contributor: Will Smith (Factory, rpj8) <iliketoast@gmail.com>
# Contributor: Adrian Perez de Castro (aperez) <aperez@igalia.com>

pkgname=xcursor-gruppled
pkgver=1.1
pkgrel=8
pkgdesc="An X11 theme by gruppler made entirely in Inkscape, inspired by Ghost Cursors"
arch=(any)
url=https://www.pling.com/p/999974
license=(GPL)
source=("$pkgname-$pkgver.tar.gz::https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE0NjA3MzUzNzciLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6ImQxMDU2YTNkMzk4OTcyMTg4ODk1OTA4ODI4Njk1M2I3MTRlOTdkZGIwOWUxMjc5Nzc3OWY5MThmMmRkNmUwMjgwMTgxZWNiYTMzYmRjNjEyNWJhMGNmZGZhMjAxNWJhMjlhOTdhNDRiNjJkMWViZDlhYzliM2E5OGMzNGU4ZGY4IiwidCI6MTU5NjE0NDIwNiwic3RmcCI6ImY2OTFlOTkwOTVhNmUyOGIyOTE0ZTMxOTZiMWEzOGJjIiwic3RpcCI6IjgyLjE4MS4xNjEuMTMxIn0.0qaaYhe3SduJN9FcvYDoBHVT7GQ4JAD0WJU790vMmHo/86081-gruppled.tar.gz")
sha512sums=('1f407dea6a8a0d3a71d29571d40f087e60df4dd4db01cfcf8e329fc12526ba5891be362383a8ef32b464ecb0569423acf24b81f599b15ba92244e54d1b8fdba7')

package() {
  mkdir -p "$pkgdir/usr/share/icons"

  rm -rf "${srcdir}"/*/Sources
  
  cp -r \
  "$srcdir/gruppled_white" \
  "$srcdir/gruppled_black" \
  "$pkgdir/usr/share/icons"
}
