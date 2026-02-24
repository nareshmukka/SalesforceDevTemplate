param(
  [Parameter(Mandatory=$true)]
  [string]$ProjectName,

  [Parameter(Mandatory=$false)]
  [string]$BaseDir = "$HOME\Projects"
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command sf -ErrorAction SilentlyContinue)) {
    throw "Salesforce CLI (sf) not found."
}

# Ensure base dir exists
New-Item -ItemType Directory -Force -Path $BaseDir | Out-Null

Set-Location $BaseDir

Write-Host "Creating Salesforce project: $ProjectName"

# 1) Create SFDX project
sf project generate --name $ProjectName --template standard

$projectPath = Join-Path $BaseDir $ProjectName
Set-Location $projectPath

# 2) Create manifest/package.xml
New-Item -ItemType Directory -Force -Path "manifest" | Out-Null

@"
<?xml version="1.0" encoding="UTF-8"?>
<Package xmlns="http://soap.sforce.com/2006/04/metadata">
  <version>65.0</version>
</Package>
"@ | Out-File -Encoding UTF8 "manifest\package.xml"

# 3) Copy local DevTemplate pack
$templateRoot = "C:\DevTemplates\salesforce-ai-pack"

if (-not (Test-Path $templateRoot)) {
    throw "DevTemplate folder not found at: $templateRoot"
}

Copy-Item -Recurse -Force "$templateRoot\*" "$projectPath\"

Write-Host "✅ Project created with DevTemplate."
Write-Host "Location: $projectPath"
