/*  Ultra-fast dhcp discovery
 * 
 *  $Id: dhcp_discover.c,v 2004/01/03 20:31:01 mike Exp $
 *       dhd.c,v LatinSuD 2006
 *
 *  Compile:
 *     gcc -o dhd dhd.c -lnet -lpcap -lpthread
 *
 *  Example usage:
 *     dhd
 *     dhd eth0
 *
 *  Example output:
 *      #0:
 *              SERVER-MAC: 00:01:38:12:34:56
 *                     IP: 192.168.1.1
 *              CLIENT-MAC: 00:0e:35:ab:cd:ef
 *                     IP: 192.168.1.40
 *
 *              >> "0  "0
 *
 *      Dhd injects 10 dhcp requests on interface. In this case,
 *       it has been received a response, numbered as "0".
 *       Later, response 0 was received twice more.
 */

#define DHD_VERSION "2.1"

/*
 *  Changes:
 *  2.1 (2007-04-07):
 *  	- Identify equivalent packets with different time fields
 *  	- Add domain-suffix field
 *  	- Minor cleanup & enhanced usage help
 *  	
 *  2.0 (2006-??-??):
 *  	- Beautify printf
 *
 *  libnet 1.1
 *  Build a DHCP discover packet
 *  To view: /usr/sbin/tcpdump -vvvvven -s 4096 'port 67 or port 68'
 *
 *  Copyright (c) 1998 - 2004 Mike D. Schiffman <mike@infonexus.com>
 *  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 */

#include <stdio.h>
#include <libnet.h>
#include <stdio.h>
#include <pcap.h>
#include <resolv.h>
#include <unistd.h>
#include <pthread.h>
#include <string.h>

/* Ethernet addresses are 6 bytes */
#ifndef ETHER_ADDR_LEN
#define ETHER_ADDR_LEN    6
#endif

/* Ethernet header */
struct sniff_ethernet {
    u_char ether_dhost[ETHER_ADDR_LEN]; /* Destination host address */
    u_char ether_shost[ETHER_ADDR_LEN]; /* Source host address */
    u_short ether_type;         /* IP? ARP? RARP? etc */
};

/* IP header */
struct sniff_ip {
    u_char ip_vhl;              /* version << 4 | header length >> 2 */
    u_char ip_tos;              /* type of service */
    u_short ip_len;             /* total length */
    u_short ip_id;              /* identification */
    u_short ip_off;             /* fragment offset field */
    u_char ip_ttl;              /* time to live */
    u_char ip_p;                /* protocol */
    u_short ip_sum;             /* checksum */
    struct in_addr ip_src, ip_dst;      /* source and dest address */
};

typedef struct {
    u_short uh_sport;           /* source port */
    u_short uh_dport;           /* destination port */

    u_short len;
    u_short chk;

    unsigned char type;
    char a;
    char b;
    char c;
    u_short d;
    u_short e;
} sniff_udp;

/* ethernet headers are always exactly 14 bytes */
int SIZE_ETHERNET = 14;
#define IP_HL(ip)        (((ip)->ip_vhl) & 0x0f)
#define IP_V(ip)        (((ip)->ip_vhl) >> 4)

const struct sniff_ethernet *ethernet;  /* The ethernet header */
struct sniff_ip *ip;            /* The IP header */
const struct sniff_tcp *tcp;    /* The TCP header */
const char *payload;            /* Packet payload */

pthread_t sniffer, injector;

void print_mac(unsigned char *packet, int moffset)
{
    int i;
    if (moffset > 80)
        exit(0);
    for (i = 0; i < 6; i++)
        printf("%02x%c", packet[i + moffset], (i < 5) ? ':' : '\0');
}

void print_ip(unsigned char *ip, int offset)
{
    int i;

    for (i = 0; i < 4; i++) {
        printf("%d", ip[i + offset]);
        if (i < 3)
            printf(".");
    }
}

#define DNS  0
#define MASK 1
#define CIP  2
#define SIP  3
#define GW   4

int didCR = 1;

#define HASH 8
#define PCACHE 256
int h_pack[PCACHE];
int n_pack = 0;

unsigned int miChecksum(u_char * packet, int len)
{
    int i;
    int s1 = 0;
    int s2 = 0;
    u_char * ptr=packet;

    while (ptr - packet < len - 1) {
        if (ptr - packet + ptr[1] + 2 > len) 
            break;

	// ignore time dependent fields
        if (ptr[0]==2 || ptr[0]==51 || ptr[0]==58 || ptr[0]==59) {
            ptr += 2 + ptr[1];
	    continue;
        }

        for (i = 0; i < ptr[1]+2; i++) {
            s1 += ptr[i] * i;
            s2 += ptr[i];
        }

        ptr += 2 + ptr[1];
    }

    return s1 + (s2 << 16);
}

