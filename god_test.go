package main

import (
	"testing"
	"strings"
)

func TestExecCmd(t *testing.T) {
	echoOutput := execCmd("echo 'test'", false)
	if(!strings.Contains(echoOutput, "test")){
		t.Errorf("Expected 'test', got '%s'", echoOutput)
	}
	if retval := execCmd("echo 'Current dir:' && pwd", true); len(retval) > 0 {
		t.Errorf("Error occurred while executing the command. (%s)", retval)
	}
}

func TestSearchInSlice(t *testing.T) {
	testSlice := []string{"k", "3", "9", ".", "x"}
	query := "."
	if(!searchInSlice(testSlice, query)){
		t.Errorf("Cannot find '%s' in slice.", query)
	}
}

func TestGetShortcutSlice(t *testing.T) {
	gitShortcuts := [][]string{
		[]string{"commit", "cm"}, 
		[]string{"push", "ps"}}
	for i, sc := range getShortcutSlice(gitShortcuts, 0){
		if (sc != gitShortcuts[i][0]){
			t.Error("Cannot retrieve the correct element from slice.")
		}
	}
}

func TestPrepareCmds(t *testing.T) {
	gitCmds := prepareCmds()
	if (len(gitCmds) < 5){
		t.Error("Unable to prepare shortened git commands.")
	}
}


