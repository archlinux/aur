# Maintainer: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>
# Contributor: Emanuele 'Lele aka eldios' Calo' <lele@sshadm.in>

pkgname='trufflehog'
pkgver=2.0.95
pkgrel=0
pkgdesc="Searches through git repositories for high entropy strings and secrets, digging deep into commit history"
url="https://github.com/dxa4481/truffleHog.git"
arch=('any')
license=('GPL-2.0')
depends=('python' 'trufflehogregexes'=0.0.4 'python-gitpython=2.1.1' 'python-pytest-cov=2.5.1' 'python-unittest2=1.1.0' 'python-codecov=2.0.15')
provides=('python-trufflehog')
source=("https://files.pythonhosted.org/packages/92/f2/129fd5d14a7ae8b2d7717ffcffb63a0666228a2f452f619df5ad63a610f8/truffleHog-${pkgver}.tar.gz")
sha512sums=('88890d4941a6d48cb1e4218a00f690f9a04a96b4d09d4c50f3b723134e373a39b6774299418752111eeb2618499511687465f3e3d9f560af0d48ff73399f7df2')

package() {
  cd "${srcdir}/truffleHog-${pkgver}"
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
