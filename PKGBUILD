# Maintainer: Faruk D. <fdiblen@gmail.com>


pkgbase=data-science-stack
pkgname=(data-science-python-meta
       data-science-languages-meta
	     data-science-utils-meta
       data-science-mkl-meta
)
pkgver=0.1
pkgrel=1
arch=(any)

package_data-science-python-meta() {
  pkgdesc='Meta package for python data science packages'
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

package_data-science-languages-meta() {
  pkgdesc='Meta package for data science languages'
  replaces=()
  depends=(r
           julia
           python
           go
  )
}

package_data-science-utils-meta() {
  pkgdesc='Meta package for data science utils'
  replaces=()
  depends=(git           
  )
}

package_data-science-mkl-meta() {
  pkgdesc='Meta package for data science packages compiled with the Intel MKL library '
  replaces=()
  depends=(python-numpy-mkl
           python-scipy-mkl
           mkl-dnn
           python-mkl-fft
           python-mkl-random
           python-mkl-service
           julia-mkl
           r-mkl           
  )
}