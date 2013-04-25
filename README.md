# InstaCD

A bash/perl script for easily jumping to a directory from a predefined list

## Why?

I use to ssh into servers a lot, but i usually dwell in the same few folders deep in the filesystem tree. This script sourced in the .bashrc allows me to go to my most used directories  using only one additional keypress.

## Requirements

Perl
Bash

## Installation

Add the following lines to your .bashrc

	#if this is not an interactive shell, skip this
	[ -z "$PS1" ] && return
	alias icd="source /install/path/instaCD.bash"
	icd

Create a ~/.instaCD in the following format
(keypress) (directory to go to) e.g.

	a /var/www/myProjectFoo/src
	b /opt/awesomeTool/whatever
