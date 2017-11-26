# $Id: externallibs.mk,v 1.1 2017/02/18 12:20:05 mwebster Exp $

# External Library and Include Paths

FSLEXTLIB=${FSLDIR}/extras/lib
FSLEXTINC=${FSLDIR}/extras/include
FSLEXTBIN=${FSLDIR}/extras/bin

# GD library
INC_GD = /usr/include
LIB_GD = /usr/lib

# GDC library
LIB_GDC = ${FSLEXTLIB}
INC_GDC = ${FSLEXTINC}/libgdc

# LIBXML2 library
INC_XML2 = /usr/include/libxml2

# LIBXML++ library
INC_XML++ = /usr/include/libxml++-2.6
INC_XML++CONF = /usr/lib/libxml++-2.6/include
# GSL library
LIB_GSL = /usr/lib
INC_GSL = /usr/include/gsl

# PNG library
LIB_PNG = /usr/lib
INC_PNG = /usr/include/libpng16

# PROB library
LIB_PROB = ${FSLEXTLIB}
INC_PROB = ${FSLEXTINC}/libprob

# CPROB library
LIB_CPROB = ${FSLEXTLIB}
INC_CPROB = ${FSLEXTINC}/libcprob

# NEWMAT library
LIB_NEWMAT = /usr/lib
INC_NEWMAT = /usr/include/newmat

# NEWRAN library
LIB_NEWRAN = ${FSLEXTLIB}
INC_NEWRAN = ${FSLEXTINC}/newran

# ZLIB library
LIB_ZLIB = /usr/lib
INC_ZLIB = /usr/include

# BOOST library
INC_BOOST = /usr/include/boost
LIB_BOOST = /usr/lib

# FFTW3 library
INC_FFTW3 = /usr/include
LIB_FFTW3 = /usr/lib

# VTK library 
VTKDIR_INC = /opt/vtk6/include/vtk
VTKDIR_LIB = /opt/vtk6/lib
VTKSUFFIX = 
