#!/bin/sh

#Pass an extra arg like --nostop to to not stop after the first return  
PYTHON="/home/bean/Documents/snakeground/bin/python"


if [ $# -lt 2 ]; then
    "$PYTHON" tools/asm-differ/diff.py -smwo3 --line-numbers --max-lines  30 --format "html" "$1"
else 
    "$PYTHON"  tools/asm-differ/diff.py -mwo3 --line-numbers --max-lines 30 --format "html" "$2"
fi
