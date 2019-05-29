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
