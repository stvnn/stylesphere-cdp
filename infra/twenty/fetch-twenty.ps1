$dir = "infra/twenty"
$base = "https://raw.githubusercontent.com/twentyhq/twenty/refs/heads/main/packages/twenty-docker"
New-Item -ItemType Directory -Force $dir | Out-Null
Invoke-WebRequest "$base/docker-compose.yml" -OutFile "$dir/docker-compose.yml"
if (-not (Test-Path "$dir/.env")) { Invoke-WebRequest "$base/.env.example" -OutFile "$dir/.env" }
