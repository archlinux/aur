#################################################################################
#										#
#			Linux gcc TPM2 Makefile					#
#			     Written by Ken Goldman				#
#		       IBM Thomas J. Watson Research Center			#
#	      $Id: makefile 809 2016-11-16 18:31:54Z kgoldman $			#
#										#
# (c) Copyright IBM Corporation 2015, 2016					#
# 										#
# All rights reserved.								#
# 										#
# Redistribution and use in source and binary forms, with or without		#
# modification, are permitted provided that the following conditions are	#
# met:										#
# 										#
# Redistributions of source code must retain the above copyright notice,	#
# this list of conditions and the following disclaimer.				#
# 										#
# Redistributions in binary form must reproduce the above copyright		#
# notice, this list of conditions and the following disclaimer in the		#
# documentation and/or other materials provided with the distribution.		#
# 										#
# Neither the names of the IBM Corporation nor the names of its			#
# contributors may be used to endorse or promote products derived from		#
# this software without specific prior written permission.			#
# 										#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS		#
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT		#
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR		#
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT		#
# HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,	#
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT		#
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,		#
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY		#
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT		#
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE		#
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.		#
#										#
#################################################################################


CC = /usr/bin/gcc

CCFLAGS = -Wall  			\
	-Wmissing-declarations -Wmissing-prototypes -Wnested-externs \
	-Wno-error -Wsign-compare \
	 -c -ggdb -O0 			\
	-DTPM_POSIX			\
	-D_POSIX_			\
	-I../utils			\
	-I/usr/include/openssl-1.0	\
	-L/usr/lib/openssl-1.0		\
	-I.

LNFLAGS = -ggdb 			\
	-DTPM_POSIX			\
	-lcrypto			\
	-lpthread			\
	-I/usr/include/openssl-1.0      \
	-I.

all:	tpm_server

CRYPTO_SUBSYSTEM = openssl

include makefile-common

OBJFILES += TcpServerPosix.o

TcpServerPosix.o	: $(HEADERS)

.PHONY:		clean
.PRECIOUS:	%.o

tpm_server:	$(OBJFILES)
		$(CC) $(OBJFILES) $(LNFLAGS) -o tpm_server

clean:		
		rm -f *.o tpm_server *~

%.o:		%.c
		$(CC) $(CCFLAGS) $< -o $@

