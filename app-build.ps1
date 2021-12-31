# Build app
Write-Output "[$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")] Building app ..."

cd ./app

gatsby build

move ./public ../docs

cd ..

Write-Output "[$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")] App has been built ..."
