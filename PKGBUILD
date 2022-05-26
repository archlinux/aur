# Mainained by imper <imperator999mcpe@gmail.com>
pkgname="privacy-protection-messenger-qt"
pkgver=2.7
pkgrel=0
pkgdesc="Privacy Protection Messenger Qt GUI"
author="imperzer0"
branch="master"
url="https://github.com/$author/$pkgname"
arch=('x86_64')
license=('GPL3')
depends=("qt6-base" "privacy-protection-messenger>=1.3-4")
makedepends=("cmake>=3.0" "qt6-base")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

_srcprefix="https://raw.githubusercontent.com/$author/$pkgname/$branch"
_languages=("uk_UA" "ru_UA" "ru_RU")
_libfiles=("CMakeLists.txt" "main.cpp" "mainwindow.cpp" "mainwindow.h" "call_backend.hpp"
          "mainwindow.ui" "resources.qrc" "$pkgname.desktop" "icon.svg")

for _lang in ${_languages[@]}
{
    _libfiles=(${_libfiles[@]} $pkgname"_"$_lang".ts")
}

for _libfile in ${_libfiles[@]}
{
    source=(${source[@]} "$_srcprefix/$_libfile")
}

md5sums=('d947c26f52d4d7faba15f3ef08916fe4'
         '19701c33c592f57e964d4a4d6e9c64f5'
         '10a5b560a9ced010f19ea91aadb2cee8'
         'd730aa9c2258dfde436e7e427224a30b'
         'b7236d6f2be23ff108a450eb232f5424'
         '6cf2c080681e86fab5470ad72307166c'
         'baff22f5e98a6c117c609b3078d4d373'
         '31370d27ff1be3b6b587d2817c492328'
         '0c56a68ee3f1abe72a1c2a0b5361c646'

         '05cf19b4d413f0cfbefe3415b4d4e80f'
         '43ca58212a0ebb4d303b581844799928'
         '980681771058d0cc584f9fa154e5296b')

prepare()
{
    curl -L "$_srcprefix/PKGBUILD" > PKGBUILD-git
}

build()
{
    . PKGBUILD-git && build
}

package()
{
    . PKGBUILD-git && package
}