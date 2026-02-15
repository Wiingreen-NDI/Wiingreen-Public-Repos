## MDM Certificate Check
## This script checks a PC to see if there is a valid MD Intune Certificate

$cert = get-childitem -path cert:\LocalMachine\My | Where-Object {$_.Issuer -eq "Microsoft Intune MD Device CA" }

if ($cert) {
    Write-host "Intune certificate found on the device"

    $subject = (($cert | Select-Object Subject).Subject).TrimStart("CN=")

W   rite-Host "$subject is the cert subject"

} else {
    Write-host "No Intune cert found."
} 

