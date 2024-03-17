#!/bin/bash

# A simple script to run testbenches for each Verilog project
# Arg 1: Folder of files to compile. Must end with a slash.

# TODO: Allow easy changing of Verilog compilers and runtimes
# alias verilog_compiler="iverilog"
# TODO: Allow setting this using a commandline argument
output="check"



iverilog -o $output ${1}*.v \
  && vvp $output
