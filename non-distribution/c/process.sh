#!/bin/bash

# Convert input to a stream of non-stopword terms
# Usage: input > ./process.sh > output

# 1) Convert non-letter characters to newlines. Non-letter characters include things like ©, ®, and ™ as well!
# 2) make lowercase
# 3) convert to ASCII
# 4) then remove stopwords (inside d/stopwords.txt)

#
# Commands that will be useful: tr, iconv, grep

# Tip: Make sure your program doesn't emit a non-zero exit code if there are no words left after removing stopwords.
# You can combine the grep invocation with `|| true` to achieve this. Be careful though, as this will also hide other errors!

SCRIPT_DIR=$(dirname "$0")
STOPWORD_D="$SCRIPT_DIR/../d/stopwords.txt"
tr -sc "[:alpha:]" '\n'| tr '[:upper:]' '[:lower:]' | iconv -c -f UTF-8 -t ASCII//TRANSLIT 2>/dev/null | grep -x -v -f "$STOPWORD_D" || true


