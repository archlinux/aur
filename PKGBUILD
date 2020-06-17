# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=sweet-wallpapers
pkgver=20200112
pkgrel=1
pkgdesc="Wallpapers with colors that fit the Sweet theme for Plasma"
arch=('any')
url="https://www.pling.com/p/1309907/"
license=('GPL3')
source=("https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1Nzg4NjUyODYiLCJvIjoiMSIsInMiOiIzYjc5NjhkMDhkYTYwYmU5NjVhYTEyODdmYmMzM2Q0MjgzNzQ0OGNiOTUwZDUyY2VkM2U3OGViNWVlYWM1OGFhYWQ2OWQ5MmQxYjIzZjUwYzcyMWFhOTg5N2UzNTkzNGE2YjA1ODI1MjRhZTUwOGY2ZWQwZTY3YzBkMDUyMGQ0MyIsInQiOjE1OTI0MTk3MTYsInN0ZnAiOm51bGwsInN0aXAiOiIzNy4yMzIuMTQyLjI0MiJ9.aOei8w9KH0yFK6ZJDGB-fXIAZgN7Ky3ij-17PWf22dk/Sweet-Wallpapers.tar.xz")
md5sums=('ec46027b22b186bf3fe2a3e30a0c125e')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/share/wallpapers"
  cp -r Sweet-Wallpapers "${pkgdir}/usr/share/wallpapers/"
}
