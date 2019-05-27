package main

import (
	"io"
    "fmt"
	"os"
	"flag"
	"bytes"
	"os/exec"
	"strings"
	"github.com/carmark/pseudo-terminal-go/terminal"
	"github.com/common-nighthawk/go-figure"
	"github.com/olekukonko/tablewriter"
	"github.com/fatih/color"
)

var version string = "1.0"
var outb, errb bytes.Buffer
var cmdSlice, cmdList []string

func execCmd(input string, stdout bool) string {
    // Remove the newline character.
    input = strings.TrimSuffix(input, "\n")
	
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
	removeSpaces := "sed -e 's/^\\s*//' -e 's/ *[A-Z].*//' && "
	parseGitCmd := 
		"git help | grep '^  *[a-z]' | " + removeSpaces +
		"git branch | tr -d '*' | " + removeSpaces +
		"git remote"
	cmdStr := execCmd(parseGitCmd, false)
	cmdList = strings.Split(cmdStr, "\n")
	for _, cmd := range cmdList {
		if (len(cmd) > 0){
			firstChar := string([]rune(cmd)[0])
			if (!searchInSlice(cmdSlice, firstChar)){
				cmdSlice = append(cmdSlice, firstChar)
			}else{
				cmdSlice = append(cmdSlice, firstChar + 
					string([]rune(cmd)[len(cmd)/2])) 
			}
		}
	}
}

func buildCmd(line string) string {
	line = strings.Replace(line, " git ", " ", -1)
	for index, cmd := range cmdSlice {
		cmd = " " + cmd + " "
		if (strings.Contains(line, cmd)) {
			line = strings.Replace(line, cmd, 
				" " + cmdList[index] + " ", -1)
		}
	}
	return "git" + line
}

func startTerm() {
	term, err := terminal.NewWithStdInOut()
	if err != nil {
		panic(err)
	}
	defer term.ReleaseFromStdInOut()
	d := color.New(color.FgGreen, color.Bold)
	d.Println("Type '?' for help or 'git' for list of commands.")
	term.SetPrompt("[god]> ")
	cmdLoop:
	for {
		// Read the keyboad input.
		line, err := term.ReadLine()
		// Exit on Ctrl-D and Ctrl-C
		if err == io.EOF ||  line == "^C" {
			fmt.Println()
			return
		}
		// Built-in commands
		switch line{
		case "", " ": 
			break
		case "clear":
			execCmd("clear", true)
		case "exit":
			break cmdLoop
		case "?", "help":
			showHelp()
		case "version":
			showVersion()
		case "git":
			showCommands()
		default:
			// Handle the execution of the input.
			gitCmd := buildCmd(" " + line + " ")
			if retval := execCmd(gitCmd, true); len(retval) > 0 {
				fmt.Fprintln(os.Stderr, retval)
			}
		}
	}
}
func setTableColors(table (*tablewriter.Table)) (*tablewriter.Table) {
	table.SetHeaderColor(tablewriter.Colors{tablewriter.Bold, tablewriter.FgHiWhiteColor},
		tablewriter.Colors{tablewriter.FgHiRedColor, tablewriter.Bold, tablewriter.FgHiWhiteColor})
	table.SetColumnColor(tablewriter.Colors{tablewriter.Bold, tablewriter.FgHiGreenColor},
		tablewriter.Colors{tablewriter.Bold, tablewriter.FgHiBlackColor})
	return table
}
func showHelp(){
	cliCmds := map[string]string{
		"git": "List available simplified git commands",
		"help": "Show this help message",
		"version": "Show version information",
		"clear": "Clear the terminal", 
		"exit": "Exit shell"}
	table := tablewriter.NewWriter(os.Stdout)
	table.SetHeader([]string{"Command", "Description"})
	table = setTableColors(table)
	for k, v := range cliCmds {
		table.Append([]string{k, v})
	}
	table.Render()
}
func showCommands(){
	table := tablewriter.NewWriter(os.Stdout)
	table.SetHeader([]string{"Command", "git"})
	table = setTableColors(table)
	for index, cmd := range cmdSlice {
		table.Append([]string{cmd, cmdList[index]})
	}
	table.Render()
}
func showVersion(){
	fmt.Println()
	asciiFigure := figure.NewFigure("god", "cosmic", true)
	asciiFigure.Print()
	fmt.Println("\n ~ god:v" + version)
	fmt.Println(" ~ utility for simplifying the git usage")
	fmt.Println(" ~ github.com/keylo99/god\n")
}
func main() {
	versionFlag := flag.Bool("v", false, "Show version information")
	flag.Parse()
	if(*versionFlag){
		showVersion()	
	}else{
		prepareCmds()
		startTerm()
	}
}