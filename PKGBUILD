# Maintainer: Faruk D. <fdiblen@gmail.com>


pkgbase=data-science-stack
pkgname=(data-science-python-meta
       data-science-languages-meta
	     data-science-utils-meta
       data-science-mkl-meta
       data-science-octave-meta
       data-science-ai-meta
       data-science-ai-gpu-meta
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

package_data-science-octave-meta() {
  pkgdesc='Meta package for octave data science packages'
  replaces=()
  depends=(octave-statistics
           octave-signal
           octave-control
           octave-image
           octave-dataframe
           octave-plot
           octave-database
  )
}

package_data-science-ai-meta() {
  pkgdesc='Meta package for popular machine learning frameworks'
  replaces=()
  depends=(tensorflow-opt
           python-pytorch-opt
           caffe2
           cntk
           python-scikit-learn           
  )
}

package_data-science-ai-gpu-meta() {
  pkgdesc='Meta package for popular machine learning frameworks with CUDA support'
  replaces=()
  depends=(tensorflow-opt-cuda
           python-pytorch-opt-cuda
           caffe2-cuda
           cntk-cuda
  )
}