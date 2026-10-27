# Tribunal des Potes 🎮

Un jeu de soirée multijoueur où l'on juge ses potes : votes, tier lists, anecdotes, imposteur, procès…
Chacun joue sur son téléphone, sans compte et sans installation.

## Jouer

1. Ouvrir le jeu (lien GitHub Pages ou `index.html` hébergé n'importe où).
2. Un joueur clique sur **Créer une partie** et partage le **code à 4 lettres**.
3. Les autres entrent le code et cliquent sur **Go**.
4. L'hôte choisit la version (**😇 Soft** ou **🔥 Hardcore 18+**), règle le nombre de questions par jeu, puis lance la partie.

## Les 9 mini-jeux

| Mini-jeu | Principe |
|---|---|
| Une seule réponse | Tout le monde vote pour un joueur |
| Deux réponses | On vote pour deux joueurs |
| Test de gentillesse | Une réaction gentille ou pas gentille, à la vue de tous |
| Tu préfères | Deux options, on choisit son camp |
| Je n'ai jamais | « Jamais » ou « Déjà fait » |
| Thèmes anecdotes | Anecdotes anonymes, on devine l'auteur |
| Les tier list | Classement de S à D, on voit qui a voté quoi |
| L'imposteur | Un joueur a reçu une autre question : démasquez-le |
| Le procès | Le groupe désigne un accusé, qui se défend 30 s avant le verdict |

À la fin : titres (Cible n°1, Intouchable, Ange, Démon, Meilleur détective…) et récap complet par catégorie.

L'imposteur et Le procès ont leur propre **classement à points** (gagnants / perdants à chaque tour, podium et lanterne rouge en fin de partie).

## Fonctionnalités

- Questions modifiables dans **Gérer les questions** (sauvegarde / import possibles)
- Les questions déjà jouées sont mises de côté pour les parties suivantes
- Deux versions : 😇 Soft et 🔥 Hardcore (18+), choisies par l'hôte dans le lobby
- Musique de fond générée en direct (100 % originale), volume réglable par joueur
- Fond d'écran animé en pixel art (ciel étoilé + tribunal), aux couleurs de la version choisie
- Intro : la boîte du jeu de société en 3D sur une table, qui s'ouvre
- Écran d'accueil avec marteau de juge animé (« ORDRE ! »)
- Un joueur qui recharge la page retrouve sa place

## Héberger

- **GitHub Pages** : *Settings → Pages → Deploy from a branch → `main` / root*. Le jeu sera sur `https://<pseudo>.github.io/<nom-du-dépôt>/`.
- **Cloudflare Pages** : `npx wrangler pages deploy . --project-name=tribunal-des-potes`
- **Depuis son PC (Windows)** : double-cliquer sur `lancer.bat` (serveur local + tunnel Cloudflare temporaire).

## Technique

Un seul fichier `index.html`, sans build. La connexion entre joueurs passe par [PeerJS](https://peerjs.com/) (WebRTC) : c'est l'appareil de l'hôte qui fait tourner la partie.
