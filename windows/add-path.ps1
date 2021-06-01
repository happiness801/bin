param(
	[string]$newpath
)

if(-not($newpath)) { 
	# NOTE: To suppress this warning, set: $WarningPreference = "SilentlyContinue";
	#   before running this cmdlet
	Write-Warning "Since no path was specified, using current working directory ($pwd)"
	$newpath = $pwd
}

# Show old path
#Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name path
#echo $path

# Retrieve old path
$old = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name path).path

# Append new path
$new = "$old;$newpath"

# Set the value in the Registry
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name path -Value $new

# Refresh the Path environment variable
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

echo $new

