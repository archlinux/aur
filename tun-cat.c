/*
Tunnel-cat - Transferring settings through a non-configured IP tunnel.

Copyright (C) 2014 Natrio <natrio@list.ru>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <time.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <net/if.h>
#include <net/ethernet.h>
#include <netinet/in.h>
#include <netpacket/packet.h>
#include <signal.h>

#define SEND_NUM 4
#define SEND_INT 250000000 //(nanosec) 0.25 sec
#define IF_ALIVE 200000   //(microsec) 0.2  sec
#define DEF_TIMEOUT 10 //sec

#define ROLE argv[1]
#define INTERFACE argv[2]
#define PORT atoi(argv[3])
#define TIMEOUT atoi(argv[4])
#define ARGP 4

#define IPv       (*raw & 0xF0) >> 4
#define IP_HLEN   (size_t)( (*raw & 0x0F) << 2 )
#define IP_SRC    *(u_int32_t*)(raw + 12)
#define IP_DST    *(u_int32_t*)(raw + 16)
#define IP_PROTO  *(raw + 9)
#define UDP       0x11
#define UDP_HLEN  8
#define UDP_DPORT *(uint16_t*)(udp_header + 2)
#define UDP_SUM   *(uint16_t*)(udp_header + 6)
#define OVERHEAD  28  // min IP+UDP headers size

/* Start of get_sum() */
uint16_t get_sum(char *hdr, int len, uint16_t *pshdr, int pslen) {
    
 register int sum;
 uint16_t answer;
 register uint16_t *w;
 register int nleft;
    
 /*
 * Our algorithm is simple, using a 32-bit accumulator (sum),
 * we add sequential 16-bit words to it, and at the end, fold back 
 * all the carry bits from the top 16 bits into the lower 16 bits. 
 */

 sum = 0;
 w = pshdr;
 nleft = pslen;
 while (nleft > 1) {
  sum += ntohs(*w++);
  nleft -= 2;
 }

 w = (uint16_t*)hdr;
 nleft = len;
 while (nleft > 1) {
  sum += ntohs(*w++);
  nleft -= 2;
 }

 /* mop up an odd byte, if necessary */
 answer = 0;
 if (nleft == 1) {
  *(u_char *)(&answer) = *(u_char *)w ;
  sum += ntohs(answer);
 }

 /*  add back carry outs from top 16 bits to low 16 bits */
 sum = (sum >> 16) + (sum &0xffff); /* add hi 16 to low 16 */
 sum += (sum >> 16); /* add carry */
 answer = ~sum; /* truncate to 16 bits */ 
 return(htons(answer));
} /* End of get_sum() */

void usage(void)
{
 fprintf( stderr,
  " Tunnel-cat version 1.5\n"
  "Transferring settings through a non-configured IP tunnel.\n\n"
  " Usage:\ntun-cat send <interface> <port> ...\n"
  "tun-cat listen <interface> <port> [<timeout>]\n" );
 fclose(stderr);
 exit(1);
}

void pr_error(int err, char *errpref)
{
 perror(errpref);
 fclose(stderr);
 exit(err);
}

char *net_ifname;
int countdown;

void net_gone()
{
 fprintf(stderr, "Network interface %s was gone\n", net_ifname);
 fclose(stderr);
 exit(3);
}

void alarm_handler(int sig)
{
 if(sig==SIGALRM && if_nametoindex(net_ifname)<=0)
  net_gone();

 if( countdown!=0 && --countdown <= 0)
 {
  fprintf(stderr, "The time is out.\n");
  fclose(stderr);
  exit(7);
 }
}

int get_mtu(int s, char *ifname)
{
 struct ifreq ifr;

 memset(&ifr, 0, sizeof(ifr));
 strncpy(ifr.ifr_name, ifname, sizeof(ifr.ifr_name));
 if( ioctl(s, SIOCGIFMTU, &ifr) <0 )
  pr_error(6, "SIOCGIFMTU");

 return ifr.ifr_mtu;
}

