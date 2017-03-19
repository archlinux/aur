#!/bin/csh -f

# Setup RELION-2.0 if not already done so
set path=(/opt/relion/bin $path)
setenv LD_LIBRARY_PATH /opt/relion/lib:$LD_LIBRARY_PATH

# Where is qsub template script stored
setenv RELION_QSUB_TEMPLATE /opt/relion/bin/qsub.csh

# Default PDF viewer
setenv RELION_PDFVIEWER_EXECUTABLE evince

# Default MOTIONCORR executable
setenv RELION_MOTIONCORR_EXECUTABLE /usr/bin/MotionCor2

# Default UNBLUR/SUMMOVIE executables
setenv RELION_UNBLUR_EXECUTABLE /usr/bin/unblur.exe
setenv RELION_SUMMOVIE_EXECUTABLE /usr/bin/summovie.exe

# Default CTFFIND executable, version 4.0.x
# For the new CTFFIND 4.1+ this would be
setenv RELION_CTFFIND_EXECUTABLE /usr/bin/ctffind

# Default Gctf executable
setenv RELION_GCTF_EXECUTABLE /usr/bin/Gctf-v1.06_sm_30_cu8.0_x86_64

# Default ResMap executable
setenv RELION_RESMAP_EXECUTABLE /usr/bin/resmap

# Enforce cluster jobs to occupy entire nodes with 24 hyperthreads
#setenv RELION_MINIMUM_DEDICATED 24
# Do not allow the user to change the enforcement of entire nodes
#setenv RELION_ALLOW_CHANGE_MINIMUM_DEDICATED 0

# Ask for confirmation if users try to submit local jobs with more than 12 MPI nodes
_NPROC=$(nproc --all)
setenv RELION_WARNING_LOCAL_MPI $_NPROC

