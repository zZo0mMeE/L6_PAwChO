PAwChO – Laboratorium 6

Repozytorium zawiera plik `Dockerfile`, który umożliwia zbudowanie obrazu z użyciem wieloetapowego builda, montowania klucza SSH oraz publikacji obrazu do GitHub Container Registry (ghcr.io).

Opublikowany obraz:

ghcr.io/zzo0mmee/frontend:lab6

Można go pobrać i uruchomić lokalnie:

docker pull ghcr.io/zzo0mmee/frontend:lab6
docker run -p 8080:80 ghcr.io/zzo0mmee/frontend:lab6
