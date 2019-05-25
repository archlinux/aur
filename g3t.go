package main

import (
	"io"
    "fmt"
	"os"
	"os/exec"
	"bytes"
	"strings"
	"github.com/carmark/pseudo-terminal-go/terminal"
)

var outb, errb bytes.Buffer

func execCmd(input string, stdout bool) string {
    // Remove the newline character.
    input = strings.TrimSuffix(input, "\n")

    // Split the input separate the command and the arguments.
	// args := strings.Split(input, " ")
	
	// Prepare the command to execute.
	
	cmd := exec.Command("sh", "-c", input)

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

func searchInSlice(slice []string, query string) bool{
	set := make(map[string]bool)
	for _, v := range slice {
		set[v] = true
	}
	return set[query]
}

func prepareCmds(){
	parseGitCmd := "git help | grep '^  *[a-z]' | sed -e 's/^\\s*//' " +
					"-e 's/ *[A-Z].*//'"
	cmdStr := execCmd(parseGitCmd, false)
	cmdList := strings.Split(cmdStr, "\n")
	var cmdSlice []string
	for _, cmd := range cmdList {
		if (len(cmd) > 0){
			firstChar := string([]rune(cmd)[0])
			if (!searchInSlice(cmdSlice, firstChar)){
				cmdSlice = append(cmdSlice, firstChar)
			}else{
				cmdSlice = append(cmdSlice, string([]rune(cmd)[0]) + 
					string([]rune(cmd)[len(cmd)/2])) 
			}
		}
	}
	for index, cmd := range cmdSlice {
		fmt.Println(cmdList[index] + " -> " + cmd)
	}
	
}

func buildCmd(line string) string {
	return "git " + line
}

func startTerm() {
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
		gitCmd := buildCmd(line)
		if retval := execCmd(gitCmd, true); len(retval) > 0 {
			fmt.Fprintln(os.Stderr, retval)
		}
	}
}

func main() {
	prepareCmds()
	startTerm()
}