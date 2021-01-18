$XML = [XML](Get-Content .\config.xml)
New-Item -ItemType Directory -Force -Path $XML.Path
if(!(test-path $XML.Path)){
  throw "Invalid path."
}

$text = Get-Clipboard -Format Text
if ($text) {
  Remove-Item (Join-Path $XML.Path *) -Recurse
  $text > (Join-Path $XML.Path clipboard.txt)
  exit
}

$image = Get-Clipboard -Format Image
if ($image) {
  Remove-Item (Join-Path $XML.Path *) -Recurse
  $image.Save((Join-Path $XML.Path clipboard.png), [System.Drawing.Imaging.ImageFormat]::Png)
  exit
}

$files = Get-Clipboard -Format FileDropList
if ($files) {
  Remove-Item (Join-Path $XML.Path *) -Recurse
  $data = Join-Path $XML.Path clipboard
  New-Item -ItemType Directory -Force -Path $data
  $files | ForEach-Object{Copy-Item $_.FullName $data -Recurse}
  exit
}

Write-Error "The clipboard is empty or an unsupported file format."