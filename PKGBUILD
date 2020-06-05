# Maintainer: Mohammad Hossein Sekhavat <sekhavat17@gmail.com>

pkgbase='python-streamlit'
pkgname=('python-streamlit')
_module='streamlit'
pkgver='0.61.0'
pkgrel=1
pkgdesc="Streamlit: Frontend library for machine learning engineers"
url="https://streamlit.io"
depends=(
	'python'
	'python-altair>=3.2.0'
	'python-astor'
	'python-base58'
	'python-blinker'
	'python-boto3'
	'python-botocore>=1.13.44'
	'python-cachetools>=4.0'
	'python-click>=7.0'
	'python-enum-compat'
	'python-numpy'
	'python-packaging'
	'python-pandas>=0.21.0'
	'python-pillow>=6.2.0'
	'python-protobuf>=3.11.2'
	'python-pydeck>=0.1.dev5'
	'python-requests'
	'python-toml'
	'python-tornado5'
	'python-tzlocal'
	'python-validators'
	'python-watchdog'
)
makedepends=('python-pip')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/b0/c5/963a1d9ebf5916d836652e94390846bffb4258c478d75bf01852a5fe79fa/streamlit-0.61.0-py2.py3-none-any.whl")
sha256sums=('81cd72bed91501b36a0f5f4ac60f6f78c43912eef84128c985e9cc17e1dfd343')

package() {
    cd "${srcdir}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps streamlit-${pkgver}-py2.py3-none-any.whl
}
