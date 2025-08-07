# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-cdflib
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.3.6
pkgrel=1
pkgdesc="A python module for reading NASA's Common Data Format (cdf) files Resources"
arch=('any')
url="https://github.com/MAVENSDC/cdflib"
license=('MIT')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-sphinx-copybutton'
             'python-sphinx_rtd_theme'
             'python-astropy'
             'python-xarray')  # wheel required by new setuptools
#checkdepends=('python-pytest-cov'
#              'python-pytest-remotedata'
#             'python-pytest-xdist'
#              'python-hypothesis'
#              'python-netcdf4'
#             )
#             'python-netcdf4')  # astropy xarray in makedepends; netcdf4 needs remote-data
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
#       'fix-module-import.patch')
md5sums=('0f67fb9748b7a5829c41c8b5b7986efd')
#        'ba680f74500be6839d3fe232e6a22eb1'
#        '0239191dd5d8400aaf68ff5a6ee4de0d'
#        '269b0b2dae018ffa3e7442349e65b0ad'
#        'dd546dbfb322b49c4a1f59291e7e7558'
#        'bf488b65508ca20511da8585a8cbd1b4'
#        'bdd71ab43f25627a86ac33b4c7fac5d7'
#        '361e18cb6506f4f9bc89dd21c8eaa3e1'
#        '8746ad4f1537da9ae83c65c1e6c8dcf8'
#        '5b5c426d015f76d3aad254ee87e5d54d'
#        '3aa8a05abec342c399abdef148f1457f'
#        '2c9986e3fbc85851bf391a32890f21a1'
#        '6f71323df2b79cb1c9d433654cd75927'
#        'a4d61922cca4bac2044c2bb325a2398a'
#        '61d2a561f1e7f68b994058d0a6ad0de6'
#        '2b6845cec1821daa768cdedd9629821a'
#        '2d471a6387debe60171540fe857d0c8d'
#        '6501cfc5878d673aaf7adad92bcedba1'
#        '357ae2e60381cb93378011e8aa1521e1'
#        '90742363385fdf28fdc7f37ecc9353f5'
#        '561ce92ce636950c1ea5af0503704a8f'
#        '4544902e8acfc07d3983ecbbfbe51a52'
#        '35d92badaebe0656ac67ae28d5c314b0'
#        '782d17a591ee3ebba8ee4c3c53d80e8f'
#        'a3d3bb2ba561624ee74379bdcfe9806b'
#        '3163c0ce42f524628a0b3020543a6656'
#        '502ff84e67db204004a71e66d624fbcd'
#        '1d264ed27918804bb4ece7d791b1656b'
#        '9c720048831f9c4e41218e8a2165a18a'
#        'c8bf52ce6a3cb7a0e4e3e3db2fe72d8f'
#        '076e66fe075fac4d84a22c5444e06c61'
#        '2657e149639c045a7738a58988749a74'
#        '2e9ad73d41e96d2b852352f828e91896'
#        '1ef603328247961be77be9241179db80'
#        '8d111ab8e2e2307742719e479ab746f6'
#        '326fbdc875fd231405632d9cd8e10786'
#        '132bfd9f056dce7043482d54e5205437'
#        '790095f6fb8e486a73840847c55b8064'
#        'bf927c2087ea7a207d80478630ced266'
#        '1f8dc0e94759bced68d9dcfeaafc9e54'
#        '07d3c70be7cc61f65c024aee903996ee'
#        '273cc645dc7f40c46db2e29dd95b310a'
#        'cb336e89340e4cf0ec2f468b86b21901')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   ln -rs ${srcdir}/*.cdf .
#   ln -rs ${srcdir}/*.nc .
#   ln -rs ${srcdir}/*.ncdf .
#   sed -i "/language\ = /s/None/'en'/" doc/conf.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make SPHINXOPTS="" -C doc html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#    # Can't skip remotedata after 1.3.3
#    pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #--remote-data # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 # --remote-data
#}

package_python-cdflib() {
    depends=('python>=3.8' 'python-numpy>=1.21')
    optdepends=('python-astropy: for CDF Astropy Epochs'
                'python-xarray: for working with XArray'
                'python-cdflib-doc: Documentation for CDFlib')
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
