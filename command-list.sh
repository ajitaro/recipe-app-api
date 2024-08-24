# Run linting
docker compose run --rm app sh -c "flake8"

# Start Django Project
docker compose run --rm app sh -c "django-admin startproject app ."

# Start development server
docker compose up