/*
 *	T T C P . C
 *
 * Test TCP connection.  Makes a connection on port 5001
 * and transfers fabricated buffers or data copied from stdin.
 *
 * Usable on 4.2, 4.3, and 4.1a systems by defining one of
 * BSD42 BSD43 (BSD41a)
 * Machines using System V with BSD sockets should define SYSV.
 *
 * Modified for operation under 4.2BSD, 18 Dec 84
 *      T.C. Slattery, USNA
 * Minor improvements, Mike Muuss and Terry Slattery, 16-Oct-85.
 * Modified in 1989 at Silicon Graphics, Inc.
 *	catch SIGPIPE to be able to print stats when receiver has died 
 *	for tcp, don't look for sentinel during reads to allow small transfers
 *	increased default buffer size to 8K, nbuf to 2K to transfer 16MB
 *	moved default port to 5001, beyond IPPORT_USERRESERVED
 *	make sinkmode default because it is more popular, 
 *		-s now means don't sink/source 
 *	count number of read/write system calls to see effects of 
 *		blocking from full socket buffers
 *	for tcp, -D option turns off buffered writes (sets TCP_NODELAY sockopt)
 *	buffer alignment options, -A and -O
 *	print stats in a format that's a bit easier to use with grep & awk
 *	for SYSV, mimic BSD routines to use most of the existing timing code
 * Modified by Steve Miller of the University of Maryland, College Park
 *	-b sets the socket buffer size (SO_SNDBUF/SO_RCVBUF)
 * Modified Sept. 1989 at Silicon Graphics, Inc.
 *	restored -s sense at request of tcs@brl
 * Modified Oct. 1991 at Silicon Graphics, Inc.
 *	use getopt(3) for option processing, add -f and -T options.
 *	SGI IRIX 3.3 and 4.0 releases don't need #define SYSV.
 *
 * Modified Jul 2001 by Pekka Savola <pekkas@netcore.fi>
 *	implement full IPv6 support (server uses ipv6 mapped addresses for ipv4)
 *	fix a few warnings (from *BSD)
 *	fix loads of more warnings
 *	use snprintf with a few fixed-sized buffers, fix format strings 
 *
 * Modified Oct 2001 by Jaakko Kyrö <jkyro@cs.helsinki.fi>
 *      Added -I option to specify network interface
 *
 * Modified Oct 2002 by Pekka Savola <pekkas@netcore.fi>
 *      fix port selection for >2^15
 *	clean out _cray, sysv etc. cruft, always build with IPv6
 *      major cleanups, should be a bit more readable now
 *
 * Modified Oct 2002 by Stig Venaas <venaas@uninett.no>
 *      added multicast support
 *      added -w option to specify microsecond delay between each write
 *      further cleanups
 * 
 * Modified Oct 2002 by Pekka Savola <pekkas@netcore.fi>
 *      made one variable 'static' to fix compilation on Solaris from <sleinen@switch.ch>
 *
 * Modified Aug 2004 by Stig Venaas <venaas@uninett.no>
 *      Binding to group address when receiving multicast
 *      Added SO_REUSEADDR so multiple processes can listen to same port
 *
 * Modified Dec 2007 by Pekka Savola <pekkas@netcore.fi>
 *      Add error/warning message fixes from Niklas Edmundsson
 *      Some other cleanups as well.
 *
 * Distribution Status -
 *      Public Domain.  Distribution Unlimited.
 */
#ifndef lint
static const char RCSid[] = "ttcp.c $Revision: 1.12 $";
#endif

#include <sys/types.h>
#include <sys/socket.h>
#include <sys/time.h>		/* struct timeval */
#include <sys/resource.h>
#include <net/if.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <arpa/inet.h>

#include <ctype.h>
#include <errno.h>
#include <netdb.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

struct sockaddr_storage frominet;
struct addrinfo hints, *res, *res0;
struct ipv6_mreq mreq6;
struct ip_mreq mreq;

socklen_t fromlen;
int fd;				/* fd of network socket */

int buflen = 8 * 1024;		/* length of buffer */
char *buf;			/* ptr to dynamic buffer */
int nbuf = 2 * 1024;		/* number of buffers to send in sinkmode */

int bufoffset = 0;		/* align buffer to this */
int bufalign = 16*1024;		/* modulo this */

