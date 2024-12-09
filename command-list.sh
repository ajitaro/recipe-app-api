# docker compose run --rm NAMA_CONTAINER sh -c "flake8"
# Run linting
docker compose run --rm app sh -c "flake8"

# Start Django Project
docker compose run --rm app sh -c "django-admin startproject app ."

# Start development server
docker compose up

# Test
docker compose run --rm app sh -c "python manage.py test"

# Linting
docker compose run --rm app sh -c "python manage.py wait_for_db"
docker compose run --rm app sh -c "python manage.py wait_for_db && flake8"

# Build, build everytime Dockerfile changes
docker compose build

# Clean
docker compose down

# Create new django app, core
docker compose run --rm app sh -c "python manage.py startapp core"

# Make migrations
docker compose run --rm app sh -c "python manage.py makemigrations"

# Migrate
docker compose run --rm app sh -c "python manage.py wait_for_db && python manage.py migrate"

# clear database in volume
docker volume rm recipe-app-api_dev-db-data

# create superuser
docker compose run --rm app sh -c "python manage.py createsuperuser"

# Create new django app, user
docker compose run --rm app sh -c "python manage.py startapp user"

# Create new django app, recipe
docker compose run --rm app sh -c "python manage.py startapp recipe"

# Run docker for production
docker compose -f docker-compose-deploy.yml up