# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=aurorae-theme-sweet
pkgver=1.1.0+20190818
pkgrel=1
pkgdesc="Aurorae theme to fit the Sweet theme for Plasma and GNOME"
arch=('any')
url="https://store.kde.org/p/1286856/"
license=('GPL3')
depends=('kwin')
source=("https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1NjYxNTY5OTYiLCJvIjoiMSIsInMiOiI2YWUzMzM0NjJkMDgwZTAwODlkMGY4NDFmMzMxMjkzNjA3ZGExYmVjMTcyYThhMzUxNjM1NDFlYzQ4NWZjNWQwZDAyYzJmNjFkYzU4MGYxNTJhYWU4Zjc0ZWQ2MDk5MWFmNmM2NDliYmFhZTk5OGJjNjY2MGNlZWU5ZmVlODM4NSIsInQiOjE1OTI0MjEzOTgsInN0ZnAiOm51bGwsInN0aXAiOiI5NS4xNjUuMTUzLjg0In0.TbN9_17Xvs9hVKQUXQgMtrFnH2579tDhfFgiGg5EJr4/Sweet.tar.xz")
md5sums=('7f07d3ef5165e0804ca4b27bfb9f2f1d')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/share/aurorae/themes"
  cp -r Sweet-Dark Sweet-Dark-transparent "${pkgdir}/usr/share/aurorae/themes/"
}