int udp = 0;			/* 0 = tcp, !0 = udp */
int options = 0;		/* socket options */
int one = 1;                    /* for 4.3 BSD style setsockopt() */
char *port = "5001";		/* TCP/UDP port number */
char *host;			/* ptr to name of host */
int trans;			/* 0=receive, !0=transmit mode */
int sinkmode = 0;		/* 0=normal I/O, !0=sink/source mode */
int verbose = 0;		/* 0=print basic info, 1=print cpu rate, proc
				 * resource usage. */
int nodelay = 0;		/* set TCP_NODELAY socket option */
int b_flag = 0;			/* use mread() */
int sockbufsize = 0;		/* socket buffer size to use */
char fmt = 'K';			/* output format: k = kilobits, K = kilobytes,
				 *  m = megabits, M = megabytes, 
				 *  g = gigabits, G = gigabytes */
int touchdata = 0;		/* access data after reading */
static long wrwait = 0;		/* usecs to wait between each write */
int af =  AF_UNSPEC;		/* Address family to be determined */

extern int errno;
extern int optind;
extern char *optarg;

char Usage[] = "\
Usage: ttcp -t [-options] host [ < in ]\n\
       ttcp -r [-options] [multicast-group][ > out]\n\
Common options:\n\
	-4	use IPv4\n\
	-6	use IPv6\n\
	-l ##	length of bufs read from or written to network (default 8192)\n\
	-u	use UDP instead of TCP\n\
	-p ##	port number to send to or listen at (default 5001)\n\
	-s	-t: source a pattern to network\n\
		-r: sink (discard) all data from network\n\
	-A ##	align the start of buffers to this modulus (default 16384)\n\
	-O ##	start buffers at this offset from the modulus (default 0)\n\
	-v	verbose: print more statistics\n\
	-d	set SO_DEBUG socket option\n\
	-b ##	set socket buffer size (if supported)\n\
	-f X	format for rate: k,K = kilo{bit,byte}; m,M = mega; g,G = giga\n\
Options specific to -t:\n\
	-n ##	number of source bufs written to network (default 2048)\n\
	-D	don't buffer TCP writes (sets TCP_NODELAY socket option)\n\
	-w ##	number of microseconds to wait between each write\n\
Options specific to -r:\n\
	-B	for -s, only output full blocks as specified by -l (for TAR)\n\
	-T	\"touch\": access each byte as it's read\n\
        -I if   Specify the network interface (e.g. eth0) to use\n\
";	

char stats[128];
double nbytes;			/* bytes on net */
unsigned long numCalls;		/* # of I/O system calls */
double cput, realt;		/* user, real time (seconds) */

void err();
void mes();
void pattern();
void prep_timer();
double read_timer();
int Nread();
int Nwrite();
void delay();
int mread();
char *outfmt();

