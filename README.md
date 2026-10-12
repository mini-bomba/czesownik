# czesownik

projekt na bezpieczeństwo aplikacji webowych czy coś

klon reddita (bardzo kreatywny projekt)

## Odpalanie (Docker)

Wymagany Docker Desktop (Windows/macOS) albo Docker + compose plugin (Linux).

```bash
cp .env.example .env        # ustaw DJANGO_SECRET_KEY i DB_PASSWORD
docker compose up --build   # Postgres + Django, migracje odpalają się same
```

Strona: http://localhost:8000

Przydatne:

```bash
docker compose exec web python manage.py createsuperuser
docker compose exec web python manage.py makemigrations
docker compose exec db psql -U czesownik czesownik
docker compose down        # stop (dane w bazie zostają)
docker compose down -v     # stop + wyczyszczenie bazy
```

Kod jest zamontowany do kontenera, więc zmiany w plikach przeładowują serwer bez rebuilda.
Rebuild (`--build`) potrzebny tylko po zmianie `requirements.txt`.

## Odpalanie bez Dockera dla Django

Sama baza w Dockerze, Django z venva (`DB_HOST=localhost` w `.env`):

```bash
docker compose up -d db
python -m venv venv
source venv/bin/activate          # Windows Git Bash: source venv/Scripts/activate
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver
```
