#!/bin/bash -f

# Setup RELION-2
export PATH=/opt/relion/bin:$PATH
export LD_LIBRARY_PATH=/opt/relion/lib:$LD_LIBRARY_PATH

# Where is qsub template script stored
export RELION_QSUB_TEMPLATE=/opt/relion/bin/qsub.csh

# Default PDF viewer
export RELION_PDFVIEWER_EXECUTABLE=evince

# Default MOTIONCORR executable
export RELION_MOTIONCORR_EXECUTABLE=/usr/bin/MotionCor2

# Default UNBLUR/SUMMOVIE executables
export RELION_UNBLUR_EXECUTABLE=/usr/bin/unblur.exe
export RELION_SUMMOVIE_EXECUTABLE=/usr/bin/summovie.exe

# Default CTFFIND executable, version 4.0.x
# For the new CTFFIND 4.1+ this would be
export RELION_CTFFIND_EXECUTABLE=/usr/bin/ctffind

# Default Gctf executable
export RELION_GCTF_EXECUTABLE=/usr/bin/Gctf-v1.06_sm_30_cu8.0_x86_64

# Default ResMap executable
export RELION_RESMAP_EXECUTABLE=/usr/bin/resmap

# Enforce cluster jobs to occupy entire nodes with 24 hyperthreads
#export RELION_MINIMUM_DEDICATED 24
# Do not allow the user to change the enforcement of entire nodes
#export RELION_ALLOW_CHANGE_MINIMUM_DEDICATED 0

# Ask for confirmation if users try to submit local jobs with more than 12 MPI nodes
_NPROC=$(nproc --all)
export RELION_WARNING_LOCAL_MPI=$_NPROC
