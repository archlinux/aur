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

Le script est intelligent et effectue les actions suivantes :
1.  **Détecte le type de projet :** Il reconnaît s'il est lancé sur un dépôt Git standard (en lisant `.git/config`) ou sur un sous-dossier géré par `git subtree`. Dans ce dernier cas, il demande interactivement le chemin du projet GitLab correspondant.
2.  **Crée ou met à jour le projet cible** et synchronise les métadonnées (description, sujets/tags, avatar).
3.  **Génère un "Project Access Token"** avec des permissions limitées (`write_repository`) sur le projet cible.
4.  **Ajoute ce token comme une variable CI/CD** (`GITLAB_TARGET_TOKEN`) dans le projet source.
5.  **Vérifie la disponibilité des runners CI/CD :** Il s'assure qu'un runner fonctionnel (spécifique, de groupe ou d'instance) est utilisable par le projet. Si ce n'est pas le cas, il propose d'activer les permissions nécessaires (ex: activer les runners partagés).
6.  **Configure les tags du runner :** Il liste tous les tags disponibles parmi les runners accessibles et demande à l'utilisateur de choisir ceux à utiliser pour le job de synchronisation.
7.  **Génère le fichier `.gitlab-ci.yml`** final, incluant les tags de runner sélectionnés, pour configurer le miroir "push".

**[EN]**
**gitlab-sync** is a command-line tool that fully automates the process of setting up a mirror synchronization between a source GitLab repository (e.g., self-hosted) and a target repository (e.g., GitLab.com).

The script is smart and performs the following actions:
1.  **Detects project type:** It recognizes if it's run on a standard Git repository (by reading `.git/config`) or on a sub-directory managed by `git subtree`. In the latter case, it interactively prompts for the corresponding GitLab project path.
2.  **Creates or updates the target project** and synchronizes metadata (description, topics/tags, avatar).
3.  **Generates a "Project Access Token"** with limited permissions (`write_repository`) on the target project.
4.  **Adds this token as a CI/CD variable** (`GITLAB_TARGET_TOKEN`) in the source project.
5.  **Verifies CI/CD Runner availability:** It ensures that a functional runner (specific, group, or instance) is usable by the project. If not, it offers to enable the necessary permissions (e.g., enable shared runners).
6.  **Configures runner tags:** It lists all available tags from the accessible runners and asks the user to select which ones to use for the synchronization job.
7.  **Generates the final `.gitlab-ci.yml` file**, including the selected runner tags, to configure the "push" mirror.

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