int
main(int argc, char **argv)
{
	char *device = NULL;
	int maf = 0;		/* Address family if multicast, else 0 */
	int c;

	if (argc < 2) goto usage;

	while ((c = getopt(argc, argv, "46drstuvBDTb:f:l:n:p:w:A:O:I:")) != -1) {
		switch (c) {
		case '4':
			af = AF_INET;
			break;
		case '6':
			af = AF_INET6;
			break;
		case 'I':
			device = optarg;
			break;
		case 'B':
			b_flag = 1;
			break;
		case 't':
			trans = 1;
			break;
		case 'r':
			trans = 0;
			break;
		case 'd':
			options |= SO_DEBUG;
			break;
		case 'D':
#ifdef TCP_NODELAY
			nodelay = 1;
#else
			fprintf(stderr, 
	"ttcp: -D option ignored: TCP_NODELAY socket option not supported\n");
#endif
			break;
		case 'n':
			nbuf = atoi(optarg);
			break;
		case 'l':
			buflen = atoi(optarg);
			break;
		case 's':
			sinkmode = !sinkmode;
			break;
		case 'p':
			port = optarg;
			break;
		case 'u':
			udp = 1;
			break;
		case 'v':
			verbose = 1;
			break;
		case 'w':
			wrwait = strtol(optarg, (char **)NULL, 10);
			break;
		case 'A':
			bufalign = atoi(optarg);
			break;
		case 'O':
			bufoffset = atoi(optarg);
			break;
		case 'b':
#if defined(SO_SNDBUF) || defined(SO_RCVBUF)
			sockbufsize = atoi(optarg);
#else
			fprintf(stderr, 
"ttcp: -b option ignored: SO_SNDBUF/SO_RCVBUF socket options not supported\n");
#endif
			break;
		case 'f':
			fmt = *optarg;
			break;
		case 'T':
			touchdata = 1;
			break;
		default:
			goto usage;
		}
	}

	memset(&hints, 0, sizeof(hints));
	hints.ai_family = af;
	hints.ai_socktype = udp ? SOCK_DGRAM : SOCK_STREAM;

	if (trans) {
		/* xmitr */
		if (optind == argc)
			goto usage;
		host = argv[optind];
		if (getaddrinfo(host, port, &hints, &res) != 0) {	
			fprintf(stderr, "can't resolve %s port %s\n", host, port);
			exit(1);
		}

		if (udp) {
			/* Check if multicast address */
			if (res->ai_family == AF_INET6) {
                               if (IN6_IS_ADDR_MULTICAST(&((struct sockaddr_in6 *)
                                                           res->ai_addr)->sin6_addr)) {
                                       maf = AF_INET6;
                               }
			} else if (res->ai_family == AF_INET) {
                               if (IN_MULTICAST(ntohl(((struct sockaddr_in *)
                                                 res->ai_addr)->sin_addr.s_addr))) {
                                       maf = AF_INET;
                               }
			}
		}
	} else {
		/* rcvr */
		if (udp && optind < argc) {
			if (inet_pton(AF_INET, argv[optind], &mreq.imr_multiaddr) <= 0) {
                               if (inet_pton(AF_INET6, argv[optind], &mreq6.ipv6mr_multiaddr) <= 0) {
                                       fprintf(stderr, "%s is not a multicast address\n", argv[optind]);
                                       exit(1);
                               }
                               /* IPv6 */
                               if (!IN6_IS_ADDR_MULTICAST(&mreq6.ipv6mr_multiaddr)) {
                                       fprintf(stderr, "%s is not a multicast address\n", argv[optind]);
                                       exit(1);
                               }
                               hints.ai_family = AF_INET6;
                               maf = AF_INET6;
                               mreq6.ipv6mr_interface = 0;
			} else {
                               /* IPv4 */
                               if (!IN_MULTICAST(ntohl(mreq.imr_multiaddr.s_addr))) {
                                       fprintf(stderr, "%s is not a multicast address\n", argv[optind]);
                                       exit(1);
                               }
                               hints.ai_family = AF_INET;
                               maf = AF_INET;
                               mreq.imr_interface.s_addr = INADDR_ANY;
			}
			host = argv[optind];
			hints.ai_flags = AI_NUMERICHOST;
		} else {
			host = NULL;
			hints.ai_flags = AI_PASSIVE;
		}
		if (getaddrinfo(host, port, &hints, &res0) != 0) {
			fprintf(stderr, "can't resolve %s\n", port);
			exit(1);
		}

		/* if libc supports ipv6 but kernel doesn't: get the first one */
		/* XXX: uses ipv6 mapped addresses as generic methods aren't there yet */
		for (res = res0; res; res = res->ai_next) {
			if ((fd = socket(res->ai_family, res->ai_socktype, res->ai_protocol)) > 0)
				break;
		}
	}

	if (udp && buflen < 5) {
	    buflen = 5;		/* send more than the sentinel size */
	}

	if ((buf = (char *)malloc(buflen+bufalign)) == (char *)NULL)
		err("malloc");
	if (bufalign != 0)
		buf +=(bufalign - ((long)buf % bufalign) + bufoffset) % bufalign;

	if (trans) {
		fprintf(stderr, "ttcp-t: buflen=%d, nbuf=%d, align=%d/%d, port=%s",
			buflen, nbuf, bufalign, bufoffset, port);
		if (sockbufsize)
 			fprintf(stderr, ", sockbufsize=%d", sockbufsize);
		fprintf(stderr, "  %s  -> %s\n", udp ? "udp" : "tcp", host);
	} else {
		fprintf(stderr, "ttcp-r: buflen=%d, nbuf=%d, align=%d/%d, port=%s",
 			buflen, nbuf, bufalign, bufoffset, port);
 		if (sockbufsize)
			fprintf(stderr, ", sockbufsize=%d", sockbufsize);
		fprintf(stderr, "  %s\n", udp ? "udp" : "tcp");
	}

	if (!fd) {
		if ((fd = socket(res->ai_family, res->ai_socktype, res->ai_protocol)) < 0)
			err("socket");
	}
	
	if (device) {
		if (maf == AF_INET) {
			/* Not supported, using struct ip_mreq we need to find IP
			 * address of interface, at least linux has ip_mreqn which
			 * uses interface index
			 */
		} else if (maf == AF_INET6) {
			if ((mreq6.ipv6mr_interface = if_nametoindex(device)) == 0) {
				err("unknown device");
			}
		} else {
			struct ifreq ifr;
			memset(&ifr, 0, sizeof(ifr));
			strncpy(ifr.ifr_name, device, IFNAMSIZ-1);
			ifr.ifr_name[IFNAMSIZ-1] = '\0';
#ifdef SO_BINDTODEVICE
			if (setsockopt(fd, SOL_SOCKET, SO_BINDTODEVICE, &ifr,sizeof(ifr)) == -1) {
				err("bind-to-device");
			}
#else
			fprintf(stderr, "ttcp: warning: setting device not supported!\n");
#endif
		}
	}
	mes("socket");

	if (maf == AF_INET) {
		if (trans) {
			/* set hop limit, default 1. Should perhaps be an option */
			int ttl=30;
			setsockopt(fd, IPPROTO_IP, IP_MULTICAST_TTL, (char *)&ttl, sizeof(ttl));
		} else {
			/* join the group */
			setsockopt(fd, IPPROTO_IP, IP_ADD_MEMBERSHIP, &mreq, sizeof(mreq));
		}
	} else if (maf == AF_INET6) {
		if (trans) {
			/* set hop limit, default 1. Should perhaps be an option */
			int hops=30;
			setsockopt(fd, IPPROTO_IPV6, IPV6_MULTICAST_HOPS, (char *)&hops, sizeof(hops));
		} else {
			/* join the group */
			setsockopt(fd, IPPROTO_IPV6, IPV6_JOIN_GROUP, &mreq6, sizeof(mreq6));
		}
	}

	if (!trans) {
#ifdef SO_REUSEADDR		
		if (setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one)) == -1)
			err("reuseaddr");
