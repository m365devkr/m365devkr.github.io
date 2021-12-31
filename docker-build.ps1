Param(
    [string]
    [Parameter(Mandatory=$false)]
    $Image = "m365devkr",

    [string]
    [Parameter(Mandatory=$false)]
    $Tag = "latest",

    [switch]
    [Parameter(Mandatory=$false)]
    $Help
)

function Show-Usage {
    Write-Output "
    Usage: ./$(Split-Path $MyInvocation.ScriptName -Leaf) [-Image ImageName] [-Tag TagName] [-Help]

    Options:
        -Image: Docker image name.
        -Tag:   Docker image tag name.
        -Help:  Show this message.

"

    Exit 0
}

# Show usage
if ($Help -eq $true) {
    Show-Usage
    Exit 0
}

# Build Docker image
Write-Output "[$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")] Building Docker image ..."

cd ./app

docker build . -t $Image`:$Tag

cd ..

Write-Output "[$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")] Docker image has been built. Run 'docker-run.ps1' to run this Docker image ..."
