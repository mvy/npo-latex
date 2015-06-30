# Document relatif à la gestion d'association

## Structure du dépôt

`documents/` : 
    propose une liste de documents types qui utilisent le format LaTeX et les
    modèles proposés par ce dépôt

`references/`:
    propose une liste de documents officiels, guides, articles de loi
    s'appliquant ou pouvant s'appliquer à une association française.

`texmf/`:
    regroupe les modèles (images, types de documents, données). C'est le coeur
    du dépôt.

## Usage

### Arbres TDS

Le répertoire contient un arbre TDS (TeXMF) qui rassemble des classes, packages,
images communes. Pour ne pas avoir à copier ces ressources partagées, il suffit
d'indiquer à la distribution LaTeX comment y accéder.

#### Configuration Unix/Linux

TeX-Live manager (si disponible):

    tlmgr conf texmf TEXMFHOME "~/Library/texmf:~/texmf" [1]

ou (comme pour Debian), il faut un peu plus de travail:

    export TEXMFCNF=$HOME/.texmf-config/web2c:

puis éditer le fichier `$HOME/.texmf-config/web2c/texmf.cnf` et y ajouter :

    TEXMFLOCAL = /home/[...]/git/organisation/texmf

enfin lancer texhash dans le répertoire `texmf` et lancer `updmap`.

#### Windows

Via le setup de MikTeX (raccourci "Settings (Admin)" - Ajouter dans l'onglet
root)

### Personnalisation des modèles

La plupart des options de personnalisation se trouvent déjà dans les fichiers
`*.def`. Ils définissent des variables utilisées dans les modèles. Pour
personnaliser ses propres variables, il suffit de copier le fichier par défaut
sous un nouveau nom. Ce nom pourra être utilisé en paramètre du `documentclass`.

Pour les changements cosmétiques plus drastiques, il sera sans doute nécessaire
de changer les classes et packages de l'arbre TDS.