#endif
		if (bind(fd, res->ai_addr, res->ai_addrlen) < 0)
			err("bind");
	}

#if defined(SO_SNDBUF) || defined(SO_RCVBUF)
	if (sockbufsize) {
	    if (trans) {
		if (setsockopt(fd, SOL_SOCKET, SO_SNDBUF, &sockbufsize,
		    sizeof sockbufsize) < 0)
			err("setsockopt: sndbuf");
		mes("sndbuf");
	    } else {
		if (setsockopt(fd, SOL_SOCKET, SO_RCVBUF, &sockbufsize,
		    sizeof sockbufsize) < 0)
			err("setsockopt: rcvbuf");
		mes("rcvbuf");
	    }
	}
#endif

	if (!udp)  {
	    signal(SIGPIPE, SIG_IGN);
	    if (trans) {
		/* We are the client if transmitting */
		if (options)  {
			if (setsockopt(fd, SOL_SOCKET, options, &one, sizeof(one)) < 0)
				err("setsockopt");
		}
#ifdef TCP_NODELAY
		if (nodelay) {
			struct protoent *p;
			p = getprotobyname("tcp");
			if (p && setsockopt(fd, p->p_proto, TCP_NODELAY, 
			    &one, sizeof(one)) < 0)
				err("setsockopt: nodelay");
			mes("nodelay");
		}
#endif
		if (connect(fd, res->ai_addr, res->ai_addrlen) < 0)
			err("connect");
		mes("connect");
	    } else {
		/* otherwise, we are the server and 
	         * should listen for the connections
	         */
		listen(fd, 0);   /* allow a queue of 0 */
		if (options) {
			if (setsockopt(fd, SOL_SOCKET, options, &one, sizeof(one)) < 0)
				err("setsockopt");
		}
		fromlen = sizeof(frominet);

		if ((fd = accept(fd, (struct sockaddr*)&frominet, &fromlen)) < 0)
			err("accept");
		{ 
		  struct sockaddr_storage peer;
		  char addr_buf[NI_MAXHOST];
		  socklen_t peerlen = sizeof(peer);
		  
		  if (getpeername(fd, (struct sockaddr*) &peer, &peerlen) < 0)
			err("getpeername");
		  if (getnameinfo((struct sockaddr *) &peer, res->ai_addrlen, addr_buf, 
		  		sizeof(addr_buf), NULL, 0, NI_NUMERICHOST))
		  	err("getnameinfo");
		  fprintf(stderr,"ttcp-r: accept from %s\n", addr_buf);
		}
	    }
	}
	prep_timer();
	errno = 0;
	if (sinkmode) {      
		register int cnt;
		if (trans) {
			pattern(buf, buflen);
			if (udp)
				(void)Nwrite(fd, buf, 4); /* rcvr start */
			while (nbuf-- && Nwrite(fd, buf, buflen) == buflen)
				nbytes += buflen;
			if (udp)
				(void)Nwrite(fd, buf, 4); /* rcvr end */
		} else {
			if (udp) {
			    while ((cnt = Nread(fd, buf, buflen)) > 0)  {
				    static int going = 0;
				    if (cnt <= 4) {
					    if (going)
						    break;	/* "EOF" */
					    going = 1;
					    prep_timer();
				    } else
					    nbytes += cnt;
			    }
			} else {
			    while ((cnt = Nread(fd, buf, buflen)) > 0)  {
				    nbytes += cnt;
			    }
			}
		}
	} else {
		register int cnt;
		if (trans) {
			while ((cnt = read(0, buf, buflen)) > 0 &&
			    Nwrite(fd, buf, cnt) == cnt)
				nbytes += cnt;
		} else {
			while ((cnt = Nread(fd, buf, buflen)) > 0 &&
			    write(1, buf, cnt) == cnt)
				nbytes += cnt;
		}
	}
	if (errno)
		err("IO");
	(void)read_timer(stats, sizeof(stats));
	if (udp && trans)  {
		(void)Nwrite(fd, buf, 4); /* rcvr end */
		(void)Nwrite(fd, buf, 4); /* rcvr end */
		(void)Nwrite(fd, buf, 4); /* rcvr end */
		(void)Nwrite(fd, buf, 4); /* rcvr end */
	}
	if (cput <= 0.0)
		cput = 0.001;
	if (realt <= 0.0)
		realt = 0.001;
	fprintf(stderr,
		"ttcp%s: %.0f bytes in %.2f real seconds = %s/sec +++\n",
		trans ? "-t" : "-r",
		nbytes, realt, outfmt(nbytes/realt));
	if (verbose) {
	    fprintf(stderr,
		"ttcp%s: %.0f bytes in %.2f CPU seconds = %s/cpu sec\n",
		trans ? "-t" : "-r",
		nbytes, cput, outfmt(nbytes/cput));
	}
	fprintf(stderr,
		"ttcp%s: %ld I/O calls, msec/call = %.2f, calls/sec = %.2f\n",
		trans ? "-t" : "-r",
		numCalls,
		1024.0 * realt/((double)numCalls),
		((double)numCalls)/realt);
	fprintf(stderr, "ttcp%s: %s\n", trans ? "-t" : "-r", stats);
	if (verbose) {
	    fprintf(stderr,
		"ttcp%s: buffer address %p\n",
		trans ? "-t" : "-r",
		buf);
	}
	exit(0);

