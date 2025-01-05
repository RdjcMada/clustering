#!/bin/bash

# Dossier temporaire
temp="/home/user/itu/S4/Mr_Naina/CrudVacance/temp/"

# Dossier lib
lib="$(pwd)/lib"

# Fichier web.xml
xml="web.xml"

# Fichier dispatcher
dispatcher="dispatcher-servlet.xml"

# Dossier web
web="$(pwd)/web"

# Dossier bin (source)
src="$(pwd)/bin"

# Dossier webapps de Tomcat
webapps="/opt/tomcat/webapps"

# Nom du projet (dossier courant)
myfolder=$(basename "$PWD")

# Supprimer le dossier temporaire si il existe
rm -rf "$temp"
echo "Dossier temporaire supprimé."

# Recréer le dossier temporaire
mkdir -p "$temp"
echo "Dossier temporaire recréé."

# Créer les sous-dossiers nécessaires dans le dossier temporaire
mkdir -p "$temp/WEB-INF/lib" "$temp/WEB-INF/classes" "$temp/WEB-INF/views/jsp"
echo "Dossiers WEB-INF/lib, WEB-INF/classes, et WEB-INF/views/jsp créés."

# Copier le contenu du dossier lib vers le dossier WEB-INF/lib
cp -r "$lib"/* "$temp/WEB-INF/lib/"
echo "Dossier lib copié dans WEB-INF/lib."

# Copier le contenu du dossier web/views vers le dossier WEB-INF/views/jsp
cp -r "$web"/* "$temp/"
echo "Dossier web copié dans le dossier temporaire."

# Copier le fichier web.xml dans le dossier WEB-INF
cp -f "$xml" "$temp/WEB-INF/"
echo "Fichier web.xml copié dans WEB-INF."

# Copier les fichiers .class du dossier bin vers le dossier WEB-INF/classes
cp -r "$src"/* "$temp/WEB-INF/classes/"
echo "Fichiers .class copiés dans WEB-INF/classes."

# Créer un fichier WAR à partir du dossier temporaire
cd "$temp"
jar -cvf "$myfolder.war" .
echo "Fichier WAR créé : $myfolder.war."

# Déplacer le fichier WAR vers le dossier webapps de Tomcat
mv "$myfolder.war" "$webapps"
echo "Fichier WAR déplacé vers le dossier webapps de Tomcat."

# Afficher le contenu du dossier webapps pour vérifier le déploiement
ls -l "$webapps"

# Fin du déploiement
echo "Déploiement terminé."
