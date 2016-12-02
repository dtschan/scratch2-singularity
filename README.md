Scratch 2 Docker/Singularity Container
======================================

Introduction
------------

[Scratch](https://scratch.mit.edu/) is a popular visual programming language for teaching programming
to kids. Unfortunately the offline version of Scratch 2, required for robotic projects, is based on
Adobe AIR. Making it increasingly difficult to install Scratch 2 on modern Linux systems.

This repository provides a Dockerfile to build a container allowing Scratch 2 to be used on modern
Linux systems with the help of [Singularity](http://singularity.lbl.gov/).

Usage
-----

Tested on [CentOS](https://www.centos.org/) 7.

1. [Install](http://singularity.lbl.gov/install-linux) Singularity on your machine 
2. Download Singularity bootstrap definition:

        curl -O https://raw.githubusercontent.com/dtschan/scratch2-singularity/master/scratch2.def

3. Create a Singularity image for Scratch 2:

        sudo singularity create --size 2048 scratch2.img

4. Import Docker image into Singularity image:

        sudo singularity bootstrap scratch2.img scratch2.def

5. Run Scratch 2:

        singularity run scratch2.img
