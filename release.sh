docker build . -t mrmicahcooper/delixir:latest --no-cache && docker push mrmicahcooper/delixir:latest && kubectl rollout restart deployment/delixir