int main(int argc, char **argv)
{
 char header[] = "TUNcat";
 char *msg, *addptr;
 size_t msglen, added;
 int i;
 int true = 1;
 struct timespec delay = {0,SEND_INT};
 struct sockaddr_in addr;
 int sock;
 int mtu, mmu;

 struct sockaddr_ll hwaddr;
 char *raw, *data, *udp_header;
 size_t raw_len, data_len, udp_len, udp_offset;
 uint16_t udp_sum;
 struct itimerval timer = { {0,IF_ALIVE}, {0,IF_ALIVE} };

 struct pseudo_h {
  u_int32_t sIP;
  u_int32_t dIP;
  char empty;
  char proto;
  uint16_t len;
 };
 struct pseudo_h pseudo = {0,0,0,UDP,0};

 net_ifname = INTERFACE;

 if (argc < ARGP) usage();
 
 if(strcmp(ROLE, "send")==0)
 {
  sock = socket(AF_INET, SOCK_DGRAM, 0);
  if(sock < 0) pr_error(2, "socket");

  if( setsockopt(sock, SOL_SOCKET, SO_BINDTODEVICE, net_ifname, strlen(net_ifname)) < 0 )
   pr_error(3, "SO_BINDTODEVICE");

  if( setsockopt(sock, SOL_SOCKET, SO_BROADCAST, &true, sizeof(true)) < 0 )
   pr_error(4, "SO_BROADCAST");

  mtu = get_mtu(sock, net_ifname);
  mmu = mtu - OVERHEAD;

  msg = malloc(mmu+1);
  msglen = sizeof(header);
  memcpy(msg, header, msglen);
  addptr = msg + msglen;

  for(i=ARGP; i<argc; i++)
  {
   added = strlen(argv[i]) +1;
   if( msglen + added <= mmu )
   {
    sprintf(addptr, "%s\n", argv[i]);
    addptr += added;
    msglen += added;
   }
   else
   {
    fprintf(stderr, "No space left for arg %d : %s\n", i, argv[i]);
    break;
   }
  }

  addr.sin_family = AF_INET;
  addr.sin_port = htons(PORT);
  addr.sin_addr.s_addr = htonl(INADDR_BROADCAST);

  for(i=0; i < SEND_NUM; i++)
  {
   sendto(sock, msg, msglen, 0, (struct sockaddr *)&addr, sizeof(addr) );
   nanosleep(&delay, NULL);
   if(if_nametoindex(net_ifname)<=0)
    net_gone();
  }
  free(msg);
 }

 else if(strcmp(ROLE, "listen")==0)
 {
  countdown = ( (argc>ARGP)?TIMEOUT:DEF_TIMEOUT ) * (int)(1000000/IF_ALIVE);

  signal(SIGALRM, alarm_handler);
  if( setitimer(ITIMER_REAL, &timer, 0) <0 )
   pr_error(6, "setitimer");

  sock = socket(AF_PACKET, SOCK_DGRAM, htons(ETH_P_ALL) );
  if(sock < 0) pr_error(2, "socket");

  memset(&hwaddr, sizeof(hwaddr), 0);
  hwaddr.sll_family = AF_PACKET;
  hwaddr.sll_protocol = htons(ETH_P_ALL);
  if( ( hwaddr.sll_ifindex = if_nametoindex(net_ifname) )<=0 )
   pr_error(3, "if_nametoindex");
  if( bind(sock, (struct sockaddr *)&hwaddr, sizeof(hwaddr) ) <0 )
   pr_error(5, "bind");

  mtu = get_mtu(sock, net_ifname);
  raw = malloc(mtu+1);

  while(1)
  {
   raw_len = recv(sock, raw, mtu, 0);

   if( IPv != 4 || IP_PROTO != UDP || raw_len <= OVERHEAD
    || ( udp_offset = IP_HLEN ) >= raw_len - UDP_HLEN - sizeof(header) )
     continue;

   udp_header = raw + udp_offset;
   udp_len = raw_len - udp_offset;
   data = udp_header + UDP_HLEN;
   data_len = udp_len - UDP_HLEN;
   
   pseudo.sIP = IP_SRC;
   pseudo.dIP = IP_DST;
   pseudo.len = htons((uint16_t)udp_len);
   udp_sum = UDP_SUM;
   UDP_SUM = 0;
   if( udp_sum != get_sum(udp_header, udp_len, (uint16_t*)&pseudo, sizeof(pseudo) )
    || IP_DST != htonl(INADDR_BROADCAST)
    || UDP_DPORT != htons(PORT) ) continue;

   data[data_len] = '\0';
   if( strcmp(data, header) != 0 )  continue;
   printf("%s", data + sizeof(header));
   fclose(stdout);
   free(raw);
   break;
  }
 }

 else
  usage();

 close(sock);
 return 0;
}
