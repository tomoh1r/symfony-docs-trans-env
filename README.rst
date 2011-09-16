========================================
Symfony2 Manual Translation repository 
========================================

This make a translation environment for Symfony2 Manual
on your pc/mac.
This sets a git submodule and configurate a Sphinx build environment on your pc/mac.

Prerequisites
==============

- Sphinx 1.0.7
- Git

Installation
==============

In the following four stages, they will provide
an environment for building Symfony2 manual.
After settings, you can run `make html` and
then you get a Symfony2 Manual.
Check source and destination repositories and
please use the latest documentation.

::

   $ git clone git://github.com/jptomo/symfony-docs-trans-env.git
   $ cd symfony-docs-trans-env
   $ vim Makefile # Check REPO_DST TRANSLANG in Makefile
   $ make setting

Translation and how to contribute
=====================================

Once you have decided to translate the file, `git blame-l (files to be translated) ' to confirm the commit ID of the file, the ID of the date listed below, please add to the first line.

::

   .. 2011/07/03 jptomo 8ac37d1c76f2d6ad73fd1d24b73ee159542c719d

Then translate.
For the translated files, separately for clarity, cut branches.
Run `Git checkout-b (branch name)`.

Then `Fork` on github repository.
After the fork, to `Pull Request`.

and wait.
