# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=gimp-ofnuts-tools
pkgver=0.1
pkgrel=1
pkgdesc="Ofnuts' Gimp Tools"
arch=(any)
url='http://gimp-tools.sourceforge.net/'
license=('GPL')
depends=(gimp python)
options=(!strip)
source=(
http://sourceforge.net/projects/gimp-tools/files/scripts/seamless-helper-1.0.py
http://sourceforge.net/projects/gimp-tools/files/scripts/grid-filler-random-color-0.3.py
http://sourceforge.net/projects/gimp-tools/files/scripts/addonCollectionManager-3.0.py
http://sourceforge.net/projects/gimp-tools/files/scripts/settings-cleaner.py
http://sourceforge.net/projects/gimp-tools/files/scripts/random-pixels-from-palette-0.0.py
http://sourceforge.net/projects/gimp-tools/files/scripts/density-brush-fill-0.2.py
http://sourceforge.net/projects/gimp-tools/files/scripts/arrange-layers-0.2.py
http://sourceforge.net/projects/gimp-tools/files/scripts/interleave-layers-0.4.py
http://sourceforge.net/projects/gimp-tools/files/scripts/mirror-layers-0.1.py
http://sourceforge.net/projects/gimp-tools/files/scripts/text-info-0.0.py
http://sourceforge.net/projects/gimp-tools/files/scripts/autocrop-linked-layers-0.2.py
http://sourceforge.net/projects/gimp-tools/files/scripts/retime-linked-layers-0.0.py
http://sourceforge.net/projects/gimp-tools/files/scripts/clear-layers-0.2.py
http://sourceforge.net/projects/gimp-tools/files/scripts/random-ellipses-0.3.py
)
package (){
  cd "$srcdir"
  _scriptsdir="$pkgdir"/usr/share/gimp/2.0/scripts
  install -dm755 "$_scriptsdir"
  for i in *.py; do
    install -Dm644  $i "$_scriptsdir"/$i
  done
}
md5sums=('37f48f45292e7510297542cc73900d63'
         '3e09533abe718f364bc5804a9e25e153'
         '5afcf0971411c8c34d40482f2cbc2d20'
         '92157e494227213fc34c7e8fa167917d'
         'e500aca698b91b042208b8fb6da13316'
         'b08048ff19bf2181d52ea198cdb1142b'
         '9150d82e1bc3fb6b14e4248080c0f9a1'
         '89c4be088c50287ed0c0afb96c0b6287'
         '47221291f3ba6f55a766ea5599bce15a'
         'c2540cbfcd27b2c6af0e7b9316fedff8'
         '0070b1b84355a2dab1a72975a46821b4'
         '95a9f18dee95d28cd7302ca7748b94e1'
         '8f25244207cea464e9ffb410352a235d'
         '15a11f864199eeac07fff9cac860a6a7')
