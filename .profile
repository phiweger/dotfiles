# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# the programs in compbio
# reload profile after path was added: 
# . ~/.profile 

# For these, move the source code to ~/src and only put binaries in combio
# folder.
PATH=/usr/local/compbio/bwa:$PATH
PATH=/usr/local/compbio/seqtk:$PATH
PATH=/usr/local/compbio/bcftools-1.3:$PATH
PATH=/usr/local/compbio/htslib-1.3:$PATH
PATH=/usr/local/compbio/samtools-1.3:$PATH
PATH=/usr/local/compbio/freebayes/bin:$PATH
PATH=/usr/local/compbio/freebayes/vcflib/bin:$PATH
PATH=/usr/local/compbio/bamtools/bin:$PATH

# From hereon, this has been done already.
PATH=/usr/local/compbio/bedtools2:$PATH

# Some programs require the JRE .. Java Runtime Environment and can be run from the command line directly.
PATH=~/src/FastQC:$PATH
PATH=~/src/vt:$PATH
PATH=~/src/mutatrix:$PATH
PATH=~/src/sratoolkit/bin:$PATH
PATH=~/src/varsim:$PATH
PATH=~/src/wgsim:$PATH
PATH=~/src/annovar:$PATH

# Zotero
PATH=/opt/zotero:$PATH

# wirtualenvwrapper
# http://virtualenvwrapper.readthedocs.org/en/latest/install.html
export WORKON_HOME=$HOME/venv # where virtualenvs live
export PROJECT_HOME=$HOME/project # project dev folder
source /usr/local/bin/virtualenvwrapper.sh

