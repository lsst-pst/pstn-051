.. image:: https://img.shields.io/badge/pstn--051-lsst.io-brightgreen.svg
   :target: https://pstn-051.lsst.io
.. image:: https://travis-ci.com/lsst-pst/pstn-051.svg
   :target: https://travis-ci.com/lsst-pst/pstn-051

############################################################################################################
Survey Strategy and Cadence Choices For the Vera C. Rubin Observatory Legacy Survey of Space and Time (LSST)
############################################################################################################

PSTN-051
========

A summary of survey strategy and cadence choices, simulated and evaluated by the LSST Scheduler Team, prepared for the Survey Cadence and Optimization Committee.

Links
=====

- Live drafts: https://pstn-051.lsst.io
- GitHub: https://github.com/lsst-pst/pstn-051

.. image:: https://zenodo.org/badge/DOI/10.5281/zenodo.4048838.svg
 :target: https://doi.org/10.5281/zenodo.4048838

(DOI for v1.2, initial public release)



Build
=====

This repository includes lsst-texmf_ as a Git submodule.
Clone this repository::

    git clone --recurse-submodules https://github.com/lsst-pst/pstn-051

Compile the PDF::

    make

Clean built files::

    make clean

Updating acronyms
-----------------

A table of the technote's acronyms and their definitions are maintained in the `acronyms.tex` file, which is committed as part of this repository.
To update the acronyms table in ``acronyms.tex``::

    make acronyms.tex

*Note: this command requires that this repository was cloned as a submodule.*

The acronyms discovery code scans the LaTeX source for probable acronyms.
You can ensure that certain strings aren't treated as acronyms by adding them to the `skipacronyms.txt <./skipacronyms.txt>`_ file.

The lsst-texmf_ repository centrally maintains definitions for LSST acronyms.
You can also add new acronym definitions, or override the definitions of acronyms, by editing the `myacronyms.txt <./myacronyms.txt>`_ file.

Updating lsst-texmf
-------------------

`lsst-texmf`_ includes BibTeX files, the ``lsstdoc`` class file, and acronym definitions, among other essential tooling for LSST's LaTeX documentation projects.
To update to a newer version of `lsst-texmf`_, you can update the submodule in this repository::

   git submodule update --init --recursive

Commit, then push, the updated submodule.

.. _lsst-texmf: https://github.com/lsst/lsst-texmf
