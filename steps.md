# Steps
Create a project

`mix phx.new delixir --no-ecto`

Update the  `page/index.html.eex` controller and template to show current node (`node()`) and a list of connected nodes (`Node.list()`)
- add `<p><%=node()%></p>` somewhere to the template
- add `<%= for item <- Node.list(), do: "<li>#{item}</li>"%>` somewhere

Run the server and make sure it's working
- `mix phx.server`
- visit localhost:4000
Setup for a release

- Make sure your prod config is all setup
- set `server: true` in `config/prod.secret.exs`
    - add this line `config :delixir, DelixirWeb.Endpoint, server: true`
- run `mix release.init`
- add `export RELEASE_DISTRIBUTION=name` to the `rel/env.sh.eex` file
- add `export RELEASE_NODE=<%= @release.name %>@${POD_IP}` to the `rel/env.sh.eex` file
- run `mix release`
- make sure the release works

Create a Dockerfile to build the release
- Copy the Dockerfile from https://hexdocs.pm/phoenix/releases.html#containers
- Uncomment the `# COPY rel rel` line; We definitely wanna use the rel. That's where our custom settings are

Create a docker image
- `docker build . -t <imagename>:<tagname> --no-cache --progress plain`

Push your docker image up to a registry

- `docker push mrmicahcooper/delixir:latest`

Create a K8s cluster (I used Linode's Kubernetes service - LKE)
- Configure a deployment
  - Set up an ENV var for the Pod's IP
- Configure a service for Libcluster to find pods
- Configure another service to expose your app
- Install ingress-nginx with helm
- Create an ingress for a domain
