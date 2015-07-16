# Désassemblage et détection de logiciels malveillants auto-modifiants

Thèse soutenue le 11 mars 2015 au Loria.

# Fichiers compilés
- these.pdf
- soutenance.pdf

# Compiler
Requis pour compiler :
- pdflatex
- biber
- latexmk
- beamer
- make
- graphviz
- pdfcrop
- pdftk

Installer ces paquets sur Ubuntu / Debian :

`sudo apt-get install texlive-full texlive-extra-utils biber latexmk make graphviz pdftk`

Compiler :

`make`

# Jury
Rapporteurs :
- Frédéric Cuppens - Professeur, Télécom Bretagne
- Hervé Debar - Professeur, Télécom SudParis

Examinateurs :
- Sébastien Bardin - Chargé de recherches, CEA
- Guillaume Bonfante - Maître de conférences, Université de Lorraine
- Pierrick Gaudry - Directeur de recherches, CNRS
- Jean-Yves Marion - Professeur, Université de Lorraine, directeur de thèse
- Valérie Viêt Triêm Tông - Maître de conférences, Supélec

# Mots-clés
programmes malveillants, auto-modification, graphe de flot de contrôle, comparaison de graphes

# Résumé
Cette thèse porte en premier lieu sur l'analyse et le désassemblage de programmes malveillants utilisant certaines techniques d'obscurcissement telles que l'auto-modification et le chevauchement de code. Les programmes malveillants trouvés dans la pratique utilisent massivement l'auto-modification pour cacher leur code utile à  un analyste. Nous proposons une technique d'analyse hybride qui utilise une trace d'exécution déterminée par analyse dynamique. Cette analyse découpe le programme auto-modifiant en plusieurs sous-parties non auto-modifiantes que nous pouvons alors étudier par analyse statique en utilisant la trace comme guide. Cette seconde analyse contourne d'autres techniques de protection comme le chevauchement de code afin de reconstruire le graphe de flot de contrôle du binaire analysé.

Nous étudions également un détecteur de programmes malveillants, fonctionnant par analyse morphologique : il compare les graphes de flot de contrôle d'un programme à analyser à ceux de programmes connus comme malveillants. Nous proposons une formalisation de ce problème de comparaison de graphes, des algorithmes permettant de le résoudre efficacement et détaillons des cas concrets d'application à la détection de similarités logicielles.

# Keywords
malwares, self-modification, control flow graph, graph comparison

# Abstract
This dissertation explores tactics for analysis and disassembly of malwares using some obfuscation techniques such as self-modification and code overlapping. Most malwares found in the wild use self-modification in order to hide their payload from an analyst. We propose an hybrid analysis which uses an execution trace derived from a dynamic analysis. This analysis cuts the self-modifying binary into several non self-modifying parts that we can examine through a static analysis using the trace as a guide. This second analysis circumvents more protection techniques such as code overlapping in order to recover the control flow graph of the studied binary.

Moreover we review a morphological malware detector which compares the control flow graph of the studied binary against those of known malwares. We provide a formalization of this graph comparison problem along with efficient algorithms that solve it and a use case in the software similarity field.
