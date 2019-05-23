package main

import (
	"io"
    "fmt"
	"os"
	"os/exec"
	"bytes"
	"strings"
	"regexp"
	"github.com/carmark/pseudo-terminal-go/terminal"
)

func main() {
	// test code
	// fmt.Println(execCmd("help", false))

	term, err := terminal.NewWithStdInOut()
	if err != nil {
		panic(err)
	}
	defer term.ReleaseFromStdInOut()
	term.SetPrompt("> ")
	for {
		// Read the keyboad input.
		line, err := term.ReadLine()
		// Exit on Ctrl-D and Ctrl-C
		if err == io.EOF ||  line == "^C"{
			fmt.Println()
			return
		}
		// Handle the execution of the input.
		if retval := execCmd(line, true); len(retval) > 0 {
			fmt.Fprintln(os.Stderr, retval)
		}
	}
}

var outb, errb bytes.Buffer

func execCmd(input string, stdout bool) string {
    // Remove the newline character.
    input = strings.TrimSuffix(input, "\n")

	argr := regexp.MustCompile(`(".*")`)
	fmt.Printf("%q\n", argr.Split(input, -1))

    // Split the input separate the command and the arguments.
	//args := strings.Split(input, " ")
	
	// Prepare the command to execute.
    cmd := exec.Command("sh", "-c", "git " + input)

	// Set the correct output device.
	if stdout{
    	cmd.Stderr = os.Stderr
		cmd.Stdout = os.Stdout
	}else{
		cmd.Stdout = &outb
		cmd.Stderr = &errb
	}
    // Execute the command and return the error.
	err := cmd.Run()
	if err != nil{
		return err.Error()
	}
	if !stdout{
		return outb.String()
	}
	return ""
}