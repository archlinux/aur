# Maintainer: David Rosenstrauch <darose@darose.net>
pkgname=wallpaper-lightning
pkgver=1
pkgrel=8
pkgdesc="'Lightning' wallpaper that used to be included in kdeartwork-weatherwallpapers"
arch=('any')
url="https://www.pling.com/s/Wallpapers/p/1054951/"
license=('GPL')
source=('https://dl1.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE0NjA4OTk3NzIiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjIyNWFjMmZmOGYzMDIwYjBmZTRlYjI3MGZhZmUzMWI0NTRmNzVjZjJkODY4YWNkYzE1MjNhNGQwNjhiZGI0ZGQyYjBjYjJjZjU4MTIyM2JiNjRmNWU1Mjk4NWI1ZDc3NGI0MGRhMTBhYTc4ODMwMGM4NDQyNDg0YTIxYWVhYTQyIiwidCI6MTYzMzMxNTg5OCwic3RmcCI6ImM5MWMxOTI1NWQxYWRjYTlhNTc2NmU2Nzk1MTdjZGE0Iiwic3RpcCI6IjI2MDM6NzAwMDo0MDQwOjIwOmFjMjM6ZGI6NDVhZjoxZDI5In0.PcDnR3yXasaanovBHCrlz9NEZhzr8zpHm1_KBcSWDiM/78438-Lightning1920.jpg')
md5sums=('5ec093bbe2b9d1d1c44d61078ea4949b')

package() {
  cd "$srcdir"
  install -d $pkgdir/usr/share/wallpapers/Lightning/
  cp 78438-Lightning1920.jpg $pkgdir/usr/share/wallpapers/Lightning/Lightning1920.jpg
}
