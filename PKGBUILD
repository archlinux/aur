# Maintainer: Timo Wilken <timo dot 21 dot wilken plus aur at gmail dot com>
pkgname=kimi-dark-gtk-theme
pkgver=2019.10.10
pkgrel=1
pkgdesc='Kimi is a Gtk3.20+ theme'
arch=(any)
url='https://www.gnome-look.org/p/1326889/'
depends=('gtk3')
source=('https://dllb2.pling.com/api/files/download/id/1570730427/s/c78bf76312715c958d74efb93942a5d378f2573dd3cababaa89276fa464b785422065088caa4e206fe4537a7744edd9b011d6a973b17233d8b4bbd85278c018e/t/1571418218/c/c78bf76312715c958d74efb93942a5d378f2573dd3cababaa89276fa464b785422065088caa4e206fe4537a7744edd9b011d6a973b17233d8b4bbd85278c018e/lt/download/Kimi-dark.tar.xz')
sha256sums=('5e67a487bcc57e2619036597c1aa3667e1d3d8674f5a121edc9da33d6e0de800')

build() {
    echo
    echo '!! You may need to replace the URL in source= with another!'
    echo
}

package() {
    cd "$srcdir"
    find Kimi-dark -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
