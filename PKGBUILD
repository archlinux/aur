# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-cdflib
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.4.7
pkgrel=1
pkgdesc="A python module for reading NASA's Common Data Format (cdf) files Resources"
arch=('any')
url="https://github.com/MAVENSDC/cdflib"
license=('MIT')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-sphinx_rtd_theme'
             'python-astropy')
checkdepends=('python-pytest-cov'
              'python-pytest-remotedata'
              'python-hypothesis'
              'python-xarray')
#             'python-netcdf4')  #'python-astropy' in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mms1_fpi_brst_l2_des-moms_20151016130334_v3.3.0.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mms1_fpi_brst_l2_des-moms_20151016130334_v3.3.0.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mms2_epd-eis_srvy_l2_extof_20160809_v3.0.4.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mms2_epd-eis_srvy_l2_extof_20160809_v3.0.4.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mms2_fgm_srvy_l2_20160809_v4.47.0.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mms2_fgm_srvy_l2_20160809_v4.47.0.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/MGITM_LS180_F130_150615.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/dn_magn-l2-hires_g17_d20211219_v1-0-1.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/SABER_L2B_2021020_103692_02.07.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_euv_l3_minute_20201130_v14_r02.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_lpw_l2_lpiv_20180717_v02_r02.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_lpw_l2_lpiv_20180717_v02_r02.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_lpw_l2_lpnt_20180717_v03_r01.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_lpw_l2_lpnt_20180717_v03_r01.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_lpw_l2_mrgscpot_20180717_v02_r01.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_lpw_l2_mrgscpot_20180717_v02_r01.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_sep_l2_anc_20210501_v06_r00.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_sep_l2_s2-raw-svy-full_20191231_v04_r05.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_sta_l2_d1-32e4d16a8m_20201130_v02_r04.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_swe_l2_arc3d_20180717_v04_r02.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_swe_l2_arc3d_20180717_v04_r02.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_swe_l2_svyspec_20180718_v04_r04.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_swe_l2_svyspec_20180718_v04_r04.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_swi_l2_finearc3d_20180720_v01_r01.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_swi_l2_finearc3d_20180720_v01_r01.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_swi_l2_onboardsvyspec_20180720_v01_r01.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/mvn_swi_l2_onboardsvyspec_20180720_v01_r01.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/omni_hro2_1min_20151001_v01.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/omni_hro2_1min_20151001_v01.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/raids_nirs_20100823_v1.1.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/rbsp-a_magnetometer_1sec-gsm_emfisis-l3_20190122_v1.6.2.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/see__L3_2021009_012_01.ncdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/see__xps_L2A_2021006_012_02.ncdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/sgpsondewnpnC1.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/thc_l2_sst_20210709_v01.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/thc_l2_sst_20210709_v01.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/thg_l2_mag_amd_20070323_v01.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/thg_l2_mag_amd_20070323_v01.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/wi_elsp_3dp_20210115_v01.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/wi_elsp_3dp_20210115_v01.nc"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/wi_k0_spha_20210121_v01.cdf"
#       "https://lasp.colorado.edu/maven/sdc/public/data/sdc/web/cdflib_testing/wi_k0_spha_20210121_v01.nc")
md5sums=('5589f6933af90f62e28f3c98f58d2b62')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    ln -rs ${srcdir}/*.cdf .
#    ln -rs ${srcdir}/*.nc .
#    ln -rs ${srcdir}/*.ncdf .
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/doc
    PYTHONPATH="../build/lib" make SPHINXOPTS="" html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib" pytest || warning "Tests failed" #--remote-data
}

package_python-cdflib() {
    depends=('python>=3.6' 'python-attrs>=19.2.0' 'python-numpy')
    optdepends=('python-cdflib-doc: Documentation for CDFlib')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-cdflib-doc() {
    pkgdesc="Documentation for Python CDFlib"
    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
