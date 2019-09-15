package main

import (
	"context"
	"crypto/ecdsa"
	"crypto/elliptic"
	"crypto/rand"
	"crypto/rsa"
	"crypto/tls"
	"crypto/x509"
	"crypto/x509/pkix"
	"encoding/pem"
	"errors"
	"io"
	"io/ioutil"
	olog "log"
	"math/big"
	"net"
	"strings"
	"sync"
	"time"

	log "github.com/Sirupsen/logrus"
	"github.com/armon/go-socks5"
	"github.com/miekg/dns"
	"golang.org/x/net/publicsuffix"
)

const (
	// certs
	caCert = "/etc/sni-modifier/CA.crt"
	caKey  = "/etc/sni-modifier/CA.key"
	// dns
	gfwDNS = "8.8.8.8:853"
	// time
	certExpire   = time.Hour * 24 * 30 // a month
	dialTimeout  = 5 * time.Second
	cacheAddrTtl = 5 * time.Minute
	// misc
	proxyAddr = "localhost:8080"
	logLevel  = log.WarnLevel
)

var (
	// dns setting correspond to the above
	gfwDnsCli = sync.Pool{New: func() interface{} {
		return &dns.Client{Net: "tcp-tls"}
	}}

	resolvLock  sync.Map
	cacheCert   sync.Map
	cacheResolv sync.Map

	caParent *x509.Certificate
	caPriKey *rsa.PrivateKey

	tlsSerConf = &tls.Config{GetCertificate: getCertificate}
)

type nilResolver struct{}

func (n nilResolver) Resolve(ctx context.Context, name string) (context.Context, net.IP, error) {
	return ctx, nil, nil
}

type LocalConn struct {
	r io.ReadCloser
	w io.WriteCloser
	net.Conn
}

func (c *LocalConn) Read(b []byte) (n int, err error) {
	return c.r.Read(b)
}

func (c *LocalConn) Write(b []byte) (n int, err error) {
	return c.w.Write(b)
}

func (c *LocalConn) Close() error {
	err := c.r.Close()
	if err != nil {
		_ = c.w.Close()
		return err
	}
	return c.w.Close()
}

func newBiLocalConn() (c, s *LocalConn) {
	c = new(LocalConn)
	s = new(LocalConn)
	c.r, s.w = io.Pipe()
	s.r, c.w = io.Pipe()
	return
}

type Resolv struct {
	addr   string
	expire time.Time
}

func (r *Resolv) Expired() bool {
	return r.expire.Before(time.Now())
}

func resolveRealIP(ctx context.Context, host string) (ret []*Resolv) {
	cli := gfwDnsCli.Get().(*dns.Client)
	defer gfwDnsCli.Put(cli)

	// ask AAAA (ipv6) address first
	q := &dns.Msg{
		MsgHdr: dns.MsgHdr{
			RecursionDesired: true,
		},
		Question: []dns.Question{
			{
				Name:   dns.Fqdn(host),
				Qtype:  dns.TypeAAAA,
				Qclass: dns.ClassINET,
			},
		},
	}
	r, _, err := cli.ExchangeContext(ctx, q, gfwDNS)
	if err != nil {
		log.Warn(err)
		return
	}
	for _, ans := range r.Answer {
		if a, ok := ans.(*dns.AAAA); ok {
			ret = append(ret, &Resolv{
				addr:   net.JoinHostPort(a.AAAA.String(), "443"),
				expire: time.Now().Add(cacheAddrTtl),
			})
		}
	}

	// ask A (ipv4) address
	q.Question[0].Qtype = dns.TypeA
	r, _, err = cli.ExchangeContext(ctx, q, gfwDNS)
	if err != nil {
		log.Warn(err)
		return
	}
	for _, ans := range r.Answer {
		if a, ok := ans.(*dns.A); ok {
			ret = append(ret, &Resolv{
				addr:   net.JoinHostPort(a.A.String(), "443"),
				expire: time.Now().Add(cacheAddrTtl),
			})
		}
	}
	return
}

func communicate(i, j net.Conn) {
	defer func() {
		if err := i.Close(); err != nil {
			log.Error(err)
		}
	}()
	defer func() {
		if err := j.Close(); err != nil {
			log.Error(err)
		}
	}()

	finished := make(chan struct{}, 2)
	go func() {
		_, _ = io.Copy(i, j)
		finished <- struct{}{}
	}()
	go func() {
		_, _ = io.Copy(j, i)
		finished <- struct{}{}
	}()
	<-finished
}

