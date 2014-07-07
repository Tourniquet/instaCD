# InstaCD

A perl script for easily jumping to a directory from a predefined list, roughly 
similar to Pentadactyl's quickmarks and basically a pretty lame static version 
of autojump.

## Why?

I use to ssh into servers a lot, but i usually dwell in the same few folders
deep in the filesystem tree. This script sourced in the .bashrc allows me to go
to my most used directories using only one additional keypress.

## Requirements

* Perl
* Bash, zsh, or making your own script sourcing the perl call

## Installation

Add the following lines to your .bashrc

	#if this is not an interactive shell, skip this
	[ -z "$PS1" ] && return
	alias g="source /install/path/instaCD.bash"
	g

Create a ~/.instaCD in the following format or use the `add` command described below

	(key) (directory to go to)
	m /var/www/myProjectFoo/src
	w /opt/awesomeTool/whatever

## Usage
	`g` opens your quick jump list

	`g x` cd's to the folder for the key `x`

	`g add x` adds your current directory for the key `x`

	`g add x /var/foo` adds /var/foo for the key `x`

## Bugs/TODO

Overwriting/deleting shortcuts currently requires manual editing of ~/.instaCD. A `rm` command would be nice.
Adding a letter twice causes it to be put twice in the list. This should be handled.
