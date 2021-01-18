$XML = [XML](Get-Content .\config.xml)

$cliptext = Join-Path $XML.Path clipboard.txt
if (test-path $cliptext) {
  Get-Content $cliptext | Set-Clipboard
  exit
}

$clipimage = Join-Path $XML.Path clipboard.png
if (test-path $clipimage) {
  Add-Type -Assembly System.Windows.Forms
  Add-Type -Assembly System.Drawing
  $image = [Drawing.Image]::FromFile($clipimage)
  [Windows.Forms.Clipboard]::SetImage($image)
  exit
}

$clipdir = Join-Path $XML.Path clipboard
if (test-path $clipdir) {
  Set-Clipboard -Path (Join-Path $clipdir *)
  exit
}

Write-Error "The file or directory is not found."