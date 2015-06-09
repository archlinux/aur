#!/usr/bin/python

############################################################################
#                                                                          #
# File                 : python-sipcmd.py                                  #
# Project              : QtiPlot                                           #
# Description          : Auto-detect SIP/PyQt location; dump commandline   #
# Copyright            : (C) 2007-2010 Knut Franke (knut.franke*gmx.de)    #
#                        (replace * with @ in the email address)           #
#                                                                          #
############################################################################
#                                                                          #
#  This program is free software; you can redistribute it and/or modify    #
#  it under the terms of the GNU General Public License as published by    #
#  the Free Software Foundation; either version 2 of the License, or       #
#  (at your option) any later version.                                     #
#                                                                          #
#  This program is distributed in the hope that it will be useful,         #
#  but WITHOUT ANY WARRANTY; without even the implied warranty of          #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           #
#  GNU General Public License for more details.                            #
#                                                                          #
#   You should have received a copy of the GNU General Public License      #
#   along with this program; if not, write to the Free Software            #
#   Foundation, Inc., 51 Franklin Street, Fifth Floor,                     #
#   Boston, MA  02110-1301  USA                                            #
#                                                                          #
############################################################################

import PyQt4 as PyQt
from PyQt4 import QtCore
import sipconfig
import os
sipcfg = sipconfig.Configuration()
print " ".join([sipcfg.default_sip_dir , PyQt.__name__])

print " ".join([sipcfg.sip_bin, "-I", sipcfg.default_sip_dir, QtCore.PYQT_CONFIGURATION['sip_flags']])
