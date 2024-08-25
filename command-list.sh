# Run linting
docker compose run --rm app sh -c "flake8"

# Start Django Project
docker compose run --rm app sh -c "django-admin startproject app ."

# Start development server
docker compose up

# Test
docker compose run --rm app sh -c "python manage.py test"

# Build, build everytime Dockerfile changes
docker compose build

# Clean
docker compose down