func forward443(ctx context.Context, network, addr string) (net.Conn, error) {
	host, port, err := net.SplitHostPort(addr)
	if err != nil {
		return nil, err
	}
	if port != "443" || net.ParseIP(host) != nil {
		var d net.Dialer
		return d.DialContext(ctx, network, addr)
	}

	d := &net.Dialer{Timeout: dialTimeout}
	config := &tls.Config{
		InsecureSkipVerify: true,
		VerifyPeerCertificate: func(rawCerts [][]byte, _ [][]*x509.Certificate) error {
			// bypass tls verification and manually do it
			certs := make([]*x509.Certificate, len(rawCerts))
			for i, asn1Data := range rawCerts {
				cert, _ := x509.ParseCertificate(asn1Data)
				certs[i] = cert
			}
			opts := x509.VerifyOptions{
				DNSName:       host,
				Intermediates: x509.NewCertPool(),
			}
			for _, cert := range certs[1:] {
				opts.Intermediates.AddCert(cert)
			}
			_, err := certs[0].Verify(opts)
			if err != nil {
				log.Warn(err)
			}
			return err
		},
	}

	var i net.Conn
	lock := new(sync.Mutex)
	actualL, _ := resolvLock.LoadOrStore(host, lock) // one resolve at a time
	lock = actualL.(*sync.Mutex)
	lock.Lock()

	if r, ok := cacheResolv.Load(host); ok && !r.(*Resolv).Expired() {
		i, err = tls.DialWithDialer(d, "tcp", r.(*Resolv).addr, config)
	} else {
		err = errors.New("no cached addr")
	}

	if err != nil {
		addrs := resolveRealIP(ctx, host)
		if addrs == nil {
			log.Warnf("%s resolve error", host)
			lock.Unlock()
			return nil, err
		}
		for _, addr := range addrs {
			i, err = tls.DialWithDialer(d, "tcp", addr.addr, config)
			if err == nil {
				cacheResolv.Store(host, addr)
				break
			}
		}
		if err != nil {
			i, err = tls.DialWithDialer(d, "tcp", host+":443", config)
			if err != nil {
				log.Infof("%s is IP-blocked", host)
				lock.Unlock()
				return nil, err
			}
		}
	}
	lock.Unlock()

	c, s := newBiLocalConn()
	c.Conn = i
	conn := tls.Server(s, tlsSerConf)
	go communicate(i, conn)
	return c, nil
}

func getCertificate(info *tls.ClientHelloInfo) (*tls.Certificate, error) {
	if info.ServerName == "" {
		return nil, errors.New("no SNI info")
	}

	if cert, ok := cacheCert.Load(info.ServerName); ok {
		return cert.(*tls.Certificate), nil
	}

	secondary, err := publicsuffix.EffectiveTLDPlusOne(info.ServerName)
	if err != nil {
		log.Errorf("invalid hostname: %s", secondary)
		return nil, err
	}

	var cn string
	if info.ServerName == secondary {
		cn = secondary
	} else {
		dot := strings.IndexByte(info.ServerName, '.')
		cn = info.ServerName[dot+1:]
	}

	if cert, ok := cacheCert.Load(cn); ok {
		return cert.(*tls.Certificate), nil
	}

	priv, err := ecdsa.GenerateKey(elliptic.P256(), rand.Reader)
	if err != nil {
		log.Errorf("failed to generate private key: %s", err)
		return nil, err
	}

	serialNumberLimit := new(big.Int).Lsh(big.NewInt(1), 128)
	serialNumber, err := rand.Int(rand.Reader, serialNumberLimit)
	if err != nil {
		log.Errorf("failed to generate serial number: %s", err)
		return nil, err
	}

	template := &x509.Certificate{
		SerialNumber: serialNumber,
		Subject: pkix.Name{
			CommonName: cn,
			Country:    []string{"CN"},
		},

		NotBefore: time.Now(),
		NotAfter:  time.Now().Add(certExpire),

		ExtKeyUsage:           []x509.ExtKeyUsage{x509.ExtKeyUsageServerAuth},
		BasicConstraintsValid: true,
		DNSNames:              []string{"*." + cn, cn},
	}

	derBytes, err := x509.CreateCertificate(rand.Reader, template, caParent, priv.Public(), caPriKey)
	if err != nil {
		log.Errorf("failed to create certificate: %s", err)
		return nil, err
	}

	cert := &tls.Certificate{
		Certificate: [][]byte{derBytes},
		PrivateKey:  priv,
	}
	cacheCert.Store(cn, cert)
	return cert, nil
}

func init() {
	log.SetLevel(logLevel)

	// read ca cert
	certPEMBlock, err := ioutil.ReadFile(caCert)
	if err != nil {
		log.Fatal(err)
	}
	certDERBlock, _ := pem.Decode(certPEMBlock)
	caParent, err = x509.ParseCertificate(certDERBlock.Bytes)
	if err != nil {
		log.Fatal(err)
	}

	keyPEMBlock, err := ioutil.ReadFile(caKey)
	if err != nil {
		log.Fatal(err)
	}
	keyDERBlock, _ := pem.Decode(keyPEMBlock)
	caPriKey, err = x509.ParsePKCS1PrivateKey(keyDERBlock.Bytes)
	if err != nil {
		log.Fatal(err)
	}
}

func main() {
	conf := &socks5.Config{
		Resolver: nilResolver{},
		Dial:     forward443,
		Logger:   olog.New(ioutil.Discard, "", 0),
	}
	server, err := socks5.New(conf)
	if err != nil {
		log.Fatal(err)
	}
	log.Fatal(server.ListenAndServe("tcp", proxyAddr))
}
