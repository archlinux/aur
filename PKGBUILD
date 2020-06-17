# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=candy-icons
pkgver=0.2.1
pkgrel=1
pkgdesc="Icon theme designed to fit the Sweet GTK theme"
arch=('any')
url="https://www.pling.com/p/1305251/"
license=('GPL3')
depends=('breeze-icons' 'gnome-icon-theme' 'ubuntu-themes' 'mint-x-icons' 'elementary-icon-theme' 'hicolor-icon-theme')
source=("https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1OTE1NTE4NjIiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjdiYzU3MWFkZjc1ZTg3ZjM2MGQ2ZjkwZTdjMWQ2OWU4ZTNhOTBmMGEwNDFhYThiZjY0NDE2MmE5OGYwNGVkOTYwODk4YTVhMTgzYjQ3MTVmYTNlNzhiMWM4MGRlYWYxMWJiM2E3OGE0MzBiMjA2NDIxYjRhYWFjZTFhMDk4MGUzIiwidCI6MTU5MjQxMjIwOCwic3RmcCI6ImY4YzMwYjU5MjUxZWUyZDQzZGNlOGQ1ZTIyNzY1ZjA1Iiwic3RpcCI6IjIwMDM6Njo0MWFjOjg2NTE6NGNlYzpmZjY2OjI1NGY6YzhjMCJ9.UOHto7CjyWTcVWlaj8OPaDUV8R_hDGArfcxmY_GQ14g/candy-icons.tar.xz")
md5sums=('bddcf1c9a41e268c80717d8b778f3b5f')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/share/icons"
  cp -r candy-icons "${pkgdir}/usr/share/icons/"
}
