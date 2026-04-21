#!/bin/bash
# push-pick-dashboard.sh - Push ONLY Pick Dashboard 3.6.6 to GitHub
# Repo: https://github.com/zeeman1258/Dashboard-3.6.4.git

echo "=== PUSH PICK DASHBOARD 3.6.6 TO GITHUB ==="

# 1. Clone/pull repo
if [ ! -d "Dashboard-3.6.4" ]; then
  git clone https://github.com/zeeman1258/Dashboard-3.6.4.git
  cd Dashboard-3.6.4
else
  cd Dashboard-3.6.4
  git pull origin main
fi

# 2. Copy ONLY pick dashboard files (no analytics)
echo "Copying Pick Dashboard 3.6.6..."
if [ -d "../pick-dashboard-app-3.6.6" ]; then
  rm -rf pick-dashboard-app-3.6.6
  cp -r ../pick-dashboard-app-3.6.6 .
elif [ -d "../pick-dashboard-app" ]; then
  rm -rf pick-dashboard-app
  cp -r ../pick-dashboard-app .
else
  echo "ERROR: No pick dashboard found in parent folder"
  exit 1
fi

# 3. Update README
cat > README.md << 'EOF'
# Pick Dashboard 3.6.6

Multi-user warehouse route picking dashboard.

## Launch
```bash
python3 pick-dashboard-app-3.6.6/pick-dashboard-app/app.py
```

## Repo
https://github.com/zeeman1258/Dashboard-3.6.4.git
EOF

# 4. Git add/commit/push
git add .
git commit -m "Push Pick Dashboard 3.6.6"
git push origin main