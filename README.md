# 🚀 Symfony 8 Docker Boilerplate

Un environnement de développement Docker prêt à l'emploi, optimisé pour Symfony 8. Il intègre un serveur web performant, une base de données robuste, un intercepteur d'emails et un Makefile pour automatiser toutes les tâches courantes.

## 🛠️ Stack Technique

* **PHP** : 8.4
* **Serveur Web** : FrankenPHP
* **Base de données** : PostgreSQL 16
* **Mails** : Mailpit (Catch-all pour le développement)
* **Framework** : Symfony 8 (Skeleton + ORM + MakerBundle + Fixtures)

## 📋 Prérequis

* [Docker](https://docs.docker.com/get-docker/) et Docker Compose installés sur ta machine.
* L'outil `make` disponible dans ton terminal.

## 🏁 Installation Rapide

1. **Cloner ce dépôt** pour démarrer un nouveau projet :
   ```bash
   git clone [https://github.com/DukeCabo0m/symfony-boilerplate.git](https://github.com/DukeCabo0m/symfony-boilerplate.git) nom-de-mon-nouveau-projet
   cd nom-de-mon-nouveau-projet
   ```

2. **Lancer l'installation automatisée** :
   ```bash
   make install
   ```
   *Cette commande va générer automatiquement le fichier `.env.local`, monter les conteneurs, installer Symfony 8, configurer Doctrine, le MakerBundle et les Fixtures.*

## 🌍 Accès aux Services

Une fois l'environnement démarré (`make up`), les services sont accessibles aux adresses suivantes :

* **Application Web** : [https://localhost](https://localhost) *(Ignorer l'avertissement SSL lié au certificat auto-signé de développement)*
* **Interface Mailpit** : [http://localhost:8025](http://localhost:8025)
* **Base de données** : Port `5432` (Utilisateur: `app`, Mot de passe: `secret`, BDD: `app`)

## 🧰 Commandes Makefile

Le projet inclut un `Makefile` pour simplifier la gestion des conteneurs et de Symfony.

### 🐳 Docker & Système
| Commande | Description |
| :--- | :--- |
| `make up` | Démarre tous les conteneurs en arrière-plan (et génère le `.env.local` si manquant). |
| `make down` | Arrête et détruit les conteneurs du projet. |
| `make shell` | Ouvre un terminal `sh` à l'intérieur du conteneur PHP. |
| `make logs` | Affiche les logs des conteneurs en temps réel. |
| `make install`| Initialise le projet Symfony de zéro (à ne lancer qu'une fois). |

### 💾 Base de Données (Doctrine)
| Commande | Description |
| :--- | :--- |
| `make db-create` | Crée la base de données configurée dans le `.env.local`. |
| `make migrate` | Exécute les migrations en attente. |
| `make fixtures` | Charge les fausses données (fixtures) en base. |
| `make db-reset` | **Magique :** Supprime la BDD, la recrée, passe les migrations et charge les fixtures. |