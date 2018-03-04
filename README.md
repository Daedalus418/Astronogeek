# ASTRONOGEEK Ideas :earth_africa: :rocket: :star:

J'ai réalisé ce site en une journée.
Le "challenge de départ" était une demande da la chaîne Youtube Astronogeek de lui proposer une solution
pour permettre à ses abonnés de proposer de futures idées de vidéos et de pouvoir voter.
Je suis partie en mode hackathon pour coder une solution avec Ruby On Rails permettant à un utilisateur:
- de s'inscrire,
- d'enregistrer une idée et de la décrire,
- de voter pour les idées des autres,
- de pouvoir retirer son vote,
- de commenter,
- de modifier ou effacer son/ses commentaires(s).

Les idées sont ensuite triées par popularité sur la page d'accueil.
Elles sont aussi triées par date de création sur la page dernières idées.
Un vote automatique est également ajouté à une idée nouvellement créée.

**Améliorations**

Je me suis imposée une limite temporelle car mon projet pouvait ne pas être accepté (Astronogeek disposait déjà
d'un site Wordpress et finalement, quelqu'un lui a montré l'existance d'un plug-in).

- Le lien pour se connecter/s'enregister => changer la couleur, régler l'alignement et la taille.
- Permettre de répondre à un commentaire.
- Supprimer la page "Dernières idées" et mettre un filtre sur la page d'accueil.
- Pourquoi pas permettre la recherche.
- Révoir le système de calcul des votes: j'ai repéré une erreur où l'utilisateur peut ajouter un vote supplémentaire sur l'une de ses idées sans que ce soit pris en compte dans le calcul et il peut retirer remettre le compteur à zéro en retirant son vote.

## Requis

- [Ruby](https://www.ruby-lang.org/en/)
- [Ruby on Rails](http://rubyonrails.org/)
- [Bundler](http://bundler.io/)

## Exécution

### Installation

```bash
git clone git@github.com:Daedalus418/Astronogeek.git
cd Astronogeek
bundle install
rails db:create db:migrate
```
### Développement

```bash
rails server
```
## Gem ajoutées
- 'bcrypt' :arrow_right: Permet d'utiliser "has_secure_password" et d'avoir une authentication basique.
- 'bootstrap-sass'
- 'pg' :arrow_right: database avec Postgresql

