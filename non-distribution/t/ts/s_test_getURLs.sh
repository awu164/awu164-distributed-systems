#!/bin/bash
# This is a student test

R_FOLDER=${R_FOLDER:-}

cd "$(dirname "$0")/..$R_FOLDER" || exit 1

DIFF=${DIFF:-diff}

url="https://csci0300.github.io/sections/"


if ! $DIFF <(cat ts/s_test_data/cs300_sections_html.txt | ../c/getURLs.js $url | sort) <(sort ts/s_test_data/cs300_sections_correct_urls.txt) >&2;
then
    echo "$0 failure: URL sets are not identical"
    exit 1
fi

echo "$0 success: URL sets are identical"
exit 0
