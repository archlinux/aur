# Maintainer: librewish <librewish@gmail.com>

pkgname=beautyline
pkgver=20201102
pkgrel=1
pkgdesc="outlined icons Designed to have unified look and comprehensive coverage ( best suited to use with Sweet theme)"
arch=('any')
url="https://www.pling.com/p/1425426"
license=('GPL3')
depends=('hicolor-icon-theme')
source=("https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2MDQzNTczODkiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjJiZGZlNDczNDhlYTZlZDhkOWE4OTAwMmFkYjk4NjdiZWYzNzZmYjQ5NWQ3ZGZmYmM2OTA2NTIzMTNhMzA2MGQ4NTBhOTMzMmQyYzg0ZWE2YTUwMjQxOGE4ZGJiYzc2OWUwZWI0OWFhN2RkMmI2ZGY4ZDU2YTI5ZDA0NGFlYzRhIiwidCI6MTYwNjg5ODc3OCwic3RmcCI6IjE3NWExNDhmMDlmNjk3NDU5Y2YyZDlhYTFiMDNiYjVhIiwic3RpcCI6IjI0MDk6NDA0MjoyZTFhOjc0Nzg6ZDVkYToxMTk6YjY0OTpkYTEzIn0.uLOWNdooepulXXTs8h2eLWfkNU_qoeETyz9YANsR8Cg/BeautyLine.tar.gz")
md5sums=('235611494ab790d06947f01a2e2cf3b2')

package() {
  cd "${srcdir}"
  mv BeautyLine/apps/scalable/goa-account-msn* BeautyLine/apps/scalable/goa-account-msn.svg
  install -dm755 "${pkgdir}/usr/share/icons"
  
  cp -rf BeautyLine "${pkgdir}/usr/share/icons/"
}
