# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=kvantum-theme-sweet
pkgver=20200613
pkgrel=1
pkgdesc="Dark and modern Kvantum theme based on the Monochrome KDE theme"
arch=('any')
url="https://store.kde.org/p/1294013/"
license=('GPL3')
depends=('kvantum-qt5')
source=("https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1ODg3OTc2MDciLCJvIjoiMSIsInMiOiI0NDBiYTlhMGM1NWQ1ZDA5YjE1ZmFiZmU4YzcwNGNkYmI4MTJmNDJlNzA4NDIxZGFmYWU1MDQ1MWVlZTQyMTIyNzM5YTM3MDI5OTFiMjIxYTQzOGFiOGIzNmIxNWRkMzJhOGZmNTk4NWQ3M2QyZTUxZGE2YzBiOGFjZWQ1MzU5MiIsInQiOjE1OTI0MTc5MTAsInN0ZnAiOm51bGwsInN0aXAiOiI5My4yNTIuMC40NSJ9.XsGvT_34MCPtslX1GWrLGHXWuGZ4eKsM6E7To5OlhY0/Sweet.tar.xz"
        "https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1ODg3OTgwOTciLCJvIjoiMSIsInMiOiI0NDBiYTlhMGM1NWQ1ZDA5YjE1ZmFiZmU4YzcwNGNkYmI4MTJmNDJlNzA4NDIxZGFmYWU1MDQ1MWVlZTQyMTIyNzM5YTM3MDI5OTFiMjIxYTQzOGFiOGIzNmIxNWRkMzJhOGZmNTk4NWQ3M2QyZTUxZGE2YzBiOGFjZWQ1MzU5MiIsInQiOjE1OTI0MTc5MTAsInN0ZnAiOm51bGwsInN0aXAiOiI5My4yNTIuMC40NSJ9.Q1k3yrx_xDGs2VJm8VIFs3LTNBT21MDz1Xvp7KSxDXU/Sweet-transparent-toolbar.tar.xz"
        "https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1OTIwNzkxMDIiLCJvIjoiMSIsInMiOiI0NDBiYTlhMGM1NWQ1ZDA5YjE1ZmFiZmU4YzcwNGNkYmI4MTJmNDJlNzA4NDIxZGFmYWU1MDQ1MWVlZTQyMTIyNzM5YTM3MDI5OTFiMjIxYTQzOGFiOGIzNmIxNWRkMzJhOGZmNTk4NWQ3M2QyZTUxZGE2YzBiOGFjZWQ1MzU5MiIsInQiOjE1OTI0MTc5MTAsInN0ZnAiOm51bGwsInN0aXAiOiI5My4yNTIuMC40NSJ9.Q9QlXnUy0VJ2gauIjBIfnvr1jgcK5NYceVDJgt9kyXU/Sweet-Mars.tar.xz"
        "https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE1OTIwNzk4ODEiLCJvIjoiMSIsInMiOiI0NDBiYTlhMGM1NWQ1ZDA5YjE1ZmFiZmU4YzcwNGNkYmI4MTJmNDJlNzA4NDIxZGFmYWU1MDQ1MWVlZTQyMTIyNzM5YTM3MDI5OTFiMjIxYTQzOGFiOGIzNmIxNWRkMzJhOGZmNTk4NWQ3M2QyZTUxZGE2YzBiOGFjZWQ1MzU5MiIsInQiOjE1OTI0MTc5MTAsInN0ZnAiOm51bGwsInN0aXAiOiI5My4yNTIuMC40NSJ9.kWdz8Q92kRahoP4IdeKX4docIQCxxnhSZRvpyhPczeM/Sweet-Mars-transparent-toolbar.tar.xz")
md5sums=('b2b2cd0d8c1d3fc0f0833d4d68d8e80c'
         '8f4a130c5153ef8c3cddb4f512af6178'
         'ee800d181eb25cd518cdf10424783d00'
         '21a1987fa92f08c8045988649125396c')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/usr/share/Kvantum"
  cp -r Sweet Sweet-transparent-toolbar Sweet-Mars Sweet-Mars-transparent-toolbar "${pkgdir}/usr/share/Kvantum/"
}
