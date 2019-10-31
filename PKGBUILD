# Maintainer: Faruk D. <fdiblen@gmail.com>


pkgbase=data-science-stack
pkgname=(python-data-science-meta
	     data-science-utils
)
pkgver=0.1
pkgrel=1
arch=(any)

package_python-data-science-meta() {
  pkgdesc='Meta package for python packages'
  replaces=()
  depends=(python-pandas
           python-numpy
           miniconda3
           python-dask
           python-numba
           python-sympy
           python-statsmodels
           python-scikit-learn
           python-matplotlib
           python-virtualenv
           python-nltk
           python-gensim           
           nltk-data
           ipython
  )
}

package_data-science-utils() {
  pkgdesc='Meta package for data science packages'
  replaces=()
  depends=(git
  )
}