usage:
	fprintf(stderr, "%s", Usage);
	exit(1);
}

void
err(char *s)
{
	fprintf(stderr, "ttcp%s: ", trans ? "-t" : "-r");
	perror(s);
	fprintf(stderr, "errno=%d\n", errno);
	exit(1);
}

void
mes(char *s)
{
	fprintf(stderr, "ttcp%s: %s\n", trans ? "-t" : "-r", s);
}

void
pattern(register char *cp, register int cnt)
{
	register char c;
	c = 0;
	while (cnt-- > 0) {
		while (!isprint((c&0x7F))) c++;
		*cp++ = (c++&0x7F);
	}
}

char *
outfmt(double b)
{
    static char obuf[50];
    switch (fmt) {
	case 'G':
	    snprintf(obuf, sizeof(obuf), "%.2f GB", b / 1024.0 / 1024.0 / 1024.0);
	    break;
	default:
	case 'K':
	    snprintf(obuf, sizeof(obuf), "%.2f KB", b / 1024.0);
	    break;
	case 'M':
	    snprintf(obuf, sizeof(obuf), "%.2f MB", b / 1024.0 / 1024.0);
	    break;
	case 'g':
	    snprintf(obuf, sizeof(obuf), "%.2f Gbit", b * 8.0 / 1024.0 / 1024.0 / 1024.0);
	    break;
	case 'k':
	    snprintf(obuf, sizeof(obuf), "%.2f Kbit", b * 8.0 / 1024.0);
	    break;
	case 'm':
	    snprintf(obuf, sizeof(obuf), "%.2f Mbit", b * 8.0 / 1024.0 / 1024.0);
	    break;
    }
    return obuf;
}

