###################################################################### 
#
# Config parameter for an OpenACS site using NaviServer.
# adapted for openacs PKGBUILD
#
# These default settings will only work in limited circumstances.
# Two servers with default settings cannot run on the same host
#
###################################################################### 
ns_log notice "nsd.tcl: starting to read config file..."

#---------------------------------------------------------------------
# change to 80 and 443 for production use
set httpport		8000
set httpsport		8443 

# The hostname and address should be set to actual values.
# setting the address to 0.0.0.0 means aolserver listens on all interfaces
set hostname		localhost
set address		127.0.0.1

# Note: If port is privileged (usually < 1024), OpenACS must be
# started by root, and the run script must contain the flag 
# '-b address:port' which matches the address and port 
# as specified above.

set server		"openacs" 
set servername		"New OpenACS Installation - Development"

set serverroot		/usr/lib/$server
set logroot		$serverroot/log/

set homedir		/usr/lib/naviserver
set bindir		$homedir/bin

# Are we runnng behind a proxy?
set proxy_mode		false

#---------------------------------------------------------------------
# Which database do you want? postgres or oracle
set database              postgres 

set db_name               oacs-5-10

if { $database eq "oracle" } {
    set db_password           "mysitepassword"
} else {
    set db_host               localhost
    set db_port               ""
    set db_user               nsadmin
}

#---------------------------------------------------------------------
# if debug is false, all debugging will be turned off
set debug false
set dev   false

set max_file_upload_mb        200
set max_file_upload_min        5

#---------------------------------------------------------------------
# set environment variables HOME and LANG
set env(HOME) $homedir
set env(LANG) en_US.UTF-8

###################################################################### 
#
# End of instance-specific settings 
#
# Nothing below this point need be changed in a default install.
#
###################################################################### 


#---------------------------------------------------------------------
#
# NaviServer's directories. Autoconfigurable. 
#
#---------------------------------------------------------------------
# Where are your pages going to live ?
set pageroot                  ${serverroot}/www 
set directoryfile             "index.tcl index.adp index.html index.htm"

#---------------------------------------------------------------------
# Global server parameters 
#---------------------------------------------------------------------
ns_section ns/parameters 
	ns_param	serverlog	${logroot}/error.log 
	ns_param	pidfile		${logroot}/nsd.pid
	ns_param	home		$homedir 
	ns_param	debug		$debug
	#
	# ns_param	logroll		on
        ns_param	logmaxbackup	100  ;# 10 is default
	ns_param	logdebug	$debug
	ns_param	logdev		$dev

	# ns_param	mailhost	localhost 
	# ns_param	jobsperthread	0
	# ns_param	jobtimeout	300
	# ns_param	schedsperthread	0

	# Write asynchronously to log files (access log and error log)
	# ns_param	asynclogwriter	true		;# false

	# Enforce sequential thread initialization. This is not really
	# desirably in general, but might be useful for hunting strange
	# crashes or for debugging with valgrind.
	# ns_param	tclinitlock	true	       ;# default: false

	#
	# Encoding settings (see http://dqd.com/~mayoff/encoding-doc.html)
	#
	# ns_param	HackContentType	1

	# Naviserver's defaults charsets are all utf-8.  Allthough the
	# default charset is utf-8, set the parameter "OutputCharset"
	# here, since otherwise OpenACS uses in the meta-tags the charset
	# from [ad_conn charset], which is taken from the db and
	# per-default ISO-8859-1.
	ns_param	OutputCharset	utf-8   
	# ns_param	URLCharset	utf-8

	# Running behind proxy? Used by OpenACS...
	ns_param	ReverseProxyMode	$proxy_mode


#---------------------------------------------------------------------
# Thread library (nsthread) parameters 
#---------------------------------------------------------------------
ns_section ns/threads 
	ns_param	stacksize	[expr {128 * 8192}]

#---------------------------------------------------------------------
# Extra mime types
#---------------------------------------------------------------------
ns_section ns/mimetypes
	#  Note: NaviServer already has an exhaustive list of MIME types:
	#  see: /usr/local/src/naviserver/nsd/mimetypes.c
	#  but in case something is missing you can add it here. 
	#ns_param	Default		*/*
	#ns_param	NoExtension	*/*
	#ns_param	.pcd		image/x-photo-cd
	#ns_param	.prc		application/x-pilot

