# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=sweet-mars-kde
pkgver=0.1+20200613
pkgrel=1
pkgdesc="A dark and modern theme for Plasma"
arch=('any')
url="https://store.kde.org/p/1393507/"
license=('GPL3')
depends=('color-scheme-sweet-mars' 'plasma-theme-sweet-mars' 'aurorae-theme-sweet-mars')
optdepends=('kvantum-qt5')
source=("https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1OTIwODgxNzciLCJvIjoiMSIsInMiOiJhZjBmOTU3ZDM5N2FhZDUwMjBiMWMzN2M1MmRlZWFkY2YxY2QwYWNiZjA2ZDkzZGI0OTYxZTIwNjU3NTIyOGQ0NzIzNzk5YjI3ZTk0NjQ5NTZlZWYzM2FhZjgxYzMwZDFkOWVkMzgxMzU2YTlmNjYyNzhmNTAxNzNhZTM2MTBiNiIsInQiOjE1OTI0MjQyNjAsInN0ZnAiOm51bGwsInN0aXAiOiI4My4xMjUuOTMuMTAifQ.QCmgy4FEIDckOzW7RJ-2yGih-olPs4xlW9XMkzHWgmM/Sweet-Mars.tar.xz")
md5sums=('43b17fcc5d108ed458596cebf8c5f63c')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/share/plasma/look-and-feel"
  cp -r Sweet-Mars "${pkgdir}/usr/share/plasma/look-and-feel/"
}
