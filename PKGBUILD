# Maintainer: Kshitij Aucharmal <kshitijaucharmal21@gmail.com>

pkgname=geminishell
pkgver=1.0.0
pkgrel=1
pkgdesc="A shell program written in Python"
arch=('any')
url="https://github.com/kshitijaucharmal/geminishell"  # Replace with your project's URL
license=('Apache')
depends=('python')  # Add other dependencies if needed
source=("git+https://github.com/kshitijaucharmal/$pkgname.git#branch=main")  # Replace 'main' with your branch if needed
sha256sums=('SKIP')  # not required when using git

build() {
  cd "$srcdir/$pkgname"
  # Optional: Add commands to prepare the build environment if needed
}

package() {
  cd "$srcdir/$pkgname"
  
  # Run the install.sh script
  chmod +x install.sh
  ./install.sh

  # Install additional files if needed
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

