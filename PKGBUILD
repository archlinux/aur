# Maintainer: Expertcoderz <$(rev <<<moc.liamg@xzredoctrepxe)>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>

pkgname=buildroot-meta
pkgver=2025.08
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
  'diffutils'
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
  'findutils'
  'awk'
  # Source fetching tools
  'wget'
)

optdepends=(

  # Recommended dependencies
  'python'

  # Configuration interface dependencies
  # output/build/buildroot-config/
  'ncurses: to use the menuconfig interface'
  'qt5-base: to use the xconfig interface'
  'glib2: to use the gconfig interface'
  'gtk2: to use the gconfig interface'
  # 'glade: gconfig' # /usr/lib/libgladeui-2.so (NOT required)
  'libglade: to use the gconfig interface' # /usr/lib/libglade-2.0.so (optionally required)

  # Source fetching tools
  'breezy: bazaar'
  'cvs'
  'git'
  'mercurial'
  'rsync'
  'openssh: scp and sftp'
  'subversion'

  # Java-related packages
  'java-environment-common: javac and jar'

  # Documentation generation tools
  'asciidoc>=8.6.3'
  'w3m'
  # python-argparse is present in python 3.2+
  'dblatex: pdf manual'

  # Graph generation tools
  'graphviz: graph-depends & <pkg>-graph-depends'
  'python-matplotlib: graph-build'

  # Package statistics tools
  'python-aiohttp: pkg-stats'
)
