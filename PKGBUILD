# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=multiverse
pkgver=1.2.0
pkgrel=1
pkgdesc='Online video game platform making it as easy as possible to make, play, stream, and share tabletop role-playing games'
url='https://multiverse.com'
arch=('x86_64')
license=('unknown')
source=('multiverse.desktop'
        'multiverse.svg')
sha1sums=('823098589a6cdbe3e298f4e38d488e82f8610699'
          '9aadec2fdce3c6c8699f860a3d35464c6d5f1d22')
sha1sums_x86_64=('5e24b86bba65d644fb34e1c2d7879f7bf2a49be2')
source_x86_64=("https://download.todesktop.com/2101156wuvac7e1/One-More-Multiverse-${pkgver}.AppImage")
options=('!strip')

package() {
  # App
  install -dm755 "$pkgdir"/usr/bin
  install -m755 *.AppImage "$pkgdir"/usr/bin/multiverse

  # Desktop shortcut
  install -Dm644 multiverse.desktop "$pkgdir"/usr/share/applications/multiverse.desktop
  install -Dm644 multiverse.svg "$pkgdir"/usr/share/pixmaps/multiverse.svg
}
