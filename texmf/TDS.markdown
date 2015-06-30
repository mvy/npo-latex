# Readme

## How to use

This directory contains a TDS tree (TexMF), a collection of classes, packages
and common images. So as not to have to copy these ressources, the tree has to
be registered with the LaTeX distribution.

TeX-Live manager (if available): (source)[1]

    tlmgr conf texmf TEXMFHOME "~/Library/texmf:~/texmf" 
    
MikTeX (for windows, Settings (Admin) shortcut - Add to roor)

Debian requires a bit more of work:

    export TEXMFCNF=$HOME/.texmf-config/web2c:

Edit the `$HOME/.texmf-config/web2c/texmf.cnf` file and add to your term
configuration:

    TEXMFLOCAL = /home/[...]/git/prologin/documents/texmf

Finally, run `texhash` in the `texmf` directory then run `udpmap`.

## TDS tree

texmf/      TDS root
 bibtex/     BibTeX input files
  bib/        BibTeX databases
   base/       base distribution (e.g., `xampl.bib')
   misc/       single-file databases
   pkg/       name of a package
  bst/        BibTeX style files
   base/       base distribution (e.g., `plain.bst', `acm.bst')
   misc/       single-file styles
   pkg/       name of a package
 doc/         additional documentation
 dvips/       `.pro', `.ps', `psfonts.map'
 fonts/       font-related files
  type/         file type (e.g., `tfm', `pk')
   mode/          type of output device (types `pk' and `gf' only)
    supplier/       name of a font supplier (e.g., `public')
     typeface/        name of a typeface (e.g., `cm')
      dpinnn/           font resolution (types `pk' and `gf' only)
 metafont/    Metafont (non-font) input files
  base/        base distribution (e.g., `plain.mf')
  misc/        single-file packages (e.g., `modes.mf')
  pkg/           name of a package (e.g., `mfpic')
 metapost/    MetaPost input files
  base/        base distribution (e.g., `plain.mp')
  misc/        single-file packages
  pkg/           name of a package
  support/     support files for MetaPost-related utilities (e.g., `trfonts.map')
 mft/         `MFT' inputs (e.g., `plain.mft')
 tex/         TeX input files
  format/         name of a format (e.g., `plain')
   base/        base distribution for format (e.g., `plain.tex')
   misc/        single-file packages (e.g., `webmac.tex')
   local/       local additions to or local configuration files for format
   pkg/           name of a package (e.g., `graphics', `mfnfss')
  generic/     format-independent packages
   hyphen/      hyphenation patterns (e.g., `hyphen.tex')
   images/      image input files (e.g., Encapsulated PostScript)
   misc/        single-file format-independent packages (e.g., `null.tex').
   pkg/           name of a package (e.g., `babel')
 web2c/        implementation-dependent files (`.pool', `.fmt', `texmf.cnf', etc.)
