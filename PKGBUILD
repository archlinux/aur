# Maintainer: Piotr Szczepaniak <piotr21.szczepaniak@student.uj.edu.pl>
pkgname=code-writer
pkgver=1.0
pkgrel=1
pkgdesc="first build of code writer"
arch=(x86_64)
url="https://github.com/Student-Team-Projects/Code-Writer.git"
license=('MIT')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(codeWriter)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
	cd Code-Writer
	pwd
	curl -fsSL https://ollama.com/install.sh | sh
	pwd
	git clone https://github.com/jmont-dev/ollama-hpp.git
	pwd
	g++ main.cpp -I./ollama-hpp/singleheader -o main
}

package() {
  cd Code-Writer
}

