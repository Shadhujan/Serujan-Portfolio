Add-Type -AssemblyName System.Drawing
$results = @()
foreach ($file in Get-ChildItem -Path "public\WhatsApp*.jpeg") {
    $img = [System.Drawing.Image]::FromFile($file.FullName)
    $results += [PSCustomObject]@{
        Name = $file.Name
        Width = $img.Width
        Height = $img.Height
    }
    $img.Dispose()
}
$results | ConvertTo-Json