static struct	timeval time0;	/* Time at which timing started */
static struct	rusage ru0;	/* Resource utilization at the start */

static void prusage();
static void tvadd();
static void tvsub();
static void psecs();

/*
 *			P R E P _ T I M E R
 */
void
prep_timer()
{
	gettimeofday(&time0, (struct timezone *)0);
	getrusage(RUSAGE_SELF, &ru0);
}

/*
 *			R E A D _ T I M E R
 * 
 */
double
read_timer(char *str, int len)
{
	struct timeval timedol;
	struct rusage ru1;
	struct timeval td;
	struct timeval tend, tstart;
	char line[132];

	getrusage(RUSAGE_SELF, &ru1);
	gettimeofday(&timedol, (struct timezone *)0);
	prusage(&ru0, &ru1, &timedol, &time0, line);
	/* XXX: buffer overflow if len > sizeof(line) */
	(void)strncpy(str, line, len);

	/* Get real time */
	tvsub(&td, &timedol, &time0);
	realt = td.tv_sec + ((double)td.tv_usec) / 1000000;

	/* Get CPU time (user+sys) */
	tvadd(&tend, &ru1.ru_utime, &ru1.ru_stime);
	tvadd(&tstart, &ru0.ru_utime, &ru0.ru_stime);
	tvsub(&td, &tend, &tstart);
	cput = td.tv_sec + ((double)td.tv_usec) / 1000000;
	if (cput < 0.00001)
		cput = 0.00001;
	return(cput);
}

static void
prusage(register struct rusage *r0, register struct rusage *r1,
	struct timeval *e, struct timeval *b, char *outp)
{
	struct timeval tdiff;
	register time_t t;
	register char *cp;
	register int i;
	int ms;

	t = (r1->ru_utime.tv_sec-r0->ru_utime.tv_sec)*100+
	    (r1->ru_utime.tv_usec-r0->ru_utime.tv_usec)/10000+
	    (r1->ru_stime.tv_sec-r0->ru_stime.tv_sec)*100+
	    (r1->ru_stime.tv_usec-r0->ru_stime.tv_usec)/10000;
	ms = (e->tv_sec-b->tv_sec)*100 + (e->tv_usec-b->tv_usec)/10000;

#define END(x)	{while(*x) x++;}
	cp = "%Uuser %Ssys %Ereal %P %Xi+%Dd %Mmaxrss %F+%Rpf %Ccsw";
	for (; *cp; cp++) {
		if (*cp != '%')
			*outp++ = *cp;
		else if (cp[1]) switch(*++cp) {

		case 'U':
			tvsub(&tdiff, &r1->ru_utime, &r0->ru_utime);
			sprintf(outp, "%ld.%01ld", tdiff.tv_sec, tdiff.tv_usec/100000);
			END(outp);
			break;

		case 'S':
			tvsub(&tdiff, &r1->ru_stime, &r0->ru_stime);
			sprintf(outp, "%ld.%01ld", tdiff.tv_sec, tdiff.tv_usec/100000);
			END(outp);
			break;

		case 'E':
			psecs(ms / 100, outp);
			END(outp);
			break;

		case 'P':
			sprintf(outp, "%d%%", (int) (t*100 / ((ms ? ms : 1))));
			END(outp);
			break;

		case 'W':
			i = r1->ru_nswap - r0->ru_nswap;
			sprintf(outp, "%d", i);
			END(outp);
			break;

		case 'X':
			sprintf(outp, "%ld", t == 0 ? 0 : (r1->ru_ixrss-r0->ru_ixrss)/t);
			END(outp);
			break;

		case 'D':
			sprintf(outp, "%ld", t == 0 ? 0 :
			    (r1->ru_idrss+r1->ru_isrss-(r0->ru_idrss+r0->ru_isrss))/t);
			END(outp);
			break;

		case 'K':
			sprintf(outp, "%ld", t == 0 ? 0 :
			    ((r1->ru_ixrss+r1->ru_isrss+r1->ru_idrss) -
			    (r0->ru_ixrss+r0->ru_idrss+r0->ru_isrss))/t);
			END(outp);
			break;

		case 'M':
			sprintf(outp, "%ld", r1->ru_maxrss/2);
			END(outp);
			break;

		case 'F':
			sprintf(outp, "%ld", r1->ru_majflt-r0->ru_majflt);
			END(outp);
			break;

		case 'R':
			sprintf(outp, "%ld", r1->ru_minflt-r0->ru_minflt);
			END(outp);
			break;

		case 'I':
			sprintf(outp, "%ld", r1->ru_inblock-r0->ru_inblock);
			END(outp);
			break;

		case 'O':
			sprintf(outp, "%ld", r1->ru_oublock-r0->ru_oublock);
			END(outp);
			break;
		case 'C':
			sprintf(outp, "%ld+%ld", r1->ru_nvcsw-r0->ru_nvcsw,
				r1->ru_nivcsw-r0->ru_nivcsw );
			END(outp);
			break;
		}
	}
	*outp = '\0';
}

