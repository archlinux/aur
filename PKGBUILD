# Maintainer: Kristof Jozsa <kjozsa@fsdev.hu>

pkgname=eclipse-qwickie
pkgver=1.1.3
pkgrel=1
pkgdesc="Eclipse plugin for the Wicket Java web framework"
arch=('i686' 'x86_64')
url="http://www.scala-ide.org/"
license=('Apache')
depends=('eclipse>=3.7')
noextract=(${source[@]%%::*})

source=(\
	http://qwickie.googlecode.com/files/qwickie.plugin_1.1.3.201310041541.jar
)

md5sums=('c9d487675105f7821a215bfcb64c8f53')

build() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/qwickie/eclipse/plugins
  mkdir -p $_dest
  install -Dm644 qwickie.plugin_*.jar $_dest
}
