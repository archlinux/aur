# Maintainer: Porta <portalmaster137@gmail.com>
pkgname="flixel"
pkgver="5.0.1"
pkgrel="1"
pkgdesc="A powerful 2D game engine for the Haxe programming language + tools. Make sure you have run 'haxelib setup' before installing this package."
arch=( 'any' )
depends=( 'haxe' )
license=( 'MIT' )

build () {
    if ! command -v haxelib &> /dev/null
    then
        echo "haxelib could not be found, please install haxe"
        exit
    fi
}
package() {
    haxelib install lime
    haxelib install openfl
    haxelib install flixel
    haxelib install flixel-addons
    haxelib install flixel-ui
    haxelib install hscript
}