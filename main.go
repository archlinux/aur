package main

import (
	"flag"
	// "fmt"
	"log"
	"math/rand"
	"net"
	"os"
	"os/signal"
	"strconv"
	"syscall"
	"time"
)

var (
	count int
	startPort int
	endPort int
	showBanner bool
)

func init() {
	flag.IntVar(&count, "n", 5, "Number of fake services to launch")
	flag.IntVar(&startPort, "start", 30000, "Start of port range")
	flag.IntVar(&endPort, "end", 40000, "End of port range")
	flag.BoolVar(&showBanner, "banner", false, "Display banner on connection")
	flag.Parse()
}

func getRandomPort(used map[int]bool, min, max int) int {
	for {
		port := rand.Intn(max-min) + min
		if !used[port] {
			used[port] = true
			return port
		}
	}
}

func startFakeService(port int, banner bool) {
	listener, err := net.Listen("tcp", ":"+strconv.Itoa(port))
	if err != nil {
		log.Printf("Failed to open %d: %v", port, err)
		return
	}
	log.Printf("Fake service started on port %d", port)
	go func() {
		for {
			conn, err := listener.Accept()
			if err != nil {
				return
			}
			go func(c net.Conn) {
				if banner {
					c.Write([]byte("portchaos test banner\n"))
				}
				c.Close()
			}(conn)
		}
	}()
}

func main() {
	rand.Seed(time.Now().UnixNano())

	usedPorts := make(map[int]bool)

	for i := 0; i < count; i++ {
		port := getRandomPort(usedPorts, startPort, endPort)
		startFakeService(port, showBanner)
	}

	log.Println("Press Ctrl+C to exit")
	sigs := make(chan os.Signal, 1)
	signal.Notify(sigs, syscall.SIGINT, syscall.SIGTERM)
	<-sigs
	log.Println("portchaos terminated")
}
