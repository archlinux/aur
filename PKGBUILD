# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=sddm-theme-sweet
pkgver=0.1
pkgrel=1
pkgdesc="Colorful sddm theme"
arch=('any')
url="https://store.kde.org/p/1334945/"
license=('GPL3')
depends=('sddm' 'cantarell-fonts')
source=("https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1NzMxNTg3MTYiLCJvIjoiMSIsInMiOiI3ZjNmN2Y4NmU4NDI2NjkyZDU0MmI3NGQ0ZWQzY2RjZjU4Y2JiYTE5ODlkMzdmMDNjMDE1MTRmNjc1YWVhYjQ1NTNhOGZhY2VkOGY3YzU2NWZiN2M5ZDc4MWQwOTM2Mjk3N2Q1MzkyYmEwZGY5NzVmOWI0OTU2OGYzMjYyNjkxNCIsInQiOjE1OTI0MTg3MzEsInN0ZnAiOm51bGwsInN0aXAiOiIyNC42OC40LjE5MyJ9.MpC6lu7pyr7GGRksOnVk1W5Wo5areGIpLkFv9TJjaRs/Sweet.tar.gz")
md5sums=('bb72db0252388f03f3af9a79208d8ad6')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/share/sddm/themes"
  cp -r Sweet "${pkgdir}/usr/share/sddm/themes/"
}
