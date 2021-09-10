# Contributor: Chocopwowwa <chocopowwwa@gmail.com>
# Contributor: Rafed Ramzi <rafedramzi@gmail.com>

pkgname=sweet-gtk-theme-dark
_pkgname=Sweet-Dark-v40
pkgver=2.0.r23.5b53ee2
pkgrel=2
pkgdesc="Light and dark colorful Gtk3.20+ theme"
arch=('any')
url='https://github.com/EliverLara/Sweet'
license=('GPL3')
conflicts=('sweet-theme-dark')
replaces=('sweet-theme-dark')
source=(https://dl3.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2Mjg1MzkwODciLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjI0MjEzNWQ5NTBmMTM3OTE1NzBkMTk5MGMyYWJiZDZkYTBmMWE5MzMxNWJhMDEwNzMyZmRiNmY1NDA5Y2NiMTI1Mzc5YTlhMTVmYTlhZDhlNDU4NTUxNzhhODc1NDc1MGI1YzIzZGRmMjVlMTIzNDlhNjgyODU5NjEwZjllNzA0IiwidCI6MTYzMTI0MjAzMiwic3RmcCI6bnVsbCwic3RpcCI6bnVsbH0.YjMLrbkZ-YnoqHCvD6Kwl5s4hxHfWyqIKrQbaWzO0U8/Sweet-Dark-v40.tar.xz)
md5sums=('46f370e1a2a8fa9f3f2314a132836090')

package() {
  mkdir -p "${pkgdir}/usr/share/themes/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/themes/"
}
