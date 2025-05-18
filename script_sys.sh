#!/bin/bash

echo 'System version'
uname -a

echo 'Users with bash shell'
grep "/bin/bash" /etc/passwd

echo 'Open ports'
ss -tuln
