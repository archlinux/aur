# Maintainer: Darren Ng <$(base64 --decode <<<VW4xR2ZuQGdtYWlsLmNvbQo=)>

pkgname=buildroot-meta
pkgver=2022.11.1
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
  'wget'
  'findutils'
)

optdepends=(

  # Recommended dependencies
  'python2>=2.7'
  'python'

  # Configuration interface dependencies
  # output/build/buildroot-config/
  'ncurses: menuconfig & nconfig'
  'qt5-base: xconfig'
  'glib2: gconfig'
  'gtk2: gconfig'
  # 'glade: gconfig' # /usr/lib/libgladeui-2.so (NOT required)
  'libglade: gconfig' # /usr/lib/libglade-2.0.so (optionally required)

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
  'asciidoc>=8.6.3'
  'w3m'
  'python-argparse'
  'dblatex: pdf manual'

  # Graph generation tools
  'graphviz: graph-depends & <pkg>-graph-depends'
  'python-matplotlib: graph-build'

)

# provides=("${pkgname%-meta}")
# conflicts=("${pkgname%-meta}")
# source=('SKIP')
# md5sums=('SKIP')
