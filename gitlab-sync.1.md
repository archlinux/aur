% gitlab-sync(1) | Manuel de GitLab-Sync
% Joachim COQBLIN
% Août 2025

# NOM

gitlab-sync - [FR] Automatise la configuration d'un miroir GitLab. [EN] Automates the configuration of a GitLab mirror.

# SYNOPSIS

**gitlab-sync** *chemin_absolu_du_dépôt*

# DESCRIPTION

**[FR]**
**gitlab-sync** est un outil en ligne de commande qui automatise entièrement le processus de mise en place d'une synchronisation miroir entre un dépôt GitLab source (ex: auto-hébergé) et un dépôt cible (ex: GitLab.com).

Le script effectue les actions suivantes :
1.  Crée un nouveau projet sur l'instance GitLab cible.
2.  Génère un "Project Access Token" avec des permissions limitées (`write_repository`) sur le projet cible.
3.  Ajoute ce token comme une variable CI/CD (`GITLAB_COM_TOKEN`) dans le projet source.
4.  Configure le miroir "push" dans les paramètres CI/CD du projet source.

**[EN]**
**gitlab-sync** is a command-line tool that fully automates the process of setting up a mirror synchronization between a source GitLab repository (e.g., self-hosted) and a target repository (e.g., GitLab.com).

The script performs the following actions:
1.  Creates a new project on the target GitLab instance.
2.  Generates a "Project Access Token" with limited permissions (`write_repository`) on the target project.
3.  Adds this token as a CI/CD variable (`GITLAB_COM_TOKEN`) in the source project.
4.  Configures the "push" mirror in the source project's CI/CD settings.

# CONFIGURATION

**[FR]**
Avant la première utilisation, un fichier de configuration doit être créé à l'emplacement `~/.config/gitlab_sync/config.ini`.

Pour ce faire, copiez le modèle fourni par le paquet :
```
mkdir -p ~/.config/gitlab_sync
cp /usr/share/doc/gitlab-sync/config.ini.example ~/.config/gitlab_sync/config.ini
```

Éditez ensuite ce nouveau fichier pour y insérer vos URLs d'instances GitLab et vos jetons d'accès personnels (Personal Access Tokens).

**[EN]**
Before the first use, a configuration file must be created at `~/.config/gitlab_sync/config.ini`.

To do this, copy the template provided by the package:
```
mkdir -p ~/.config/gitlab_sync
cp /usr/share/doc/gitlab-sync/config.ini.example ~/.config/gitlab_sync/config.ini
```

Then, edit this new file to add your GitLab instance URLs and your Personal Access Tokens.

# EXEMPLES / EXAMPLES

**[FR] Utilisation standard**
```
gitlab-sync /home/user/projets/mon-super-projet
```

**[FR] Traitement en masse**
```
while read repo_path; do
  gitlab-sync "$repo_path"
done < liste_depots.txt
```

**[EN] Standard usage**
```
gitlab-sync /home/user/projects/my-cool-project
```

**[EN] Bulk processing**
```
while read repo_path; do
  gitlab-sync "$repo_path"
done < repo_list.txt
```

# FICHIERS / FILES

`~/.config/gitlab_sync/config.ini`
:   Fichier de configuration utilisateur contenant les URLs et les jetons d'accès.
:   User configuration file containing URLs and access tokens.

# AUTEUR / AUTHOR

Maintenu par Barikad <arch@coqblin.net>.
