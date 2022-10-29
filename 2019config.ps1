Configuration Server2019
{
    Import-DSCResource -ModuleName PSDscResources -Name Registry -ModuleVersion 2.12.0.0
    Node localhost
    {
        
        Registry SpectreVariant2 {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management'
            ValueName = 'FeatureSettingsOverride'
            ValueData = '72'
            ValueType = 'DWORD'
        }

        Registry SpectreVariant2-1 {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management'
            ValueName = 'FeatureSettingsOverrideMask'
            ValueData = '3'
            ValueType = 'DWORD'
        }

        Registry IE-HardeningFeatureControl {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\'
            ValueName = 'FEATURE_ALLOW_USER32_EXCEPTION_HANDLER_HARDENING'
            ValueData = 'Default'
          
        }

        Registry IE-HardeningIexplore {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_Machine\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ALLOW_USER32_EXCEPTION_HANDLER_HARDENING'
            ValueName = 'iexplore.exe'
            ValueData = '00000001'
            ValueType = 'DWORD'
            DependsOn = '[Registry]IE-HardeningFeatureControl'
        }

        Registry IE-HardeningFeatureControlAllowUser32Wow64 {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl'
            ValueName = 'FEATURE_ALLOW_USER32_EXCEPTION_HANDLER_HARDENING'
            ValueData = 'Default'
            
        }

        Registry IE-HardeningIexploreWow64 {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ALLOW_USER32_EXCEPTION_HANDLER_HARDENING'
            ValueName = 'iexplore.exe'
            ValueData = '00000001'
            ValueType = 'DWORD'
            DependsOn = '[Registry]IE-HardeningFeatureControlAllowUser32Wow64'
        }

        Registry IE-PrintDisclosureKey {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl'
            ValueName = 'FEATURE_ENABLE_PRINT_INFO_DISCLOSURE_FIX'
            
        }

        Registry IE-PrintDisclosureFix {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ENABLE_PRINT_INFO_DISCLOSURE_FIX'
            ValueName = 'iexplore.exe'
            ValueData = '1'
            ValueType = 'DWORD'
            DependsOn = '[Registry]IE-PrintDisclosureKey'
        }

        Registry IE-PrintDisclosureFixWow64Key {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl'
            ValueName = 'FEATURE_ENABLE_PRINT_INFO_DISCLOSURE_FIX'
        }

        Registry IE-PrintDisclosureFixWow64 {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ENABLE_PRINT_INFO_DISCLOSURE_FIX'
            ValueName = 'iexplore.exe'
            ValueType = 'DWORD'
            DependsOn = '[Registry]IE-PrintDisclosureFixWow64Key'
        }

        Registry Change-ShellToPowerShell {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon'
            ValueName = 'shell'
            ValueData = 'powershell.exe'
        }

        Registry Disable-CachedLogonCredentials {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon'
            ValueName = 'CachedLogonsCount'
            ValueData = '0'
            ValueType = 'String'   
        }

        Registry Restrinc-NullSession {
            Ensure    = 'Present'
            Key       = 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\LSA'
            ValueName = 'RestrictAnonymous'
            ValueData = '1'
            ValueType = 'DWord'   
        }
    }
}

Server2019 -OutputPath .
Start-DscConfiguration -Path . -Wait -Verbose -Force
