Param(
    [string]
    [Parameter(Mandatory=$false, Position=0)]
    $Name,

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
    Usage: ./$(Split-Path $MyInvocation.ScriptName -Leaf) [-Name ContainerName] [-Image ImageName] [-Tag TagName] [-Help]

    Options:
        -Name:  Docker container name.
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

# Run Docker container
Write-Output "[$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")] Running Docker container ..."

if ($Name -eq $null) {
    docker run -p 8000:8080 $Image`:$Tag
} else {
    docker run --name $Name -p 8000:8080 $Image`:$Tag
}

Write-Output "[$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")] Stopped Docker container ..."
