# Contributor: Chocopwowwa <chocopowwwa@gmail.com>
# Contributor: Rafed Ramzi <rafedramzi@gmail.com>

pkgname=sweet-gtk-theme
_pkgname=Sweet-v40
pkgver=2.0.r23.5b53ee2
pkgrel=2
pkgdesc="Light and dark colorful Gtk3.20+ theme"
arch=('any')
url='https://github.com/EliverLara/Sweet'
license=('GPL3')
conflicts=('sweet-theme')
replaces=('sweet-theme')
source=(https://dl3.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2Mjg1MzgyOTgiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6ImY1NDQ1ODE0ZjNhZTg4ODYwNWY2MTE5NmFjNTQxOGJkOTkxMzdhYTllYjFhOWRkMzFhYTMyMGY0Mzc2ZGU4NzkwOGIyODQxMjNlODA4YTE1M2M4NjBkOTkyYWI3NDBkYjhlMDkzZjZlNzIxZWU5ZGVhODNhMmNmYjE4MzVmZmFiIiwidCI6MTYzMTI0MjA4Mywic3RmcCI6bnVsbCwic3RpcCI6bnVsbH0.YpE7VPnY7uaL7cDUjJiLAsVcy0nLGV4BFAh_71x5NxI/Sweet-v40.tar.xz)
md5sums=('51151ef70bc4126e3f564c26a534da3c')

package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/themes/Sweet"
}