#---------------------------------------------------------------------
# Global fastpath parameters
#---------------------------------------------------------------------
ns_section      "ns/fastpath"
    #ns_param        cache               true       ;# default: false
    #ns_param        cachemaxsize        10240000   ;# default: 1024*10000
    #ns_param        cachemaxentry       100000     ;# default: 8192
    #ns_param        mmap                true       ;# default: false
    #ns_param        gzip_static         true       ;# check for static gzip; default: false
    #ns_param        gzip_refresh        true       ;# refresh stale .gz files on the fly using ::ns_gzipfile
    #ns_param        gzip_cmd            "/usr/bin/gzip -9"  ;# use for re-compressing

#---------------------------------------------------------------------
# 
# Server-level configuration 
# 
#  There is only one server in NaviServer, but this is helpful when multiple
#  servers share the same configuration file.  This file assumes that only
#  one server is in use so it is set at the top in the "server" Tcl variable
#  Other host-specific values are set up above as Tcl variables, too.
# 
#---------------------------------------------------------------------
ns_section ns/servers 
	ns_param $server		$servername 

# 
# Server parameters 
# 
ns_section ns/server/${server} 
	#
	# Scaling and Tuning Options
	#
	# ns_param	maxconnections	100	;# 100; number of allocated connection stuctures
	# ns_param	maxthreads	10	;# 10; maximal number of connection threads
	ns_param	minthreads	2	;# 1; minimal number of connection threads
	ns_param	connsperthread	1000	;# 10000; number of connections (requests) handled per thread
	# ns_param	threadtimeout	120	;# 120; timeout for idle theads
	# ns_param	lowwatermark	10      ;# 10; create additional threads above this queue-full percentage
	ns_param	highwatermark	100     ;# 80; allow concurrent creates above this queue-is percentage
                                                ;# 100 means to disable concurrent creates

	# Compress response character data: ns_return, ADP etc.
	#
	ns_param	compressenable	on	;# false, use "ns_conn compress" to override
	# ns_param	compresslevel	4	;# 4, 1-9 where 9 is high compression, high overhead
        # ns_param	compressminsize	512	;# Compress responses larger than this
        # ns_param   	compresspreinit true	;# false, if true then initialize and allocate buffers at startup

	#
	# Configuration of replies
	#
	# ns_param	realm     	yourrealm	;# Default realm for Basic authentication
	# ns_param	noticedetail	false	;# true, return detail information in server reply
	# ns_param	errorminsize	0	;# 514, fillup reply to at least specified bytes (for ?early? MSIE)
	# ns_param	headercase	preserve;# preserve, might be "tolower" or "toupper"
	# ns_param	checkmodifiedsince	false	;# true, check modified-since before returning files from cache. Disable for speedup

#
# Special HTTP pages
#
ns_section ns/server/${server}/redirects
	ns_param	404	"/global/file-not-found.html"
	ns_param	403	"/global/forbidden.html"
	ns_param	503	"/global/busy.html"
	ns_param	500	"/global/error.html"

