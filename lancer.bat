@echo off
title Tribunal des Potes
cd /d "%~dp0"

echo.
echo  ==============================
echo     TRIBUNAL DES POTES
echo  ==============================
echo.

if not exist "index.html" (
  echo [ERREUR] index.html introuvable.
  echo Mets ce fichier lancer.bat dans le meme dossier que index.html.
  pause
  exit /b 1
)

where npx >nul 2>nul
if errorlevel 1 (
  echo [ERREUR] Node.js n'est pas installe.
  echo Installe-le depuis https://nodejs.org puis relance ce fichier.
  pause
  exit /b 1
)

where cloudflared >nul 2>nul
if errorlevel 1 (
  echo cloudflared n'est pas installe, installation en cours...
  where scoop >nul 2>nul
  if not errorlevel 1 (
    call scoop install cloudflared
  ) else (
    winget install --id Cloudflare.cloudflared -e --accept-source-agreements --accept-package-agreements
  )
  where cloudflared >nul 2>nul
  if errorlevel 1 (
    echo.
    echo [INFO] Installation terminee. Ferme cette fenetre et relance lancer.bat.
    pause
    exit /b 0
  )
)

echo [1/2] Demarrage du serveur local sur le port 8080...
start "Serveur du jeu (ne pas fermer)" /min cmd /k npx -y http-server -p 8080 -c-1
timeout /t 5 /nobreak >nul

echo [2/2] Ouverture du tunnel Cloudflare...
echo.
echo  Cherche la ligne avec une adresse en https://....trycloudflare.com
echo  C'est le lien a envoyer a tes potes.
echo  Laisse cette fenetre ouverte pendant toute la partie.
echo  Pour tout arreter : ferme cette fenetre et celle du serveur.
echo.
cloudflared tunnel --url http://localhost:8080

pause
