# Maintainer: Mohammad Hossein Sekhavat <sekhavat17@gmail.com>

pkgbase='python-streamlit'
pkgname=('python-streamlit')
_module='streamlit'
pkgver='0.72.0'
pkgrel=1
pkgdesc="Streamlit: Frontend library for machine learning engineers"
url="https://streamlit.io"
depends=(
	'python'
	'python-altair>=3.2.0'
	'python-astor'
	'python-base58'
	'python-blinker'
	'python-cachetools>=4.0'
	'python-click>=7.0'
	'python-numpy'
	'python-packaging'
	'python-pandas>=0.21.0'
	'python-pillow>=6.2.0'
	'python-protobuf>=3.11.2'
	'python-pyarrow'
	'python-pydeck>=0.1.dev5'
	'python-dateutil'
	'python-requests'
	'python-toml'
	'python-tornado5'
	'python-tzlocal'
	'python-validators'
	'python-watchdog'
	'python-gitpython'
)
makedepends=('python-pip')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/a3/3b/8b70128553de980a5120b512c8eedc3667deced9554fc399703414b1d8cf/streamlit-0.72.0-py2.py3-none-any.whl")
sha256sums=('e47376266f8b544d716a72788f7e4ca514c6a3c3b434f0b07f1ff300812ab551')

package() {
    cd "${srcdir}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps streamlit-${pkgver}-py2.py3-none-any.whl
}