#---------------------------------------------------------------------
# 
# ADP (AOLserver Dynamic Page) configuration 
# 
#---------------------------------------------------------------------
ns_section ns/server/${server}/adp 
	ns_param	enabledebug	$debug
	ns_param	map		/*.adp		;# Extensions to parse as ADP's 
	# ns_param	map		"/*.html"	;# Any extension can be mapped 
	#
	# ns_param	cache		true		;# false, enable ADP caching
	# ns_param	cachesize	10000*1025	;# 5000*1024, size of cache
	#
	# ns_param	trace		true		;# false, trace execution of adp scripts
	# ns_param	tracesize	100		;# 40, max number of entries in trace
	#
	# ns_param	bufsize		5*1024*1000	;# 1*1024*1000, size of ADP buffer
	#
	# ns_param	stream		true		;# false, enable ADP streaming
	# ns_param	enableexpire	true		;# false, set "Expires: now" on all ADP's 
	# ns_param	safeeval	true		;# false, disable inline scripts
	# ns_param	singlescript	true		;# false, collapse Tcl blocks to a single Tcl script
	# ns_param	detailerror	false		;# true,  include connection info in error backtrace
	# ns_param	stricterror	true		;# false, interrupt execution on any error
	# ns_param	displayerror	true		;# false, include error message in output
	# ns_param	trimspace	true		;# false, trim whitespace from output buffer
	# ns_param	autoabort	false		;# true,  failure to flush a buffer (e.g. closed HTTP connection) generates an ADP exception
	#
	# ns_param	errorpage	/.../errorpage.adp	;# page for returning errors
	# ns_param	startpage	/.../startpage.adp	;# file to be run for every adp request; should include "ns_adp_include [ns_adp_argv 0]"
	# ns_param	debuginit	some-proc		;# ns_adp_debuginit, proc to be executed on debug init
	# 

ns_section ns/server/${server}/adp/parsers
	ns_param	fancy		".adp"

# 
# Tcl Configuration 
# 
ns_section ns/server/${server}/tcl
	ns_param	library		${serverroot}/tcl
	ns_param	autoclose	on 
	ns_param	debug		$debug
	# ns_param	nsvbuckets	16       ;# default: 8

 
ns_section "ns/server/${server}/fastpath"
	ns_param	serverdir	${homedir}
	ns_param	pagedir		${pageroot}
	#
	# Directory listing options
	#
	# ns_param	directoryfile		"index.adp index.tcl index.html index.htm"
	# ns_param	directoryadp		$pageroot/dirlist.adp ;# Choose one or the other
	# ns_param	directoryproc		_ns_dirlist           ;#  ...but not both!
	# ns_param	directorylisting	fancy                 ;# Can be simple or fancy
	#

#---------------------------------------------------------------------
#
# WebDAV Support (optional, requires oacs-dav package to be installed
#
#---------------------------------------------------------------------
ns_section ns/server/${server}/tdav
	ns_param	propdir		${serverroot}/data/dav/properties
	ns_param	lockdir		${serverroot}/data/dav/locks
	ns_param	defaultlocktimeout	300

ns_section ns/server/${server}/tdav/shares
	ns_param	share1 		"OpenACS"
	# ns_param	share2 		"Share 2 description"

ns_section ns/server/${server}/tdav/share/share1
	ns_param	uri		"/dav/*"
	# all WebDAV options
	ns_param	options 	"OPTIONS COPY GET PUT MOVE DELETE HEAD MKCOL POST PROPFIND PROPPATCH LOCK UNLOCK"

#ns_section ns/server/${server}/tdav/share/share2
	# ns_param	uri "/share2/path/*"
	# read-only WebDAV options
	# ns_param options "OPTIONS COPY GET HEAD MKCOL POST PROPFIND PROPPATCH"


#---------------------------------------------------------------------
# 
# Socket driver module (HTTP)  -- nssock 
# 
#---------------------------------------------------------------------
ns_section ns/server/${server}/module/nssock
	ns_param	address		$address
	ns_param	hostname	$hostname
	ns_param	port		$httpport	;# 80 or 443
	ns_param	maxinput	[expr {$max_file_upload_mb * 1024 * 1024}] ;# 1024*1024, maximum size for inputs
	ns_param	recvwait	[expr {$max_file_upload_min * 60}] ;# 30, timeout for receive operations
	# ns_param	maxline		8192	;# 8192, max size of a header line
	# ns_param	maxheaders	128	;# 128, max number of header lines
	# ns_param	uploadpath	/tmp	;# directory for uploads
	# ns_param	backlog		256	;# 256, backlog for listen operations
	# ns_param	maxqueuesize	256	;# 1024, maximum size of the queue
	# ns_param	acceptsize	10	;# Maximum number of requests accepted at once.
	# ns_param	deferaccept     true    ;# false, Performance optimization, may cause recvwait to be ignored
	# ns_param	bufsize		16384	;# 16384, buffersize
	# ns_param	readahead	16384	;# value of bufsize, size of readahead for requests
	# ns_param	sendwait	30	;# 30, timeout in seconds for send operations
	# ns_param	closewait	2	;# 2, timeout in seconds for close on socket
	# ns_param	keepwait	2	;# 5, timeout in seconds for keep-alive
	# ns_param	nodelay		true	;# false; activate TCP_NODELAY if not activated per default on your OS
	# ns_param	keepalivemaxuploadsize	  500000  ;# 0, don't allow keep-alive for upload content larger than this
	# ns_param	keepalivemaxdownloadsize  1000000 ;# 0, don't allow keep-alive for download content larger than this
	#
	# Spooling Threads
	#
	# ns_param	spoolerthreads	1	;# 0, number of upload spooler threads
	# ns_param	maxupload	0	;# 0, when specified, spool uploads larger than this value to a temp file
	ns_param	writerthreads	2	;# 0, number of writer threads
	ns_param	writersize	4096	;# 1024*1024, use writer threads for files larger than this value
	# ns_param	writerbufsize	8192	;# 8192, buffer size for writer threads
	# ns_param	writerstreaming	true	;# false;  activate writer for streaming HTML output (when using ns_write)


#---------------------------------------------------------------------
# 
# Access log -- nslog 
# 
#---------------------------------------------------------------------
ns_section ns/server/${server}/module/nslog 
	#
	# General parameters for access.log
	#
	ns_param	file			${logroot}/access.log
	# ns_param	maxbuffer		100	;# 0, number of logfile entries to keep in memory before flushing to disk
	#
	# Control what to log
	#
	# ns_param	suppressquery	true	;# false, suppress query portion in log entry
	# ns_param	logreqtime	true	;# false, include time to service the request
	ns_param	logpartialtimes	true	;# false, include high-res start time and partial request durations (accept, queue, filter, run)
	# ns_param	formattedtime	true	;# true, timestamps formatted or in secs (unix time)
	# ns_param	logcombined	true	;# true, Log in NSCA Combined Log Format (referer, user-agent)
	# ns_param	extendedheaders	COOKIE	;# space delimited list of HTTP heads to log per entry
	ns_param	checkforproxy	$proxy_mode ;# false, check for proxy header (X-Forwarded-For)
	#
	#
	# Control log file rolling
	#
	# ns_param	maxbackup	100	;# 10, max number of backup log files
	# ns_param	rolllog		true	;# true, should server log files automatically
	# ns_param	rollhour	0	;# 0, specify at which hour to roll
	# ns_param	rollonsignal	true	;# false, perform roll on a sighup
	ns_param	rollfmt		%Y-%m-%d-%H:%M	;# format appendend to log file name


#---------------------------------------------------------------------
# 
# CGI interface -- nscgi, if you have legacy stuff. Tcl or ADP files inside 
# NaviServer are vastly superior to CGIs. I haven't tested these params but they
# should be right.
# 
#---------------------------------------------------------------------
#ns_section "ns/server/${server}/module/nscgi" 
#       ns_param	map	"GET  /cgi-bin ${serverroot}/cgi-bin"
#       ns_param	map	"POST /cgi-bin ${serverroot}/cgi-bin" 
#       ns_param	Interps CGIinterps

#ns_section "ns/interps/CGIinterps" 
#       ns_param .pl "/usr/bin/perl"


#---------------------------------------------------------------------
#
# PAM authentication
#
#---------------------------------------------------------------------
ns_section ns/server/${server}/module/nspam
	ns_param	PamDomain          "pam_domain"


#---------------------------------------------------------------------
#
# SSL
# 
#---------------------------------------------------------------------

ns_section    "ns/server/${server}/module/nsssl"
       ns_param		address    	$address
       ns_param		port       	$httpsport
       ns_param		hostname       	$hostname
       ns_param		ciphers		"ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+3DES:!aNULL:!MD5:!RC4"
       ns_param		protocols	"!SSLv2"
       ns_param		certificate	$serverroot/etc/certfile.pem
       ns_param		verify     	0
       ns_param		writerthreads	2
       ns_param		writersize	4096
       ns_param		writerbufsize	16384	;# 8192, buffer size for writer threads
       #ns_param	writerstreaming	true	;# false
       #ns_param	deferaccept	true    ;# false, Performance optimization
       ns_param		maxinput	[expr {$max_file_upload_mb * 1024*1024}] ;# Maximum File Size for uploads in bytes


#---------------------------------------------------------------------
# 
# Database drivers 
# The database driver is specified here.
# Make sure you have the driver compiled and put it in {aolserverdir}/bin
#
#---------------------------------------------------------------------
ns_section "ns/db/drivers" 
    if { $database eq "oracle" } {
	ns_param	ora8           ${bindir}/ora8.so
    } else {
	ns_param	postgres       ${bindir}/nsdbpg.so
    }

    if { $database eq "oracle" } {
      ns_section "ns/db/driver/ora8"
	ns_param	maxStringLogLength -1
	ns_param	LobBufferSize      32768
    } else {
      ns_section "ns/db/driver/postgres"
	# Set this parameter, when "psql" is not on your path (OpenACS specific)
	# ns_param	pgbin	"/usr/local/pg920/bin/"
    }

 
# Database Pools: This is how NaviServer  ``talks'' to the RDBMS. You need 
# three for OpenACS: main, log, subquery. Make sure to replace ``yourdb'' 
# and ``yourpassword'' with the actual values for your db name and the 
# password for it, if needed.  
#
# NaviServer can have different pools connecting to different databases 
# and even different different database servers.  See
# http://openacs.org/doc/tutorial-second-database.html
# An example 'other db' configuration is included (and commented out) using other1_db_name
# set other1_db_name "yourDBname"

ns_section ns/db/pools 
	ns_param	pool1              "Pool 1"
	ns_param	pool2              "Pool 2"
	ns_param	pool3              "Pool 3"

ns_section ns/db/pool/pool1
	# ns_param	maxidle            0
	# ns_param	maxopen            0
	ns_param	connections        15
	ns_param	verbose            $debug
	ns_param	logsqlerrors       $debug
    if { $database eq "oracle" } {
	ns_param	driver             ora8
	ns_param	datasource         {}
	ns_param	user               $db_name
	ns_param	password           $db_password
    } else {
	ns_param	driver             postgres 
	ns_param	datasource         ${db_host}:${db_port}:${db_name}
	ns_param	user               $db_user
	ns_param	password           ""
    } 

ns_section ns/db/pool/pool2
	# ns_param	maxidle            0
	# ns_param	maxopen            0
	ns_param	connections        5
	ns_param	verbose            $debug
	ns_param	logsqlerrors       $debug
    if { $database eq "oracle" } {
	ns_param	driver             ora8
	ns_param	datasource         {}
	ns_param	user               $db_name
	ns_param	password           $db_password
    } else {
	ns_param	driver             postgres 
	ns_param	datasource         ${db_host}:${db_port}:${db_name}
	ns_param	user               $db_user
	ns_param	password           ""
    } 

ns_section ns/db/pool/pool3
	# ns_param	maxidle            0
	# ns_param	maxopen            0
	ns_param	connections        5
	ns_param	verbose            $debug
	ns_param	logsqlerrors       $debug
    if { $database eq "oracle" } {
	ns_param	driver             ora8
	ns_param	datasource         {}
	ns_param	user               $db_name
	ns_param	password           $db_password
    } else {
	ns_param	driver             postgres 
	ns_param	datasource         ${db_host}:${db_port}:${db_name}
	ns_param	user               $db_user
	ns_param	password           ""
    } 


ns_section ns/server/${server}/db
	ns_param	pools              pool1,pool2,pool3
	ns_param	defaultpool        pool1


#---------------------------------------------------------------------
# Which modules should be loaded?  Missing modules break the server, so
# don't uncomment modules unless they have been installed.

ns_section ns/server/${server}/modules 
	ns_param	nssock		${bindir}/nssock.so 
	ns_param	nslog		${bindir}/nslog.so 
	ns_param	nsdb		${bindir}/nsdb.so
	#ns_param	nsproxy		${bindir}/nsproxy.so
	# ns_param	nsssl		${bindir}/nsssl.so 

	#
	# Determine, if libthread is installed
	#
        set libthread [lindex [glob -nocomplain $homedir/lib/thread*/libthread*[info sharedlibextension]] end]
	if {$libthread eq ""} {
	  ns_log notice "No Tcl thread library installed in $homedir/lib/"
	} else {
	  ns_param	libthread $libthread
	  ns_log notice "Use Tcl thread library $libthread"
	}

	# authorize-gateway package requires dqd_utils
	# ns_param	dqd_utils dqd_utils[expr {int($tcl_version)}].so

	# PAM authentication
	# ns_param	nspam              ${bindir}/nspam.so

	# LDAP authentication
	# ns_param	nsldap             ${bindir}/nsldap.so

	# These modules aren't used in standard OpenACS installs
	# ns_param	nsperm             ${bindir}/nsperm.so 
	# ns_param	nscgi              ${bindir}/nscgi.so 
	# ns_param	nsjava             ${bindir}/libnsjava.so
	# ns_param	nsrewrite          ${bindir}/nsrewrite.so 


#
# nsproxy configuration
#

ns_section ns/server/${server}/module/nsproxy
	# ns_param	maxslaves          8
	# ns_param	sendtimeout        5000
	# ns_param	recvtimeout        5000
	# ns_param	waittimeout        1000
	# ns_param	idletimeout        300000

ns_log notice "nsd.tcl: using threadsafe tcl: [info exists tcl_platform(threaded)]"
ns_log notice "nsd.tcl: finished reading config file."