static void
tvadd(struct timeval *tsum, struct timeval *t0, struct timeval *t1)
{
	tsum->tv_sec = t0->tv_sec + t1->tv_sec;
	tsum->tv_usec = t0->tv_usec + t1->tv_usec;
	if (tsum->tv_usec > 1000000)
		tsum->tv_sec++, tsum->tv_usec -= 1000000;
}

static void
tvsub(struct timeval *tdiff, struct timeval *t1, struct timeval *t0)
{
	tdiff->tv_sec = t1->tv_sec - t0->tv_sec;
	tdiff->tv_usec = t1->tv_usec - t0->tv_usec;
	if (tdiff->tv_usec < 0)
		tdiff->tv_sec--, tdiff->tv_usec += 1000000;
}

static void
psecs(long l, register char *cp)
{
	register int i;

	i = l / 3600;
	if (i) {
		sprintf(cp, "%d:", i);
		END(cp);
		i = l % 3600;
		sprintf(cp, "%d%d", (i/60) / 10, (i/60) % 10);
		END(cp);
	} else {
		i = l;
		sprintf(cp, "%d", i / 60);
		END(cp);
	}
	i %= 60;
	*cp++ = ':';
	sprintf(cp, "%d%d", i / 10, i % 10);
}

/*
 *			N R E A D
 */
int
Nread(int fd, void *buf, int count)
{
	struct sockaddr_in from;
	socklen_t len = sizeof(from);
	register int cnt;
	if (udp) {
		cnt = recvfrom(fd, buf, count, 0, (struct sockaddr *)&from, &len);
		numCalls++;
	} else {
		if (b_flag)
			cnt = mread(fd, buf, count);	/* fill buf */
		else {
			cnt = read(fd, buf, count);
			numCalls++;
		}
		if (touchdata && cnt > 0) {
			register int c = cnt, sum = 0;
			register char *b = buf;
			while (c--)
				sum += *b++;
		}
	}
	return(cnt);
}

/*
 *			N W R I T E
 */
int
Nwrite(int fd, void *buf, int count)
{
	register int cnt;
	if (udp) {
again:
		cnt = sendto(fd, buf, count, 0, res->ai_addr, res->ai_addrlen);
		numCalls++;
		if (cnt<0 && errno == ENOBUFS)  {
			delay(18000);
			errno = 0;
			goto again;
		}
	} else {
		cnt = write(fd, buf, count);
		numCalls++;
	}
	if (wrwait)
		delay(wrwait);
	return(cnt);
}

void
delay(int us)
{
	struct timeval tv;

	tv.tv_sec = 0;
	tv.tv_usec = us;
	(void)select(1, NULL, NULL, NULL, &tv);
}

/*
 *			M R E A D
 *
 * This function performs the function of a read(II) but will
 * call read(II) multiple times in order to get the requested
 * number of characters.  This can be necessary because
 * network connections don't deliver data with the same
 * grouping as it is written with.  Written by Robert S. Miles, BRL.
 */
int
mread(int fd, register char *bufp, unsigned int n)
{
	register unsigned	count = 0;
	register int		nread;

	do {
		nread = read(fd, bufp, n-count);
		numCalls++;
		if(nread < 0)  {
			perror("ttcp_mread");
			return(-1);
		}
		if(nread == 0)
			return((int)count);
		count += (unsigned)nread;
		bufp += nread;
	 } while(count < n);

	return((int)count);
}
