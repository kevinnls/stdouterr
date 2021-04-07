% STDOUTERR(1)
% Kevin Samuel
% April 2021

# Name

stdouterr – write to stdout and/or stderr. useful for testing redirections

# Synopsis

**stdouterr** [ **-o** *output_string* | **-t** ] [ **-e** *error_string* | **-r** ]

# Description

**stdouterr** is a simple tool that writes a line to standard output
and another line to standard error. The aim is to provide a simple
tool to provide dummy data for redirection to confirm that the
redirections work as expected.

# Options

**-o** *output_string*
:	Print *output_string* to stdout instead of the default **This is output**

**-e** *error_string*
:	Print *error_string* to stderr instead of the default **This an error message**

**-t**
:	Don't print outpu*t*

**-r**
:	Don't print erro*r*
