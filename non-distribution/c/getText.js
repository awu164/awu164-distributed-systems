#!/usr/bin/env node

/*
Extract all text from an HTML page.
Usage: input > ./getText.js > output
*/

// the flow: this program gets called by crawl.sh, which is a bash script.
// crawl.sh will pipe the html of a page line by line to this program.
// this program will accumulate the html until there are no more lines (so until the input is closed), and then convert the html to text and output it.
const {convert} = require('html-to-text'); // require() is Node's way of importing modules.
const readline = require('readline');
let html = ''; // accumulating html to be converted to text

const rl = readline.createInterface({
  input: process.stdin,
});

// rl.on() is called when a line is read from stdin. 'line' is the name of the event, and (line) => {} is the callback function that is called when the event occurs.
rl.on('line', (line) => {
  // 1. Read HTML inuput from standard input, line by line using the `readline` module.
  html += line + '\n';
});

// 2. after all input is received, use convert to output plain text.
rl.on('close', () => {
  console.log(convert(html));
});