// Caches known packets, so they are printed only once
int cache_packet(u_char * packet, int len, int *num)
{
    int i;
    int hash = miChecksum(packet, len);

    for (i = 0; i < n_pack; i++) {
        if (h_pack[i] == hash) {
            *num = i;
            return 0;
        }
    }

    if (n_pack < PCACHE) {
        h_pack[n_pack] = hash;
        *num = n_pack;
        n_pack++;
    }
    return -1;
}

// Pcap callback that does all the work
void got_packet(u_char * args, const struct pcap_pkthdr *header,
                const u_char * packet)
{
    sniff_udp *udp;
    int i;
    uint size_ip;
    u_char *ptr;
    int idx;
    int dijoIp = 0;

    ethernet = (struct sniff_ethernet *) (packet);
    ip = (struct sniff_ip *) (packet + SIZE_ETHERNET);
    size_ip = (IP_HL(ip)) * 4;

    udp = (sniff_udp *) (packet + SIZE_ETHERNET + size_ip);

    if (*(((char *) udp) + 8) != 2)
        return;

    ptr = ((unsigned char *) udp) + 0xf8;

    if (cache_packet(ptr, header->len - (ptr - packet), &idx) == 0) {
        // packet already in cache, show only reference number
        if (didCR)
            printf("\n >>");
        printf(" \"%d ", idx);
        didCR = 0;
        return;
    } else {
        // start dissecting packet
        puts("");
        if (!didCR)
            puts("");
        printf(" #%d:\n", idx);
    }

    printf("\tSERVER-MAC: \x1b[1m");
    print_mac((unsigned char *) packet, 6);
    printf("\x1b[0m\n");

    // print only known interesting fields
    while (ptr - packet < header->len - 1) {
    	if (ptr - packet + ptr[1] + 2 > header->len) 
		break;

        if (ptr[0] == 6) {
            printf("\tDNS: \x1b[1m");
            for (i = 0; i < (ptr[1] / 4); i++) {
                if (i != 0)
                    printf(", ");
                print_ip(ptr, 2 + 4 * i);
            }
            printf("\x1b[0m\n");

        } else if (ptr[0] == 1) {

            printf("\t       MASK: \x1b[1m");
            print_ip(ptr, 2);
            printf("\x1b[0m\n");

        } else if (ptr[0] == 54) {
            printf("\t       IP: \x1b[1m");
            print_ip(ptr, 2);
            printf("\x1b[0m\n");
            printf("\tCLIENT-MAC: \x1b[1m");
            print_mac((unsigned char *) udp, 0x24);
            printf("\x1b[0m\n");
            printf("\t       IP: \x1b[1m");
            print_ip((unsigned char *) udp, 0x18);
            printf("\x1b[0m\n");
            dijoIp = 1;

        } else if (ptr[0] == 15) {
            printf("\tDOMAIN-SUFFIX: \x1b[1m");
	    for (i=0; i<ptr[1]; i++)
	        printf("%c", (ptr[2+i]>=0x20 && ptr[2+i]<0x7F)?ptr[2+i]:' ');
            printf("\x1b[0m\n");

	} else if (ptr[0] == 3) {
            printf("\tGW: \x1b[1m");
            print_ip(ptr, 2);
            printf("\x1b[0m\n");

        } else if (ptr[0] == 53) {
            if (ptr[2] != 2)
                break;
        }
        ptr += 2 + ptr[1];
    }
    if (!dijoIp) {
        printf("\tCLIENT-IP: \x1b[1m");
        print_ip((unsigned char *) udp, 0x18);
        printf("\x1b[0m\n");
    }

    didCR = 1;
}


void usage(char *prog)
{
    fprintf(stderr, "DHD " DHD_VERSION " - A fast DHcp Discover tool.\nUsage: dhd [INTERFACE]\n\tIf no INTERFACE is given, it will write on all available interfaces and sniff on any.\n");
    exit(1);
}

typedef struct {
    char *intf;
    libnet_t *l;
    pcap_t *pcap;
    struct libnet_ether_addr *ethaddr;
} context;

struct libnet_stats ls;
u_char *options;

void init_libnet(context * c)
{
    char errbuf[LIBNET_ERRBUF_SIZE];
    int i;

    c->l = libnet_init(LIBNET_LINK,     // injection type
                       c->intf, // network interface
                       errbuf); // errbuf
    if (!c->l) {
        fprintf(stderr, "libnet_init: %s", errbuf);
        exit(EXIT_FAILURE);
    }

    if ((c->ethaddr = libnet_get_hwaddr(c->l)) == NULL) {
        fprintf(stderr, "libnet_get_hwaddr: %s\n", libnet_geterror(c->l));
        exit(EXIT_FAILURE);
    }
    for (i = 0; i < 6; i++) {
        fprintf(stderr, "%02x", c->ethaddr->ether_addr_octet[i]);
        if (i != 5) {
            fprintf(stderr, ":");
        }
    }

}



