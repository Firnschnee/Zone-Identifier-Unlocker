param(
    [string]$Path = (Get-Location).Path
)

Get-ChildItem -Path $Path -Recurse | Unblock-File
