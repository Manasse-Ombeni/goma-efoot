#!/usr/bin/env bash
# Quitter le script en cas d'erreur
set -o errexit

# Installer les dépendances
pip install -r requirements.txt
pip install gunicorn

# Collecter les fichiers statiques
python manage.py collectstatic --no-input

# Appliquer les migrations de la base de données
python manage.py migrate

# Lancer TA commande personnalisée pour créer le superuser (efootball/1234)
python manage.py create_default_admin