void init_packet(context * c)
{

    u_long options_len, orig_len;
    int i;

    libnet_ptag_t t;
    libnet_ptag_t ip;
    libnet_ptag_t udp;
    libnet_ptag_t dhcp;


    u_char options_req[] =
        { LIBNET_DHCP_SUBNETMASK, LIBNET_DHCP_BROADCASTADDR,
        LIBNET_DHCP_TIMEOFFSET, LIBNET_DHCP_ROUTER, LIBNET_DHCP_DOMAINNAME,
        LIBNET_DHCP_DNS,
        LIBNET_DHCP_HOSTNAME
    };
    u_char enet_dst[6] = { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
    u_char *tmp;

    // build options packet
    i = 0;
    options_len = 3;            // update total payload size

    // we are a discover packet
    options = malloc(3);
    options[i++] = LIBNET_DHCP_MESSAGETYPE;     // type
    options[i++] = 1;           // len
    options[i++] = LIBNET_DHCP_MSGDISCOVER;     // data

    orig_len = options_len;
    options_len += sizeof(options_req) + 2;     // update total payload size

    // workaround for realloc on old machines
    // options = realloc(options, options_len); // resize options buffer
    tmp = malloc(options_len);
    memcpy(tmp, options, orig_len);
    free(options);
    options = tmp;

    // we are going to request some parameters
    options[i++] = LIBNET_DHCP_PARAMREQUEST;    // type
    options[i++] = sizeof(options_req); // len
    memcpy(options + i, options_req, sizeof(options_req));      // data
    i += sizeof(options_req);


    // end our options packet
    // workaround for realloc on old machines
    // options = realloc(options, options_len); // resize options buffer
    orig_len = options_len;
    options_len += 1;
    tmp = malloc(options_len);
    memcpy(tmp, options, orig_len);
    free(options);
    options = tmp;
    options[i++] = LIBNET_DHCP_END;


    // make sure we are at least the minimum length, if not fill
    // this could go in libnet, but we will leave it in the app for now
    if (options_len + LIBNET_DHCPV4_H < LIBNET_BOOTP_MIN_LEN) {
        orig_len = options_len;
        options_len = LIBNET_BOOTP_MIN_LEN - LIBNET_DHCPV4_H;

        // workaround for realloc on old machines
        // options = realloc(options, options_len);
        tmp = malloc(options_len);
        memcpy(tmp, options, orig_len);
        free(options);
        options = tmp;

        memset(options + i, 0, options_len - i);
    }
    // the goodies are here
    dhcp = libnet_build_dhcpv4(LIBNET_DHCP_REQUEST,     // opcode
                               1,       // hardware type
                               6,       // hardware address length
                               0,       // hop count
                               0xdeadbeee,      // transaction id
                               0,       // seconds since bootstrap
                               0x8000,  // flags
                               0,       // client ip
                               0,       // your ip
                               0,       // server ip
                               0,       // gateway ip
                               c->ethaddr->ether_addr_octet,    // client hardware addr
                               //unamac,                      // client hardware addr
                               NULL,    // server host name
                               NULL,    // boot file
                               options, // dhcp options stuck in payload since it is dynamic
                               options_len,     // length of options
                               c->l,    // libnet handle 
                               0);      // libnet id 

    // wrap it
    udp = libnet_build_udp(68,  // source port
                           67,  // destination port
                           LIBNET_UDP_H + LIBNET_DHCPV4_H + options_len,        // packet size
                           0,   // checksum
                           NULL,        // payload 
                           0,   // payload size 
                           c->l,        // libnet handle 
                           0);  // libnet id 

    // hook me up with some ipv4
    ip = libnet_build_ipv4(LIBNET_IPV4_H + LIBNET_UDP_H + LIBNET_DHCPV4_H + options_len,        // length
                           0x10,        // TOS
                           0,   // IP ID
                           0,   // IP Frag 
                           16,  // TTL
                           IPPROTO_UDP, // protocol
                           0,   // checksum
                           inet_addr("0.0.0.0"),        // src ip
                           inet_addr("255.255.255.255"),        // destination ip
                           NULL,        // payload
                           0,   // payload size
                           c->l,        // libnet handle
                           0);  // libnet id

    // we can just autobuild since we arent doing anything tricky
    t = libnet_autobuild_ethernet(enet_dst,     // ethernet destination
                                  ETHERTYPE_IP, // protocol type
                                  c->l);        // libnet handle
}

int init_pcap(char *intf)
{
    char errbuf[PCAP_ERRBUF_SIZE];
    pcap_t *pcap;
    struct bpf_program fp;      /* The compiled filter expression */
    char filter_exp[] = "udp and (port 67 or port 68)"; /* The filter expression */
    bpf_u_int32 net = 0;        /* The IP of our sniffing device */
    setbuf(stdout, 0);

    //pcap = pcap_open_offline("sample.cap", errbuf);
    pcap = pcap_open_live(intf, BUFSIZ, 0, 1000, errbuf);
    if (pcap == NULL) {
        fprintf(stderr, "Couldn't open device %s: %s\n", "any", errbuf);
        return (2);
    }

    if (pcap_compile(pcap, &fp, filter_exp, 0, net) == -1) {
        fprintf(stderr, "Couldn't parse filter %s: %s\n", filter_exp,
                pcap_geterr(pcap));
        return (2);
    }
    if (pcap_setfilter(pcap, &fp) == -1) {
        fprintf(stderr, "Couldn't install filter %s: %s\n", filter_exp,
                pcap_geterr(pcap));
        return (2);
    }
    if (pcap_datalink(pcap) == DLT_LINUX_SLL)
        SIZE_ETHERNET = 16;
    //if (pcap_datalink (pcap) == DLT_EN10MB);

    pcap_loop(pcap, -1, got_packet, (unsigned char *) errbuf);

    return (0);
}


void inyecta(context * c)
{
    // write to the wire
    if (libnet_write(c->l) == -1) {
        fprintf(stderr, " dhd: libnet_write: %s\n", strerror(errno));
    }
}

void end_libnet(context * c)
{
    libnet_destroy(c->l);

    // free mem
    free(options);

    exit(0);
}

int get_datalink(char *intf)
{
    int res;
    pcap_t *handle;
    char buf[8192];
    handle = pcap_open_live(intf, 0, 0, 0, buf);
    if (!handle) {
        //printf("NOP SE PUDO ABRIR [%s] : %s\n", intf, buf);
        return 0;
    }
    res = pcap_datalink(handle);
    //printf(" :%s: ", pcap_datalink_val_to_description(res));
    pcap_close(handle);
    return res;
}

context ifaces[16];
int nIfaces = 0;

void init_iface(char * iface) {
    if (get_datalink(iface) == DLT_EN10MB) {
        ifaces[nIfaces].intf = strdup(iface);
        fprintf(stderr, "Injecting on %s (",
               ifaces[nIfaces].intf);
        init_libnet(&ifaces[nIfaces]);
        fprintf(stderr, ")\n");
        init_packet(&ifaces[nIfaces]);
        nIfaces++;
    }
}

void init_all_ifaces()
{
    FILE *f;
    char *i1, *i2;
    char buf[1024];
    f = fopen("/proc/net/dev", "r");
    if (!f)
        return;

    while (fgets(buf, 1023, f) && nIfaces<16) {
        i1 = buf;
        while (*i1 == ' ')
            i1++;

        i2 = i1;
        while (*i2 != '\0') {
            if (*i2 == ':') {
                *i2 = '\0';
                if (strcmp(i1, "lo")) {
			init_iface(i1);
                }
            }
            i2++;
        }
    }
}

void *esnifa(void *data)
{
    fprintf(stderr, "Sniffing on %s\n", (char *) data);
    init_pcap((char *) data);

    return NULL;
}

int main(int argc, char *argv[])
{
    int i, j, dormir;

    if (getuid() != 0) {
	    fprintf(stderr, "Need to be root!\n");
	    return -1;
    }	    
    
    setbuf(stdout, 0);
    dormir = 100;

    // init
    if (argc == 1) {
        pthread_create(&sniffer, NULL, esnifa, "any");
        init_all_ifaces();
    } else if (argc == 2) {
    	if (!strcmp(argv[1],"-h") || !strcmp(argv[1],"--help"))
		usage(argv[0]);
        pthread_create(&sniffer, NULL, esnifa, (void *) argv[1]);
	init_iface(argv[1]);
    } else {
    	fprintf(stderr, "Only 1 interface can be specified!\n");
	usage(argv[0]);
    }

    // inject all packets on all ifaces
    for (i = 0; i < 10; i++) {
        usleep(dormir * 1000);
        for (j = 0; j < nIfaces; j++) {
            inyecta(&ifaces[j]);
        }
        dormir = dormir + 100;
    }

    usleep(250000);
    if (!didCR)
        puts("");

    for (j = 0; j < nIfaces; j++)
        end_libnet(&ifaces[j]);

    return 0;
}
