# Maintainer: morwel 

pkgname=python-externally-managed
pkgver=3.11
pkgrel=1
pkgdesc='Mark Python base environment as externally managed - PEP 668'
arch=('any')
source=('EXTERNALLY-MANAGED')
sha256sums=('c07b94bf7dcbe7be5ba0cee29971a005a5be65002cbfb59c5a8f661fa92aa82f')


package() {

  cd "$pkgdir"
  install -D -m644 "$srcdir"/EXTERNALLY-MANAGED usr/lib/python"$pkgver"/EXTERNALLY-MANAGED

}

