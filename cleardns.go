package main

import (
	"flag"
	"github.com/miekg/dns"
	"log"
	"time"
)

var laddr = flag.String("l","127.0.0.1:53","the local address to listen on")
var fakedns = flag.String("f","99.84.239.46:53","a fake dns address (it MUST NOT be a real dns)")
var realdns = flag.String("r","119.29.29.29:53","the real dns (like the one provided by your isp)")
var safedns = flag.String("s","127.0.0.1:5300","a unpolluted dns (dnscrypt-proxy is a good choice)")
var faketimeoutms = flag.Int("p",300,"the timeout used to determine whether a domain is polluted") //time.Millisecond
var timeoutms = flag.Int("t",500,"the timeout used to queue other dns")
var faketimeout, timeout time.Duration

func main() {
	flag.Parse()
	faketimeout = time.Duration(*faketimeoutms) * time.Millisecond
	timeout = time.Duration(*timeoutms) * time.Millisecond
	var err error
	err = dns.ListenAndServe(*laddr, "udp", &cleardnsHandler{dns.Client{Timeout: faketimeout}, dns.Client{Timeout:timeout}})
	if err != nil {
		log.Fatal(err)
	}
	return
}

func createSERVFAIL(msg *dns.Msg) *dns.Msg{
	reply := &dns.Msg{}
	reply.SetRcode(msg,dns.RcodeServerFailure)
	return reply
}


type cleardnsHandler struct {
	fakeclient dns.Client
	client dns.Client
}

func (m *cleardnsHandler) ServeDNS(w dns.ResponseWriter, r *dns.Msg) {
	realdnsPrefetch := make(chan *dns.Msg, 1)
	safednsPrefetch := make(chan *dns.Msg, 1)
	go func() {
		var realdnsAnswer *dns.Msg
		var realdnsErr error
		realdnsAnswer, _, realdnsErr = m.client.Exchange(r, *realdns)
		if realdnsErr != nil {
			log.Print("Prefetch: Realdns: " + realdnsErr.Error())
			return
		}
		realdnsPrefetch <- realdnsAnswer
	}()
	go func() {
		var safednsAnswer *dns.Msg
		var safednsErr error
		safednsAnswer, _, safednsErr = m.client.Exchange(r, *safedns)
		if safednsErr != nil {
			log.Print("Prefetch: Safedns: " + safednsErr.Error())
			return
		}
		safednsPrefetch <- safednsAnswer
	}()

	_, _, fakednsErr := m.fakeclient.Exchange(r, *fakedns)
	if fakednsErr == nil {
		log.Print("Domain: " + r.Question[0].String() + " potentially polluted")
		select {
		case ans := <-safednsPrefetch:
			w.WriteMsg(ans)
		case <-time.After(timeout):
			w.WriteMsg(createSERVFAIL(r))
		}
		return
	}
	log.Print("Domain: " + r.Question[0].String() + " is safe")
	select {
	case ans := <-realdnsPrefetch:
		w.WriteMsg(ans)
	case <-time.After(timeout):
		w.WriteMsg(createSERVFAIL(r))
	}
	return
}
