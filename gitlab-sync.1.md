% gitlab-sync(1) | Manuel de GitLab-Sync
% Barikad
% Septembre 2025

# NOM

gitlab-sync - [FR] Automatise la configuration d'un miroir GitLab. [EN] Automates the configuration of a GitLab mirror.

# SYNOPSIS

**gitlab-sync** [*options*] *chemin_absolu_du_dépôt*

# DESCRIPTION

**[FR]**
**gitlab-sync** est un outil en ligne de commande qui automatise entièrement le processus de mise en place d'une synchronisation miroir entre un dépôt GitLab source (ex: auto-hébergé) et un dépôt cible (ex: GitLab.com).

Le script effectue les actions suivantes :
1.  Identifie le projet source en lisant la configuration `remote.origin.url` du dépôt Git local.
2.  Crée un nouveau projet sur l'instance GitLab cible, ou met à jour le projet existant.
3.  Synchronise les métadonnées (description, sujets/tags, avatar) du projet source vers le projet cible.
4.  Génère un "Project Access Token" avec des permissions limitées (`write_repository`) sur le projet cible.
5.  Ajoute ce token comme une variable CI/CD (`GITLAB_COM_TOKEN`) dans le projet source.
6.  Configure le miroir "push" dans les paramètres CI/CD du projet source.

**[EN]**
**gitlab-sync** is a command-line tool that fully automates the process of setting up a mirror synchronization between a source GitLab repository (e.g., self-hosted) and a target repository (e.g., GitLab.com).

The script performs the following actions:
1.  Identifies the source project by reading the `remote.origin.url` configuration from the local Git repository.
2.  Creates a new project on the target GitLab instance, or updates an existing one.
3.  Synchronizes metadata (description, topics/tags, avatar) from the source project to the target.
4.  Generates a "Project Access Token" with limited permissions (`write_repository`) on the target project.
5.  Adds this token as a CI/CD variable (`GITLAB_COM_TOKEN`) in the source project.
6.  Configures the "push" mirror in the source project's CI/CD settings.

# OPTIONS

**--debug**
:   **[FR]** Active le mode de débogage. Affiche les requêtes et réponses API détaillées, ce qui est utile pour le dépannage.
:   **[EN]** Enables debug mode. Displays detailed API requests and responses, which is useful for troubleshooting.

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

**[FR] Utilisation avec le mode débogage**
```
gitlab-sync --debug /home/user/projets/mon-super-projet
```

**[EN] Standard usage**
```
gitlab-sync /home/user/projects/my-cool-project
```

**[EN] Usage with debug mode**
```
gitlab-sync --debug /home/user/projects/my-cool-project
```

# FICHIERS / FILES

`~/.config/gitlab_sync/config.ini`
:   Fichier de configuration utilisateur contenant les URLs et les jetons d'accès.
:   User configuration file containing URLs and access tokens.

# AUTEUR / AUTHOR

Maintenu par Barikad <arch@coqblin.net>.
