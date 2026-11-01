# AD account administration commands used for the IT-1 training request.
# Run only in an authorized, isolated Active Directory home lab.
# User and group were originally created through ADUC (not by this script).
# Requires appropriate AD permissions and the ActiveDirectory PowerShell module.

Import-Module ActiveDirectory

# Confirm the test account exists before changing any properties.
Get-ADUser -Identity 'HSD01' -Properties Enabled,Description |
    Select-Object Name,SamAccountName,Enabled,Description

# Link the test account record to the training ticket.
Set-ADUser -Identity 'HSD01' -Description 'IT Support | Jira IT-1 | Onboarding Lab'

# Verify the updated description and account state.
Get-ADUser -Identity 'HSD01' -Properties Description,Enabled |
    Select-Object Name,SamAccountName,Enabled,Description

# Verify membership in the approved lab group.
Get-ADPrincipalGroupMembership -Identity 'HSD01' |
    Select-Object Name
