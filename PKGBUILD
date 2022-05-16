# Mainained by imper <imperator999mcpe@gmail.com>
pkgname="privacy-protection-messenger-qt"
pkgver=2.0
pkgrel=0
pkgdesc="Privacy Protection Messenger Qt GUI"
author="imperzer0"
branch="master"
url="https://github.com/$author/$pkgname"
arch=('x86_64')
license=('GPL3')
depends=("qt6-base" "privacy-protection-messenger>=1.2-1")
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
          "mainwindow.ui" "resources.qrc" "$pkgname.desktop")

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
         'd477c2ed847d2af3c0ed2af79dfb1ee6'
         'a4c97595748ab29c30bd475a9e086f55'
         '70915dcbf16202a933114d45ee2a949c'
         'd01756d07619f1f5b4791c399effdcbd'
         'baff22f5e98a6c117c609b3078d4d373'
         '945f6b1c3fca462d12cbf7c75e71cd4c'

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