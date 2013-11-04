# InstaCD

A bash/perl script for easily jumping to a directory from a predefined list

## Why?

I use to ssh into servers a lot, but i usually dwell in the same few folders deep in the filesystem tree. This script sourced in the .bashrc allows me to go to my most used directories  using only one additional keypress.

## Requirements

* Perl
* Bash or zsh

## Installation

Add the following lines to your .bashrc

	#if this is not an interactive shell, skip this
	[ -z "$PS1" ] && return
	alias instaCD="source /install/path/instaCD.bash"
	instaCD

Create a ~/.instaCD in the following format or use the `add` command described below

	(keypress) (directory to go to)
	a /var/www/myProjectFoo/src
	w /opt/awesomeTool/whatever

## Hints

I aliased instaCD to `g`. This allows super quick folder switching for all the lazy typers.

## Usage
	`instaCD` opens your quick jump list

	`instaCD x` cd's to the folder for the key `x`

	`instaCD add x` adds your current directory for the key `x`

	`instaCD add x /var/foo` adds /var/foo for the key `x`
