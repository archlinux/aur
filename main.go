package main

import (
	"bufio"
	"fmt"
	"io"
	"math"
	"math/rand"
	"os"
)

func rgb(i int) (int, int, int) {
	var f = 0.1
	return int(math.Sin(f*float64(i)+0)*127 + 128),
		int(math.Sin(f*float64(i)+2*math.Pi/3)*127 + 128),
		int(math.Sin(f*float64(i)+4*math.Pi/3)*127 + 128)
}

func main() {
	info, _ := os.Stdin.Stat()
	args := os.Args[1:]

	if info.Mode()&os.ModeCharDevice != 0 && len(args) != 1 {
		fmt.Println("The command is intended to work with pipes or a file.")
		fmt.Println("Usage: cat your-file.txt | rbcat")
		fmt.Println("Or: rbcat your-file.txt")
		os.Exit(1)
	}

	if len(args) == 1 {
		file, err := os.Open(args[0])
		if err != nil {
			fmt.Println(err)
			return
		}
		defer file.Close()

		r := bufio.NewReader(file)
		j := rand.Intn(999999)
		for {
			input, _, err := r.ReadRune()
			if err != nil && err == io.EOF {
				break
			}
			r, g, b := rgb(j)
			fmt.Printf("\033[38;2;%d;%d;%dm%c\033[0m", r, g, b, input)
			j++
		}
	} else {
		r := bufio.NewReader(os.Stdin)
		j := rand.Intn(999999)
		for {
			input, _, err := r.ReadRune()
			if err != nil && err == io.EOF {
				break
			}
			r, g, b := rgb(j)
			fmt.Printf("\033[38;2;%d;%d;%dm%c\033[0m", r, g, b, input)
			j++
		}
	}
}
