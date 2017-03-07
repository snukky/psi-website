#!/bin/sh

rm psi-website.zip
make psi-website.zip
scp psi-website.zip psinf@hosting.wmi.amu.edu.pl:/home/projects/psinf/
