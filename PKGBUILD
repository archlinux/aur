# Maintainer: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

pkgname=buildroot-dummy
pkgver=2020.11.1
pkgrel=1
pkgdesc="dependency requirements for buildroot"
arch=('any')
url="https://buildroot.org/downloads/manual/manual.html#requirement"
license=('GPL')
depends=(
	'which'
	'sed'
	'make>=3.81'
	'binutils'
	'gcc>=4.8'
	'bash'
	'patch'
	'gzip'
	'bzip2'
	'perl>=5.8.7'
	'tar'
	'cpio'
	'unzip'
	'rsync'
	'file'
	'bc'
	'wget'
)
optdepends=(

	# Recommended dependencies
	'python'

	# Configuration interface dependencies
	# output/build/buildroot-config/
	'ncurses: menuconfig & nconfig'
	'qt5-base: xconfig'
	'gtk2: gconfig'
	'glib2: gconfig'
	'libglade: gconfig'

	# Source fetching tools
	'breezy: bazaar'
	'cvs'
	'git'
	'mercurial'
	'rsync'
	'openssh: scp'
	'subversion'

	# Java-related packages

	# Documentation generation tools
	'asciidoc'
	'w3m'
	'python-argparse'
	'dblatex: pdf manual'

	# Graph generation tools
	'graphviz: graph-depends & <pkg>-graph-depends'
	'python-matplotlib: graph-build'

)
provides=("${pkgname%dummy}")
conflicts=("${pkgname%dummy}")
# source=('SKIP')
# md5sums=('SKIP')
