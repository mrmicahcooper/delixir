docker build . -t mrmicahcooper/delixir:latest --no-cache && docker push mrmicahcooper/delixir:latest && k rollout restart deployment/delixir
