# Projet Minitrice

## Table des matières
- [Description du Projet](#description-du-projet)
- [Installation](#installation)
- [Exécution](#exécution)
- [Remarques](#remarques)
- [Réponses aux questions](#réponses-aux-questions)
- [Références/Liens utiles](#référencesliens-utiles)

## Description du Projet
Ce projet consiste à créer un programme capable de réaliser les 4 opérations arithmétiques élémentaires (+, -, * et /) entre deux nombres positifs.

## Installation
### Pré-requis
- Bash doit être installé sur votre système.

### Instructions d'Installation
1. Téléchargez le dépôt du projet.
   ```bash
   git clone <url-du-dépôt>
   cd <nom-du-dépôt>
   ```
2. Accordez les droits d'exécution sur les fichiers `minitrice` et `generator`.
   ```bash
   chmod +x minitrice.sh generator.sh
   ```

## Exécution
### Commandes d'Exécution
Pour exécuter le programme, utilisez les commandes suivantes :
- Pour exécuter une expression arithmétique :
  ```bash
  $ ./minitrice.sh [expression]
  ```
- Pour générer une expression :
  ```bash
  $ ./generator.sh [nombre]
  ```

### Exemples d'Utilisation
- Exemple d'utilisation pour réaliser une addition :
  ```bash
  $ ./minitrice.sh 3+3
  ```
  Sortie attendue :
  ```
  6
  ```
  Autre example : 
  ```bash
  $ ./generator.sh 45 | ./minitrice.sh
  ```

## Remarques
Aucune remarque particulière.

## Réponses aux questions

1. **Git est un gestionnaire de version décentralisé. Qu'est-ce que cela signifie ? Quel est le rôle joué par un dépôt central sur GitHub ou GitLab dans ce cas ? Justifier.**

   Un gestionnaire de version décentralisé signifie que chaque utilisateur a une copie complète de l'historique de toutes les modifications effectuées dans le projet, y compris toutes les versions des fichiers, sur leur propre machine. Ainsi, les utilisateurs peuvent travailler de manière indépendante sans nécessiter une connexion constante à un serveur central.

   Dans ce contexte, un dépôt central sur GitHub ou GitLab joue principalement le rôle de point de convergence où les développeurs peuvent partager et synchroniser leurs modifications. Bien que Git soit décentralisé, l'utilisation d'un dépôt centralisé facilite la collaboration, le suivi des contributions, et l'intégration continue. En pratique, le dépôt central sert de référence commune où les branches principales (comme `main` ou `master`) sont maintenues et où les pull requests sont gérées.

2. **À quoi sert la commande `git fetch -p` ?**

   La commande `git fetch -p` (ou `git fetch --prune`) sert à nettoyer les références de branches distantes qui n'existent plus. Lorsque vous utilisez cette commande, Git va comparer les branches distantes avec les références locales et supprimer celles qui ne sont plus présentes sur le dépôt distant, aidant ainsi à garder votre dépôt local propre et à jour.

3. **Dans quelles conditions est-ce qu'un conflit apparaît avec git ?**

   Un conflit apparaît avec Git lorsque des modifications concurrentes sont apportées à la même partie d'un fichier dans différentes branches ou commits. Cela se produit typiquement lors des opérations de merge ou de rebase, quand Git ne peut pas automatiquement combiner les modifications parce que les changements sont en désaccord ou se chevauchent.

4. **Lorsque vous résolvez un conflit, quelle est la dernière commande git que vous devez exécuter ?**

   Après avoir résolu un conflit, la dernière commande que vous devez exécuter est `git commit`. Cela enregistre les résolutions des conflits et termine l'opération de merge ou de rebase.

5. **Depuis GitHub, après avoir accepté une contribution sur la branche principale, que devez-vous faire pour mettre à jour votre branche principale localement ?**

   Pour mettre à jour votre branche principale localement après avoir accepté une contribution sur GitHub, vous devez exécuter les commandes suivantes :

   ```bash
   git checkout main
   git pull origin main
   ```

   Cela permet de passer sur la branche principale locale et de récupérer les dernières modifications du dépôt distant.

6. **Quelle est la différence entre les commandes `git reset --soft` et `git reset --hard` ? Donner un cas d'usage pratique et courant pour chacune de ces commandes.**

   - `git reset --soft <commit>` : Cette commande réinitialise l'index (staging area) et la branche courante à `<commit>`, mais laisse les modifications dans la zone de travail (working directory) intactes. Cela signifie que les fichiers modifiés restent dans l'état modifié et prêt à être commité à nouveau.

     **Cas d'usage** : Annuler le dernier commit tout en conservant les modifications pour les réviser et refaire un commit avec un message différent.

   - `git reset --hard <commit>` : Cette commande réinitialise l'index et la zone de travail pour qu'ils correspondent exactement à `<commit>`. Toute modification non enregistrée sera perdue.

     **Cas d'usage** : Annuler les modifications locales non commités et revenir à un état propre défini par `<commit>`, par exemple après avoir réalisé que les changements effectués localement ne sont pas nécessaires.

7. **Voici le log d'un dépôt git :**
   ~~~bash
   * 9f64652 - (HEAD -> main) 3 (il y a 2 secondes) <p. schuhmacher>
   * 68cd016 - 2 (il y a 18 secondes) <p. schuhmacher>
   * d47267f - 1 (il y a 43 secondes) <p. schuhmacher>
   ~~~
   **Quelle est la (ou les) commande à executer pour transformer les commits `9f64652` et `68cd016` en un seul commit avec un nouveau message ?**

   Pour transformer les commits `9f64652` et `68cd016` en un seul commit, vous pouvez utiliser une opération de rebase interactive :

   ```bash
   git rebase -i HEAD~2
   ```

   Dans l'éditeur qui s'ouvre, changez `pick` en `squash` (ou simplement `s`) pour le deuxième commit (`68cd016`), puis sauvegardez et fermez l'éditeur. Ensuite, vous pourrez modifier le message du commit combiné.

8. **Pourquoi est-il déconseillé de rebase une branche publique (branche sur laquelle travaille aussi d'autres personnes) ?**

   Il est déconseillé de rebase une branche publique parce que le rebase réécrit l'historique des commits. Cela change les identifiants des commits, ce qui peut causer des problèmes pour les autres développeurs qui ont déjà basé leur travail sur l'ancien historique de la branche. Ils devront forcer la mise à jour de leur propre branche, ce qui peut entraîner une perte de travail et des conflits difficiles à résoudre.

## Références/Liens utiles
- [ChatGPT](https://chatgpt.com) :)

